
import 'package:flutter/material.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class CustomButtom extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color splashColor;
  final double height;
  final double width;
  final Function onTap;
  final Alignment alignment;
  final Widget child;
  final EdgeInsets padding;

  const CustomButtom(
      {Key key,
      @required this.child,
      this.backgroundColor,
      this.foregroundColor,
      this.height,
      this.onTap,
      this.padding,
      this.width,
      this.alignment,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        color: Colors.transparent,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.zero,
          color: backgroundColor ?? Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.zero),
            splashColor: splashColor ?? MedicarTheme.splashColorWhite,
            onTap: onTap,
            child: Container(
              padding: padding ??
                  EdgeInsets.symmetric(
                    vertical: 1.836659 * SizeConfig.heightMultiplier,
                    horizontal: 3.8197 * SizeConfig.widthMultiplier,
                  ),
              height: height ?? 6.1222 * SizeConfig.heightMultiplier,
              width: width,
              alignment: alignment ?? Alignment.center,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
