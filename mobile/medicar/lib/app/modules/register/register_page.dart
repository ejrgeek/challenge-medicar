import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/shared/components/back_buttom/back_buttom.dart';
import 'package:medicar/app/shared/components/custom_appbar/custom_appbar.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'components/body_header.dart';
import 'register_controller.dart';
import 'steps/first_step.dart';
import 'steps/second_step.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.biggest.width;
          double h = constraints.biggest.height;

          return Container(
            color: MedicarTheme.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // APP BAR
                Container(
                  height: .1 * h,
                  width: 1 * w,
                  child: CustomAppBar(
                    leftWidget: CustomBackButtom(),
                  ),
                ),
                // APP BODY HEADER
                Container(
                  height: .28 * h,
                  width: .8 * w,
                  child: BodyHeader(w: w, h: h,),
                ),
                // APP BODY FIELDS
                Container(
                  height: .5 * h,
                  width: .8 * w,
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      //
                      FirstStep(w: w, h: h, pageController: pageController,),
                      //
                      SecondStep(w: w, h: h),
                      //
                    ],
                  ),
                ),
                // APP FOOTER
                Container(
                  height: .1 * h,
                ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
