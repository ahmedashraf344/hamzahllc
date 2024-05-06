part of '../widgets_imports.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({super.key, this.refresh, this.child});

  final Function? refresh;
  final Widget? child;

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        color: MyColors.white,
        backgroundColor: MyColors.red,
        strokeWidth: 4,
        onRefresh: () => refresh!(),
        child: child!,
      );
}
