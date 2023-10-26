import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/toast_widget.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;

  /* This method is to return actual pixels by using device pixel ratio
   devicePixelRatio * logicalPixel = Actual Pixel */
  int getActualPixels(num pixels) {
    return (MediaQuery.of(this).devicePixelRatio * pixels).round();
  }

  void showToast(
      {String? message,
      int? duration,
      bool isSuccess = true,
      Widget? messageWidget}) {
    if (message == null || message.isEmpty) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Toast.show(
          context: this,
          duration: duration,
          widget: Padding(
            padding: const EdgeInsets.all(Dimensions.materialPadding),
            child: Card(
                color: isSuccess
                    ? AppColors.primaryColor
                    : AppColors.blackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 57,
                  padding: const EdgeInsets.all(Dimensions.padding_8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(message,
                        style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: isSuccess
                                ? AppColors.primaryColor
                                : AppColors.blackColor)),
                  ),
                )),
          ),
          gravity: ToastGravity.bottom);
    });
  }

  void showSnack(
      {required String message,
      Duration? duration,
      bool isFailure = true,
      SnackBarAction? action}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          backgroundColor: isFailure
              ? AppColors.blackColor
              : AppColors.primaryColor,
          content: Text(
            message,
            style: textTheme.titleSmall?.copyWith(
              color: isFailure
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
            ),
          ),
          action: action,
          duration: duration ?? const Duration(seconds: 4),
        ),
      );
    });
  }

  // Use this instead of context.pop()
  void shouldPop() {
    if (canPop()) {
      pop();
    } else {
      debugPrint("Nothing happens!");
    }
  }

  Future<void> showCustomDialog(
      {required Widget content,
      bool barrierDismissible = false,
      Color? barrierColor,
      bool isDismissible = true,
      Color? backgroundColor}) {
    return showDialog<bool>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black54,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(isDismissible),
          child: AlertDialog(
              contentPadding: const EdgeInsets.all(Dimensions.materialPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              backgroundColor: backgroundColor ?? Colors.white,
              content: content),
        );
      },
    );
  }

  Future<bool?> showAlertDialog(
      {bool isMessageWidget = false,
      Widget? messageWidget,
      bool isTap = false,
      VoidCallback? onPositiveAction,
      VoidCallback? onNegativeAction,
      required String title,
      required String message,
      String imageName = '',
      String? negativeButtonText,
      String? positiveButtonText,
      Color? imageColor,
      TextStyle? negativeButtonTextStyle,
      ButtonStyle? negetiveButtonStyle,
      bool columnButtons = false,
      EdgeInsetsGeometry? padding}) {
    return showDialog<bool>(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageName.isNotEmpty) ...[
                SvgPicture.asset(
                  imageName,
                  color: imageColor,
                ),
                const SizedBox(height: 10),
              ],
              const SizedBox(
                height: Dimensions.padding_6,
              ),
              Text(
                title,
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isMessageWidget
                  ? messageWidget!
                  : Text(
                      message,
                      style: context.textTheme.bodyMedium,
                    ),
              const SizedBox(height: Dimensions.materialPadding_24),
              columnButtons
                  ? Column(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                            if (onPositiveAction != null) {
                              onPositiveAction();
                            }
                          },
                          child: Text(
                            positiveButtonText ?? '', // appStrings.ok,
                            style: textTheme.labelMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 4),
                        OutlinedButton(
                          style: negetiveButtonStyle,
                          child: Text(
                            negativeButtonText ?? '', // appStrings.cancel,
                            style: negativeButtonTextStyle ??
                                textTheme.labelMedium?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          onPressed: () {
                            Navigator.pop(context, false);
                            if (onNegativeAction != null) {
                              onNegativeAction();
                            }
                          },
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: negetiveButtonStyle ??
                              OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.primaryColor),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                          child: Text(
                            negativeButtonText ?? '', // appStrings.cancel,
                            style: negativeButtonTextStyle ??
                                textTheme.bodyLarge?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          onPressed: () {
                            shouldPop();
                            if (onNegativeAction != null) {
                              onNegativeAction();
                            }
                          },
                        ),
                        const SizedBox(width: Dimensions.padding_8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                            if (onPositiveAction != null) {
                              onPositiveAction();
                            }
                          },
                          child: Text(
                            positiveButtonText ?? '', // appStrings.ok,
                            style: textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        );
      },
    );
  }
}
