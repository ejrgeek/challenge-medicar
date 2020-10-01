import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/app_controller.dart';

class CustomAlertWidget extends StatelessWidget {
  final double horizontalMarginPercentage;
  final double verticalMarginPercentage;
  final double horizontalPaddingPercentage;
  final double verticalPaddingPercentage;
  final double backgroundOpacity;
  final double foregroundOpacity;
  final Widget child;
  final Color backgroundColor;
  final Function onTapOutside;
  final Function onTapInside;
  final appController = Modular.get<AppController>();

  CustomAlertWidget(
      {Key key,
      @required this.child,
      this.horizontalMarginPercentage = 8,
      this.verticalMarginPercentage = 32,
      this.onTapOutside,
      this.onTapInside,
      this.backgroundColor,
      this.horizontalPaddingPercentage = 0,
      this.verticalPaddingPercentage = 0,
      this.backgroundOpacity,
      this.foregroundOpacity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapOutside ?? () => Modular.to.pop(),
      child: Container(
        color: Colors.black.withOpacity(
          // ? OPACITY IS FORCED TO BE BETWEEN 0 AND 1
          backgroundOpacity == null ? 0 : backgroundOpacity < 0 ? 0 : backgroundOpacity > 1 ? 1 : backgroundOpacity,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double height = constraints.biggest.height;
            double width = constraints.biggest.width;
            double verticalMargin = height * ((verticalMarginPercentage ?? 0) / 100);
            double horizontalMargin = width * ((horizontalMarginPercentage ?? 0) / 100);
            double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
            double vertMarginMinusKeyboard = verticalMargin - keyboardHeight;
            double alertHeight = height - 2 * verticalMargin;

            //
            return Container(
              constraints: BoxConstraints(maxHeight: height - keyboardHeight),
              margin: EdgeInsets.only(
                top: appController.keyboardIsShown
                    ? (vertMarginMinusKeyboard > 0) ? verticalMargin : height - (alertHeight + keyboardHeight + 10)
                    : verticalMargin,
                bottom: appController.keyboardIsShown
                    ? (vertMarginMinusKeyboard > 0) ? verticalMargin : keyboardHeight + 10
                    : verticalMargin,
                right: horizontalMargin,
                left: horizontalMargin,
              ),
              child: GestureDetector(
                onTap: onTapInside ?? () {},
                child: SizedBox.expand(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: height * ((verticalPaddingPercentage ?? 0) / 100),
                      bottom: height * ((verticalPaddingPercentage ?? 0) / 100),
                      right: width * ((horizontalPaddingPercentage ?? 0) / 100),
                      left: width * ((horizontalPaddingPercentage ?? 0) / 100),
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Animator(
                        tween: Tween<double>(begin: 0, end: 1),
                        child: child,
                        builder: (context, animatorState, child) {
                          return AnimatedOpacity(
                            opacity: (
                                    // ? OPACITY IS FORCED TO BE BETWEEN 0 AND 1
                                    // ? IF NO OPACITY IS GIVEN ANIMATE THE OPACITY
                                    foregroundOpacity == null
                                        ? animatorState.animation.value
                                        : foregroundOpacity < 0 ? 0 : foregroundOpacity > 1 ? 1 : foregroundOpacity
                                //?
                                //?
                                ),
                            duration: const Duration(milliseconds: 200),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
