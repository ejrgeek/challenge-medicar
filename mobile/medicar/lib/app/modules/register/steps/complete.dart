
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicar/app/modules/dashboard/repository/dashboard_repository.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/constants_imgs.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class CompleteRegistration extends StatefulWidget {
  @override
  _CompleteRegistrationState createState() => _CompleteRegistrationState();
}

class _CompleteRegistrationState extends State<CompleteRegistration> {

  @override
  void initState() {
    super.initState();
    DashboardRepository().getAluno();
    Future.delayed(
    Duration(seconds: 2),
      () => Modular.to.pushReplacementNamed('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double h = constraints.biggest.height;

        return Container(
          color: MedicarTheme.backgroundColor,
          child: Column(
            children: <Widget>[
              //
              Container(height: .15 * h),
              //
              Container(
                height: .1 * h,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'CADASTRO',
                    style: MedicarTheme.primaryFont.copyWith(
                      fontSize: 4.5 * SizeConfig.heightMultiplier,
                      fontFamily: ConstantsFonts.MontserratBold,
                      color: MedicarTheme.secondaryColor1,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nCONCLUÍDO',
                        style: MedicarTheme.primaryFont.copyWith(
                          fontSize: 4.5 * SizeConfig.heightMultiplier,
                          fontFamily: ConstantsFonts.MontserratBold,
                          color: MedicarTheme.secondaryColor1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //
              Container(
                height: .5 * h,
                child: SvgPicture.asset(ConstantsImg.confirmation),
              ),
              //
              Container(
                height: .1 * h,
                child: Text(
                  '#BORATREINAR',
                  textAlign: TextAlign.center,
                  style: MedicarTheme.primaryFont.copyWith(
                    fontFamily: ConstantsFonts.MontserratSemiBold,
                    color: MedicarTheme.secondaryColor1,
                    fontSize: 4.2 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
              //
              Container(height: .15 * h),
              //
            ],
          ),
        );
      },
    );
  }
}
