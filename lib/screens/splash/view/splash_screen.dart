part of '../splash_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SplashViewModel controller = SplashViewModel();

  @override
  void initState() {
    super.initState();
    controller.initAnimation(this, context);
  }

  @override
  void dispose() {
    controller._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Column(
        children: [
          Expanded(
            child: CustomLocalImage(
              image: MyAssets.splashShape,
              height: 300,
              width: 400,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
          FadeTransition(
            opacity: controller._fadeAnimation,
            child: ScaleTransition(
              scale: controller._scaleAnimation,
              child: CustomLocalImage(
                image: MyAssets.logo,
                height: 220,
                width: 280,
              ),
            ),
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 2,
              child: CustomLocalImage(
                image: MyAssets.splashShape,
                height: 300,
                width: 400,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
