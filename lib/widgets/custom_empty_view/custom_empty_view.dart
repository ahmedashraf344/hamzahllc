part of '../widgets_imports.dart';

class CustomEmptyView extends StatelessWidget {
  const CustomEmptyView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.buttonText,
    required this.buttonAction,
  });

  final String image;
  final String text1;
  final String text2;
  final String buttonText;
  final VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLocalImage(
          image: image,
          width: double.infinity,
          height: 200,
        ),
        30.verticalSpace,
        CustomText(
          title: text1,
          textAlign: TextAlign.center,
          style: MyStyles.textStyle(
            fontSize: 22,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomText(
          title: text2,
          textAlign: TextAlign.center,
          style: MyStyles.textStyle(
            fontSize: 22,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomButton(
          title: buttonText,
          marginHorizontal: 20,
          marginVertical: 20,
          onTap: buttonAction,
        ),
      ],
    );
  }
}
