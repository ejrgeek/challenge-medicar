
import 'package:flutter/material.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final IconData suffixIcon;
  final Function onChanged;
  final bool isPassword;

  const CustomTextField(
      {Key key,
      this.labelText,
      this.hintText,
      this.keyboardType,
      this.suffixIcon,
      this.onChanged,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: MedicarTheme.greenColor,
          focusColor: MedicarTheme.greenColor,
          labelText: labelText ?? 'INSIRA UM LABEL',
          labelStyle: MedicarTheme.primaryFont.copyWith(
            color: MedicarTheme.secondaryColor1,
            fontFamily: ConstantsFonts.MontserratSemiBold,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
          hintText: hintText ?? 'INSIRA UM HINT',
          hintStyle: MedicarTheme.primaryFont.copyWith(
            color: MedicarTheme.secondaryColor3,
            fontFamily: ConstantsFonts.MontserratSemiBold,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
          suffixIcon: Icon(suffixIcon, color: MedicarTheme.greenColor,),
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        style: MedicarTheme.primaryFont.copyWith(
          color: Colors.black,
        ),
        onChanged: onChanged ?? (text) {},
        autofocus: false,
        obscureText: isPassword ?? false,
      ),
    );
  }
}
