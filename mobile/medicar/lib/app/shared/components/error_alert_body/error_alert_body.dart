import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/shared/components/custom_alert/custom_alert_widget.dart';
import 'package:medicar/app/shared/components/custom_buttom/custom_buttom.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class ErrorAlertBody extends StatelessWidget {
  final String responseMessage;
  final String subActionString;
  final String buttonMessage;
  final Function buttonFunction;
  final Function subActionFunction;
  final Function onTapOutside;

  const ErrorAlertBody(
      {Key key,
      @required this.responseMessage,
      this.buttonMessage,
      this.buttonFunction,
      this.subActionString,
      this.subActionFunction,
      this.onTapOutside})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertWidget(
      horizontalMarginPercentage: 10,
      horizontalPaddingPercentage: 5,
      verticalPaddingPercentage: 3,
      onTapOutside: onTapOutside ?? () => Modular.to.pop(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              bottom: subActionString == null
                  ? 0
                  : 3.673319 * SizeConfig.heightMultiplier,
            ),
            child: Text(
              responseMessage,
              style: MedicarTheme.primaryFont.copyWith(
                fontSize: 2.20399 * SizeConfig.heightMultiplier, // 18
                color: MedicarTheme.secondaryColor1,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          subActionString == null
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.9126559 * SizeConfig.widthMultiplier,
                  ),
                  child: GestureDetector(
                    onTap: subActionFunction,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Toque",
                            style: MedicarTheme.primaryFont.copyWith(
                              fontSize:
                                  1.46932778 * SizeConfig.heightMultiplier,
                              // 14
                              color: MedicarTheme.secondaryColor3,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                              wordSpacing: 1,
                            ),
                          ),
                          TextSpan(
                            text: " AQUI",
                            style: MedicarTheme.primaryFont.copyWith(
                              fontSize:
                                  1.46932778 * SizeConfig.heightMultiplier,
                              // 14
                              color: MedicarTheme.secondaryColor1,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                              wordSpacing: 1,
                            ),
                          ),
                          TextSpan(
                            text: " para $subActionString",
                            style: MedicarTheme.primaryFont.copyWith(
                              fontSize:
                                  1.46932778 * SizeConfig.heightMultiplier,
                              // 14
                              color: MedicarTheme.secondaryColor3,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                              wordSpacing: 1,
                            ),
                          ),
                        ])),
                  ),
                ),
          Spacer(),
          CustomButtom(
            backgroundColor: MedicarTheme.greenColor,
            child: Text(
              buttonMessage ?? "Entendi",
              style: MedicarTheme.primaryFont.copyWith(
                color: Colors.white,
                fontSize: 1.9591037 * SizeConfig.heightMultiplier, // 16
              ),
            ),
            onTap: buttonFunction ?? () => Modular.to.pop(),
          )
        ],
      ),
    );
  }
}
