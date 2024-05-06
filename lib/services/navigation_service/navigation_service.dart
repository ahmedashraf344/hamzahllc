import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  void push(
    BuildContext context, {
    required String path,
    Function? afterClose,
    bool isAfterClose = false,
    Map<String, dynamic>? queryParameters,
  }) {
    context
        .pushNamed(
      path,
      extra: queryParameters,
    )
        .then((value) {
      if (isAfterClose) {
        afterClose!();
      }
    });
  }

  void clearAndNavigate(BuildContext context) {
    while (GoRouter.of(context).canPop() == true) {
      GoRouter.of(context).pop();
    }
  }

  void pushAndRemoveAll(
    BuildContext context, {
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    clearAndNavigate(context);
    context.goNamed(
      path,
      queryParameters: queryParameters ?? {},
    );
  }

  void pop(BuildContext context, {List? results}) {
    context.pop(results);
  }

  void pushWithBottomSheet(
    BuildContext context, {
    required Widget path,
    Function? next,
    bool? useNext = false,
  }) {
    showModalBottomSheet<Future>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.93,
        child: path,
      ),
    ).then((value) {
      if (useNext!) {
        next!();
      }
    });
  }

  void pushWithBottomSheetWithDynamicSize(
    BuildContext context, {
    required Widget path,
    Function? next,
    bool? useNext = false,
  }) {
    // ignore: strict_raw_type
    showModalBottomSheet<Future>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => path,
    ).then((value) {
      if (useNext!) {
        next!();
      }
    });
  }
}
