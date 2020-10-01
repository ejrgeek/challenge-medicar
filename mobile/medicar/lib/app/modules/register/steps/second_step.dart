import 'package:flutter/material.dart';
import 'package:medicar/app/modules/register/components/body_fields_second.dart';

class SecondStep extends StatelessWidget {
  final double w;
  final double h;

  const SecondStep({Key key, this.w, this.h}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // APP BODY FIELDS
        Container(
          height: .35 * h,
          width: .8 * w,
          child: BodyFieldsSecond(w: w, h: h),
        ),
      ],
    );
  }
}
