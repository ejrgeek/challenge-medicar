import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase extends Disposable with Store {

  //* GET PACKAGE INFO
  @observable
  String appVersion = '';
  @action
  setAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    this.appVersion = packageInfo.version;
  }
  //* END - GET PACKAGE INFO

  //* FOCUS
  @observable
  FocusScopeNode currentFocus;
  @action

  /// Pass FocusScope.of(context)
  setCurrentFocus(FocusScopeNode focusScope) {
    currentFocus = focusScope;
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
    }
  }
  //* END - FOCUS

  @observable
  bool keyboardIsShown = false;
  @action
  setKeyBoardIsShown(bool value) {
    keyboardIsShown = value;
  }

  @observable
  bool dialogIsOpen = false;
  @action
  setIfDialogIsOpen(bool value) {
    dialogIsOpen = value;
  }

  @override
  void dispose() {}

}
