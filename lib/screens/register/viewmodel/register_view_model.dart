part of '../register_imports.dart';

class RegisterViewModel {
  /// Services

  final _alertService = locator<AlertService>();
  final _navService = locator<NavigationService>();

  /// Variables

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GenericCubit<bool> _showPasswordCubit = GenericCubit(true);

  /// API Login

  Future<void> _registerByEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      if (context.mounted) {
        _alertService.showAlert(
          title: 'Please Sign in Now',
          isSuccess: true,
        );
        _loginButtonAction(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _alertService.showAlert(title: e.message ?? "");
        // _alertService.showAlert(title: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        _alertService.showAlert(
          title: 'The account already exists for that email.',
        );
      } else {
        _alertService.showAlert(title: e.message ?? "");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// buttons actions

  void _loginButtonAction(BuildContext context) {
    _navService.pushAndRemoveAll(context, path: MyRoutes.login);
  }
}
