import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function onTap;
  final Widget leftWidget;
  final Widget centerWidget;
  final Widget rightWidget;

  const CustomAppBar({
    Key key,
    this.onTap,
    this.leftWidget,
    this.centerWidget,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.biggest.width;
        double h = constraints.biggest.height;

        return Container(
          width: w * 1,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              //
              Container(
                width: .3 * w,
                height: .6 * h,
                child: leftWidget ?? Container(),
              ),
              //
              Container(
                width: .4 * w,
                height: .6 * h,
                child: centerWidget ?? Container(),
              ),
              //
              Container(
                width: .3 * w,
                height: .6 * h,
                child: rightWidget ?? Container(),
              ),
              //
            ],
          ),
        );
      },
    );
  }
}
