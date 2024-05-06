part of '../splash_imports.dart';

class SplashDialog extends StatelessWidget {
  const SplashDialog({
    super.key,
    required this.loginViewModel,
  });

  final SplashViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15).r,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: MyStyles.borderRadius(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title:
                'You can login easily using finger Print you want active it ?',
            textAlign: TextAlign.center,
            style: MyStyles.textStyle(
              fontSize: 14,
            ),
          ),
          15.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    loginViewModel._prefService.fingerPrintActive = true;
                    loginViewModel._authenticateWithBiometrics(context);
                  },
                  title: 'Confirm',
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: CustomButton(
                  onTap: () {
                    context.pushNamed(MyRoutes.login);
                  },
                  title: 'Cancel',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
