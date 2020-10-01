import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/modules/register/steps/complete.dart';
import 'package:medicar/app/shared/components/custom_buttom/custom_buttom.dart';
import 'package:medicar/app/shared/components/custom_textfield/custom_textfield.dart';
import 'package:medicar/app/shared/components/error_alert_body/error_alert_body.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app_controller.dart';
import '../register_controller.dart';

class BodyFieldsSecond extends StatelessWidget {
  final double h;
  final double w;

  BodyFieldsSecond({Key key, this.h, this.w}) : super(key: key);

  final controller = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //
        CustomTextField(
          labelText: 'Senha',
          hintText: 'Crie uma senha',
          suffixIcon: Icons.vpn_key,
          isPassword: true,
          onChanged: controller.setPassword1,
        ),
        //
        Container(
          height: .01 * h,
        ),
        //
        CustomTextField(
          labelText: 'Repita sua senha',
          hintText: 'Confirme sua senha',
          suffixIcon: Icons.vpn_key,
          isPassword: true,
          onChanged: controller.setPassword2,
        ),
        //
        Container(
          height: .03 * h,
        ),
        //
        Observer(
          builder: (_) {
            return CustomButtom(
              onTap: () async {
                if (controller.enableButtonFinish) {
                  showDialog(
                    context: context,
                    builder: (context) => Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: CircularProgressIndicator(
                        backgroundColor: MedicarTheme.greenColor,
                      ),
                    ),
                  );

                  await controller.callRegister();

                  Modular.to.pop();

                  print(controller.response);

                  Modular.get<AppController>()
                      .setCurrentFocus(FocusScope.of(context));

                  if (controller.response.code == 200) {
                    Modular.to.pushReplacement(MaterialPageRoute(
                        builder: (context) => CompleteRegistration()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => ErrorAlertBody(
                        responseMessage: controller.response.message,
                      ),
                    );
                  }
                  //
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => ErrorAlertBody(
                      responseMessage: controller.password1.length <= 8
                          ? 'A senha precisa ter no minimo 8 digitos'
                          : 'Insira senhas iguais',
                    ),
                  );
                }
              },
              splashColor: MedicarTheme.splashColorWhite,
              backgroundColor: MedicarTheme.greenColor,
              child: Text(
                'FINALIZAR CADASTRO',
                textAlign: TextAlign.center,
                style: MedicarTheme.primaryFont.copyWith(
                  fontFamily: ConstantsFonts.MontserratSemiBold,
                  color: Colors.white,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
            );
          },
        ),
        //
        Container(
          height: .02 * h,
        ),
        //
        FlatButton(
          onPressed: () {
            launch('https://intmed.com.br/');
          },
          child: Text(
            'AO FINALIZAR O CADASTRO, VOCÊ CONCORDA COM OS TERMOS DE USO E POLÍTICAS DE PRIVACIDADE DA MEDICAR, TOQUE PARA LER',
            textAlign: TextAlign.center,
            style: MedicarTheme.primaryFont.copyWith(
              fontFamily: ConstantsFonts.MontserratSemiBold,
              color: MedicarTheme.secondaryColor1,
              fontSize: 1.2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
        //
      ],
    );
  }
}
