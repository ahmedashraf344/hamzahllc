part of '../login_imports.dart';

class LoginViewModel {
  /// Services

  final _navService = locator<NavigationService>();
  final _alertService = locator<AlertService>();
  final _prefService = locator<LocalStorageService>();

  /// secure storage

  final _storage = const FlutterSecureStorage();

  void _storeSecureData() {
    _storage.write(key: AppSecureStorage.email, value: _email.text);
    _storage.write(key: AppSecureStorage.password, value: _password.text);
  }

  /// Variables

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GenericCubit<bool> _showPasswordCubit = GenericCubit(true);

  /// API Login

  Future<void> _loginWithEmail(BuildContext context) async {
    try {
      _alertService.showLoadingDialog(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      _storeSecureData();

      if (context.mounted) {
        _navigateToArticles(context);
      }
      _alertService.closeLoading();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _alertService.showAlert(title: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _alertService.showAlert(
          title: 'Wrong password provided for that user.',
        );
      } else {
        _alertService.showAlert(title: e.message ?? "");
      }
      _alertService.closeLoading();
    }
  }

  /// google sign in

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      var data = await _googleSignIn.signIn();
      await _storage.write(
        key: AppSecureStorage.email,
        value: data?.email ?? "",
      );
      _prefService.isSignByGoggle = true;
      if (!context.mounted) return;
      _navigateToArticles(context);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  /// buttons actions

  void _registerButtonAction(BuildContext context) {
    _navService.push(context, path: MyRoutes.register);
  }

  void _navigateToArticles(BuildContext context) {
    _prefService.isLogin = true;
    _navService.pushAndRemoveAll(context, path: MyRoutes.articles);
  }
}
