part of '../login_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = LoginViewModel();

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
          title: 'Login',
          style: MyStyles.textStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        children: [
          50.verticalSpace,
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
            onTap: () => viewModel._loginWithEmail(context),
            marginHorizontal: 20,
            marginVertical: 10,
            title: 'Login',
          ),
          GestureDetector(
            onTap: () => viewModel._registerButtonAction(context),
            child: const Center(
              child: CustomText(
                title: "Don't have account ? sign up now",
              ),
            ),
          ),
          20.verticalSpace,
          GestureDetector(
            onTap: () => viewModel._handleSignIn(context),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ).r,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: MyStyles.borderRadius(
                    radius: 10,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomLocalImage(
                      image: MyAssets.google,
                      width: 23,
                      height: 23,
                    ),
                    10.horizontalSpace,
                    CustomText(
                      title: "Sign in by google",
                      style: MyStyles.textStyle(
                        color: MyColors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
