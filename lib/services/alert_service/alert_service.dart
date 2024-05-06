import "package:bot_toast/bot_toast.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_easyloading/flutter_easyloading.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:hamzahllc/resources/my_colors.dart";
import "package:hamzahllc/resources/my_styles.dart";
import "package:hamzahllc/widgets/widgets_imports.dart";

class AlertService {
  CancelFunc showAlert({
    required String title,
    bool isSuccess = false,
  }) {
    return BotToast.showNotification(
      trailing: (cancel) => GestureDetector(
        onTap: cancel,
        child: Icon(
          Icons.clear,
          color: MyColors.black,
        ),
      ),
      title: (_) => CustomText(
        title: title,
        // textAlign _prefService. == 'en' ? TextAlign.end : TextAlign.start,
        style: MyStyles.textStyle(
          color: MyColors.black,
          height: 1,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: (_) => Icon(
        isSuccess ? Icons.check_circle_rounded : Icons.error_rounded,
        color: isSuccess ? MyColors.green : MyColors.red,
        size: 37,
      ),
      backgroundColor: MyColors.white,
      backButtonBehavior: BackButtonBehavior.close,
      animationDuration: const Duration(milliseconds: 500),
      animationReverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 4),
      borderRadius: 12.0,
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    );
  }

  void showLoadingDialog(BuildContext context) {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.animationStyle = EasyLoadingAnimationStyle.offset;
    EasyLoading.instance.indicatorWidget = SizedBox(
      width: 40.w,
      child: SpinKitHourGlass(
        color: MyColors.red,
        size: 30,
      ),
    );
    EasyLoading.show();
  }

  Center showLoadingView(BuildContext context) => Center(
        child: SpinKitHourGlass(
          color: MyColors.red,
          size: 28,
        ),
      );

  void showLoadingDialogWithProgress({String? progress}) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: progress,
    );
  }

  void closeLoading() => EasyLoading.dismiss();

  Future showConfirmDialog({
    required BuildContext context,
    required VoidCallback confirm,
    required String title,
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => _alertDialog(
        confirm,
        context,
        title,
      ),
    );
  }

  Future showCustomDialog({
    required BuildContext context,
    required Widget child,
    Function? callBack,
    bool hasCallBack = false,
    bool isFullScreen = true,
  }) {
    if (isFullScreen) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Dialog.fullscreen(
            backgroundColor: Colors.white,
            child: child,
          );
        },
      ).then((value) {
        if (hasCallBack) {
          callBack!();
        }
      });
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: child,
          );
        },
      ).then((value) {
        if (hasCallBack) {
          callBack!();
        }
      });
    }
  }

  Widget _alertDialog(
    VoidCallback confirm,
    BuildContext context,
    String title,
  ) =>
      CupertinoAlertDialog(
        title: CustomText(
          title: title,
          style: MyStyles.textStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: CustomText(
              title: 'Cancel',
              style: MyStyles.textStyle(
                fontSize: 12,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              confirm();
            },
            child: CustomText(
              title: 'Confirm',
              style: MyStyles.textStyle(
                fontSize: 12,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}
