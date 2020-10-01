import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';

// ignore: must_be_immutable
class ConsultPage extends KFDrawerContent {
  ConsultPage({
    Key key,
  });

  @override
  _PConsultPageState createState() => _PConsultPageState();
}

class _PConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: MedicarTheme.greenColor,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MINHA FICHA',
                    textAlign: TextAlign.center,
                    style: MedicarTheme.primaryFont,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
