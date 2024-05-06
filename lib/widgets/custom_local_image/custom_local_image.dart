part of "../widgets_imports.dart";

class CustomLocalImage extends StatelessWidget {
  const CustomLocalImage({
    required this.image,
    super.key,
    this.width = 45,
    this.height = 45,
    this.color,
    this.fit,
  });

  final String image;
  final double width;
  final double height;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width.w,
      height: height.h,
      color: color,
      fit: fit,
    );
  }
}
