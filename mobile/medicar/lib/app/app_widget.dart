
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'shared/themes/medicar_theme.dart';
import 'shared/utils/size_config.dart';

class AppWidget extends StatelessWidget {
  final appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return OrientationBuilder(
          builder: (_, orientation) {
            SizeConfig().init(constraints, orientation);
            return GestureDetector(
              onTap: () {
                appController.setCurrentFocus(FocusScope.of(context));
              },
              child: MaterialApp(
                navigatorKey: Modular.navigatorKey,
                title: 'Medicar',
                debugShowCheckedModeBanner: false,
                theme: theme.copyWith(
                  textTheme: TextTheme(
                    bodyText2: MedicarTheme.primaryFont.copyWith(
                      color: MedicarTheme.primaryColor,
                    ),
                  ),
                ),
                locale: Locale("pt_BR"),
                initialRoute: '/',
                onGenerateRoute: Modular.generateRoute,
              ),
            );
          },
        );
      },
    );
  }
}
