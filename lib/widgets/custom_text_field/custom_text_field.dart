part of "../widgets_imports.dart";

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.maxLength = 300,
    this.initialValue = "",
    this.hintText = "",
    this.title = "",
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.cancelButton,
    this.controller,
    this.suffixIcon,
    this.showIcon = false,
    this.showFlag = false,
    this.inRow = false,
    this.passwordBloc,
    this.validator,
    this.autoValidationMode = AutovalidateMode.always,
  });

  final String? initialValue, hintText, title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLength, maxLines;
  final bool? readOnly, obscureText, showIcon, showFlag;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged, onFieldSubmitted;
  final VoidCallback? onTap;
  final GenericCubit<bool>? cancelButton;
  final Widget? suffixIcon;
  final GenericCubit<bool>? passwordBloc;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidationMode;
  final bool inRow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: inRow ? 10 : 24,
        right: inRow ? 10 : 24,
        top: 16,
        bottom: 10,
      ).r,
      child: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
        bloc: passwordBloc ?? GenericCubit(true),
        builder: (context, state) {
          return TextFormField(
            validator: validator,
            keyboardType: keyboardType,
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
            ],
            style: MyStyles.textStyle(
              fontSize: 13,
              color: MyColors.black,
            ),
            onTap: onTap,
            autovalidateMode: autoValidationMode,
            focusNode: focusNode,
            obscureText: obscureText! && state.data,
            maxLines: maxLines,
            readOnly: readOnly!,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              suffixIcon: buildSuffixIcon(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              hintStyle: MyStyles.textStyle(
                fontSize: 13,
                color: MyColors.black,
              ),
              label: Offstage(
                offstage: title == '',
                child: CustomText(
                  title: title ?? "",
                  style: MyStyles.textStyle(
                    color: MyColors.primary,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ).r,
              border: MyStyles.inputBorder(
                color: MyColors.grey,
                width: 0,
              ),
              enabledBorder: MyStyles.inputBorder(
                color: MyColors.grey,
                width: 0,
              ),
              focusedBorder: MyStyles.inputBorder(
                color: MyColors.grey,
                width: 0,
              ),
              labelStyle: MyStyles.textStyle(
                fontSize: 13,
                color: MyColors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSuffixIcon() {
    if (showFlag!) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30.h,
              width: 2.w,
              color: Colors.grey.withOpacity(.5),
            ),
            5.horizontalSpace,
            CustomText(
              title: '966',
              style: MyStyles.textStyle(
                fontSize: 14,
                height: 1.7,
                color: MyColors.black,
              ),
            ),
            5.horizontalSpace,
            // CustomLocalImage(
            //   image: MyAssets.flag,
            //   width: 25,
            //   height: 25,
            // ),
          ],
        ),
      );
    }

    if (showIcon!) {
      return suffixIcon!;
    }
    if (obscureText!) {
      return CustomPasswordEye(
        passwordBloc: passwordBloc,
      );
    }
    return const SizedBox.shrink();
  }
}
