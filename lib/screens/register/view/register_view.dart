part of '../register_imports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel viewModel = RegisterViewModel();

  @override
  void dispose() {
    viewModel._email.dispose();
    viewModel._password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Register',
          style: MyStyles.textStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        children: [
          CustomTextField(
            title: 'Email',
            controller: viewModel._email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            title: 'Password',
            controller: viewModel._password,
            passwordBloc: viewModel._showPasswordCubit,
            obscureText: true,
          ),
          CustomButton(
            onTap: () => viewModel._registerByEmail(context),
            marginHorizontal: 20,
            marginVertical: 10,
            title: 'Register',
          ),
          GestureDetector(
            onTap: () {
              viewModel._loginButtonAction(context);
            },
            child: const Center(
              child: CustomText(
                title: "have account ? Login in now",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
