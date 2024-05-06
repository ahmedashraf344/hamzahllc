part of '../widgets_imports.dart';

class CustomLocalDropDown extends StatelessWidget {
  const CustomLocalDropDown({
    super.key,
    this.hintText = "",
    this.title = "",
    this.value = "",
    required this.onChanged,
  });

  final String? hintText, title, value;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14).r,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  title: title!,
                  style: MyStyles.textStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          7.verticalSpace,
          DropdownButtonFormField<String>(
            value: value,
            autovalidateMode: AutovalidateMode.always,
            onChanged: (v) => onChanged(v!),
            decoration: InputDecoration(
              fillColor: MyColors.white,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              hintStyle: MyStyles.textStyle(
                fontSize: 14,
                color: MyColors.black,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ).r,
              border: MyStyles.inputBorder(color: MyColors.black),
              enabledBorder: MyStyles.inputBorder(color: MyColors.black),
              focusedBorder: MyStyles.inputBorder(color: MyColors.black),
              labelStyle: MyStyles.textStyle(
                height: 0.5,
              ),
            ),
            items: [
              DropdownMenuItem(
                value: '0',
                child: CustomText(
                  title: 'Male',
                  style: MyStyles.textStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: '1',
                child: CustomText(
                  title: 'Female',
                  style: MyStyles.textStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          7.verticalSpace,
        ],
      ),
    );
  }
}
