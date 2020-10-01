import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class CustomBackButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pop(),
      child: Row(
        children: <Widget>[
          //
          Material(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Modular.to.pop(),
              tooltip: 'Voltar',
              color: MedicarTheme.secondaryColor2,
            ),
          ),
          //
          Text(
            'VOLTAR',
            style: MedicarTheme.primaryFont.copyWith(
              fontFamily: ConstantsFonts.MontserratSemiBold,
              fontSize: 1.75 * SizeConfig.heightMultiplier,
              color: MedicarTheme.secondaryColor2,
            ),
          ),
          //
          //
        ],
      ),
    );
  }
}
