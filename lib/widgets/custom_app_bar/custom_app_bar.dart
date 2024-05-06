part of '../widgets_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.height = 60,
    this.isTitleWidget = false,
    this.centerTitle = false,
    this.actions,
    this.titleWidget,
    this.flexibleSpace,
    this.title,
  }) : preferredSize = Size.fromHeight(height);
  final double height;
  @override
  final Size preferredSize;
  final String? title;
  final Widget? titleWidget;
  final Widget? flexibleSpace;
  final bool? isTitleWidget;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: centerTitle,
      leadingWidth: 50.r,
      iconTheme: IconThemeData(
        size: 20.r,
      ),
      title: Visibility(
        visible: isTitleWidget ?? true,
        replacement: CustomText(
          title: title ?? '',
          style: MyStyles.textStyle(
            fontSize: 18,
          ),
        ),
        child: titleWidget ?? const SizedBox.shrink(),
      ),
      actions: actions,
    );
  }
}
