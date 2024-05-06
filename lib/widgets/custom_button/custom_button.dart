part of '../widgets_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.reverse = false,
    this.icon = '',
    this.marginHorizontal = 0,
    this.marginVertical = 0,
  });

  final String title;
  final String? icon;
  final VoidCallback? onTap;
  final double marginHorizontal;
  final double marginVertical;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal,
          vertical: marginVertical,
        ).r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: MyStyles.borderRadius(
            radius: 10,
          ),
          border: MyStyles.borderAll(
            color: MyColors.white,
            width: 1.5,
          ),
        ),
        child: CustomText(
          title: title,
          style: MyStyles.textStyle(
            fontSize: 13,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }
}
