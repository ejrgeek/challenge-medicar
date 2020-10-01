
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/constants_imgs.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class BodyHeader extends StatelessWidget {
  final double h;
  final double w;

  const BodyHeader({Key key, this.h, this.w}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //
        Container(
          padding: EdgeInsets.only(top: 20),
          height: .13 * h,
          child: SvgPicture.asset(
            ConstantsImg.logoName,
            alignment: Alignment.topLeft,
          ),
        ),
        //
        Container(
          padding: EdgeInsets.only(top: 25),
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              text: 'Acesse sua conta',
              style: MedicarTheme.primaryFont.copyWith(
                  fontSize: 3 * SizeConfig.heightMultiplier,
                  fontFamily: ConstantsFonts.MontserratRegular,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '\nAcesso',
                  style: MedicarTheme.primaryFont.copyWith(
                      fontSize: 4.5 * SizeConfig.heightMultiplier,
                      fontFamily: ConstantsFonts.MontserratBold,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        //
      ],
    );
  }
}
