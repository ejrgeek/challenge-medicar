
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/modules/register/register_controller.dart';
import 'package:medicar/app/shared/components/custom_buttom/custom_buttom.dart';
import 'package:medicar/app/shared/components/custom_textfield/custom_textfield.dart';
import 'package:medicar/app/shared/components/error_alert_body/error_alert_body.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class BodyFieldsFirst extends StatelessWidget {
  final double h;
  final double w;
  final PageController pageController;

  BodyFieldsFirst({Key key, this.h, this.w, this.pageController})
      : super(key: key);

  final controller = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //
        CustomTextField(
          labelText: 'Nome',
          hintText: 'Ex.: Beltrano Ferreira',
          suffixIcon: Icons.person,
          onChanged: controller.setName,
        ),
        //
        Container(
          height: .005 * h,
        ),
        //
        CustomTextField(
          labelText: 'Email',
          hintText: 'Ex.: email@email.com',
          suffixIcon: Icons.email,
          onChanged: controller.setEmail,
        ),
        //
        Container(
          height: .005 * h,
        ),
        //
        CustomTextField(
          labelText: 'Usuário',
          hintText: 'Ex.: fulanoDeTal',
          suffixIcon: Icons.alternate_email,
          onChanged: controller.setUsername,
        ),
        //
        Container(
          height: .02 * h,
        ),
        //
        Observer(builder: (_) {
          return CustomButtom(
            onTap: () {
              if (controller.enableFirstButton) {
                pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => ErrorAlertBody(
                    responseMessage: 'Insira dados válidos',
                  ),
                );
              }
            },
            splashColor: MedicarTheme.splashColorWhite,
            backgroundColor: MedicarTheme.greenColor,
            child: Text(
              'PRÓXIMO',
              textAlign: TextAlign.center,
              style: MedicarTheme.primaryFont.copyWith(
                fontFamily: ConstantsFonts.MontserratSemiBold,
                color: Colors.white,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          );
        }),
        //
      ],
    );
  }
}
