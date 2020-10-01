import 'package:flutter/material.dart';
import 'package:medicar/app/modules/register/components/body_fields_first.dart';

class FirstStep extends StatelessWidget {
  final double w;
  final double h;
  final PageController pageController;

  const FirstStep({Key key, this.w, this.h, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // APP BODY FIELDS
        Container(
          height: .35 * h,
          width: .8 * w,
          child: BodyFieldsFirst(
            w: w,
            h: h,
            pageController: pageController,
          ),
        ),
      ],
    );
  }
}
