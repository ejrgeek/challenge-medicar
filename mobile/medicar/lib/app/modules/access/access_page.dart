import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicar/app/shared/utils/constants_imgs.dart';
import 'access_controller.dart';
import 'components/buttons/access_buttons.dart';

class AccessPage extends StatefulWidget {
  final String title;
  const AccessPage({Key key, this.title = "Access"}) : super(key: key);

  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends ModularState<AccessPage, AccessController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.biggest.width;
          double h = constraints.biggest.height;

          return Container(
            width: w * 1,
            height: h * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ConstantsImg.background,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //
                Container(
                  height: .1 * h,
                ),
                //
                Container(
                  height: .15 * h,
                  child: SvgPicture.asset(
                    ConstantsImg.logo,
                    height: 1 * h,
                  ),
                ),
                //
                Container(
                  height: .1 * h,
                ),
                //
                Container(
                  height: .3 * h,
                  child: AccessButtons(),
                ),
                //
                Container(
                  height: .35 * h,
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
