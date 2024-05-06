part of '../widgets_imports.dart';

class FlexibleNetworkImage extends StatelessWidget {
  const FlexibleNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.borderRadius,
    this.colorFilter,
    this.alignment,
    this.child,
    this.boxShape,
    this.border,
    this.haveRadius = true,
    this.isPlaceholder = false,
  });

  final String? url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? colorFilter;
  final Alignment? alignment;
  final Widget? child;
  final BoxBorder? border;
  final BoxShape? boxShape;
  final bool haveRadius;
  final bool isPlaceholder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      width: width?.w,
      fit: fit,
      color: colorFilter,
      placeholder: (_, __) => const SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (_, __, ___) => Container(
        width: width?.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: MyColors.white,
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.zero : null,
          border: border,
          shape: boxShape ?? BoxShape.rectangle,
        ),
        child: Icon(
          Icons.error,
          color: MyColors.red,
          size: 20,
        ),
      ),
    );
  }
}
