part of '../splash_imports.dart';

class SplashViewModel {
  /// services

  final _navService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final _prefService = locator<LocalStorageService>();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  void initAnimation(TickerProvider data, BuildContext context) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: data,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.2, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _initData(context);
      }
    });

    _animationController.forward();
  }

  void _initData(BuildContext context) {
    _auth.isDeviceSupported().then((value) {
      if (value) {
        if (_prefService.isLogin) {
          _checkBiometric(context);
        } else {
          context.goNamed(MyRoutes.login);
        }
      }
    });
  }

  /// Local Auth

  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> _checkBiometric(BuildContext context) async {
    var canCheckBiometric = await _auth.canCheckBiometrics;
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (canCheckBiometric && availableBiometrics.isNotEmpty) {
      if (_prefService.fingerPrintActive) {
        if (!context.mounted) return;
        await _authenticateWithBiometrics(context);
      } else {
        if (!context.mounted) return;
        await _alertService.showCustomDialog(
          context: context,
          isFullScreen: false,
          child: SplashDialog(loginViewModel: this),
        );
      }
    } else {
      if (!context.mounted) return;
      _navService.pushAndRemoveAll(context, path: MyRoutes.login);
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _authenticateWithBiometrics(BuildContext context) async {
    try {
      final authenticated = await _auth.authenticate(
        localizedReason: 'Authenticate with fingerprint or Face ID',
        options: const AuthenticationOptions(
          stickyAuth: false,
          biometricOnly: true,
        ),
      );

      var (email, pass) = await _restoreSecureData();

      if (authenticated) {
        if (_prefService.isSignByGoggle) {
          await _googleSignIn.signInSilently();
          if (context.mounted) {
            _navService.pushAndRemoveAll(context, path: MyRoutes.articles);
          }
        } else {
          if (!context.mounted) return;
          await _loginWithEmail(
            context,
            email: email ?? "",
            password: pass ?? "",
          );
        }
      }
    } on PlatformException catch (e) {
      if (e.code == 'NotAvailable') {
        if (!context.mounted) return;
        _navService.pushAndRemoveAll(context, path: MyRoutes.login);
      }
      if (kDebugMode) {
        print(e);
      }

      return;
    }
  }

  Future<void> _loginWithEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        _navService.pushAndRemoveAll(context, path: MyRoutes.articles);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _alertService.showAlert(title: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _alertService.showAlert(
          title: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'network-request-failed') {
        if (!context.mounted) return;
        await _alertService.showCustomDialog(
          context: context,
          isFullScreen: false,
          child: SplashErrorDialog(loginViewModel: this),
        );
      } else {
        _alertService.showAlert(title: e.message ?? "");
      }
    }
  }

  /// secure storage

  final _storage = const FlutterSecureStorage();

  Future<(String?, String?)> _restoreSecureData() async {
    var savedEmail = await _storage.read(key: AppSecureStorage.email);
    var savedPassword = await _storage.read(key: AppSecureStorage.password);
    return (savedEmail, savedPassword);
  }
}
