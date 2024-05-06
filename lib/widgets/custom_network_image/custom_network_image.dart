part of '../widgets_imports.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
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
  final ColorFilter? colorFilter;
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
      memCacheHeight: 320.cacheSize(context),
      memCacheWidth: 250.cacheSize(context),
      imageBuilder: (_, imageProvider) => Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
            colorFilter: colorFilter,
          ),
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.zero : null,
          shape: boxShape ?? BoxShape.rectangle,
          border: border,
        ),
        alignment: alignment ?? Alignment.center,
        child: child,
      ),
      placeholder: (_, __) => Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          borderRadius: haveRadius ? borderRadius ?? BorderRadius.zero : null,
          shape: boxShape ?? BoxShape.rectangle,
          border: border,
        ),
        alignment: alignment ?? Alignment.center,
        child: child,
      ),
      errorWidget: (_, __, ___) => Container(
        width: width?.w,
        height: height?.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.white,
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

extension ImageExtension on num {
  int cacheSize(BuildContext context) {
    return (this * MediaQuery.of(context).devicePixelRatio).round();
  }
}
