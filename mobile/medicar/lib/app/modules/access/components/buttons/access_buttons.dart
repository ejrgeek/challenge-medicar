import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/shared/components/custom_buttom/custom_buttom.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class AccessButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.biggest.width;
        double h = constraints.biggest.height;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            Container(
              height: .25 * h,
              width: .8 * w,
              child: CustomButtom(
                onTap: () {
                  Modular.to.pushNamed('/register');
                },
                splashColor: MedicarTheme.splashColorWhite,
                backgroundColor: MedicarTheme.greenColor,
                child: Text(
                  'PRIMEIRO ACESSO',
                  textAlign: TextAlign.center,
                  style: MedicarTheme.primaryFont.copyWith(
                    fontFamily: ConstantsFonts.MontserratSemiBold,
                    color: Colors.white,
                    fontSize: 2 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
            ),
            //
            Container(
              height: .25 * h,
              width: .8 * w,
              child: Row(
                children: <Widget>[
                  //
                  Container(
                    width: .3 * w,
                    height: .007 * h,
                    color: Colors.white,
                  ),
                  //
                  Container(
                    width: .2 * w,
                    child: Text(
                      'OU',
                      textAlign: TextAlign.center,
                      style: MedicarTheme.primaryFont.copyWith(
                        fontFamily: ConstantsFonts.MontserratMedium,
                        color: Colors.white,
                        fontSize: 2 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ),
                  //
                  Container(
                    width: .3 * w,
                    height: .007 * h,
                    color: Colors.white,
                  ),
                  //
                ],
              ),
            ),
            //
            Container(
              height: .25 * h,
              width: .8 * w,
              child: CustomButtom(
                splashColor: MedicarTheme.splashColorGreen,
                onTap: () {
                  Modular.to.pushNamed('/login');
                },
                backgroundColor: Colors.white,
                child: Text(
                  'JÁ TENHO UMA CONTA',
                  textAlign: TextAlign.center,
                  style: MedicarTheme.primaryFont.copyWith(
                    fontFamily: ConstantsFonts.MontserratSemiBold,
                    color: MedicarTheme.greenColor,
                    fontSize: 2 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
            ),
            //
          ],
        );
      },
    );
  }
}
