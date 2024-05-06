part of '../splash_imports.dart';

class SplashErrorDialog extends StatelessWidget {
  const SplashErrorDialog({
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
            title: 'Network Error Continue to offline reading ?',
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
                    context.pushReplacementNamed(MyRoutes.articles);
                  },
                  title: 'Confirm',
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: CustomButton(
                  onTap: () {
                    exit(0);
                  },
                  title: 'Close App',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
