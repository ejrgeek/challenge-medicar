import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';

// ignore: must_be_immutable
class HomePage extends KFDrawerContent {
  HomePage({
    Key key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    'PAGINA INICIAL',
                    textAlign: TextAlign.center,
                    style: MedicarTheme.primaryFont
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
