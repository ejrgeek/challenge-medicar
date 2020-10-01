// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AppController = BindInject(
  (i) => AppController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$appVersionAtom = Atom(name: '_AppControllerBase.appVersion');

  @override
  String get appVersion {
    _$appVersionAtom.reportRead();
    return super.appVersion;
  }

  @override
  set appVersion(String value) {
    _$appVersionAtom.reportWrite(value, super.appVersion, () {
      super.appVersion = value;
    });
  }

  final _$currentFocusAtom = Atom(name: '_AppControllerBase.currentFocus');

  @override
  FocusScopeNode get currentFocus {
    _$currentFocusAtom.reportRead();
    return super.currentFocus;
  }

  @override
  set currentFocus(FocusScopeNode value) {
    _$currentFocusAtom.reportWrite(value, super.currentFocus, () {
      super.currentFocus = value;
    });
  }

  final _$keyboardIsShownAtom =
      Atom(name: '_AppControllerBase.keyboardIsShown');

  @override
  bool get keyboardIsShown {
    _$keyboardIsShownAtom.reportRead();
    return super.keyboardIsShown;
  }

  @override
  set keyboardIsShown(bool value) {
    _$keyboardIsShownAtom.reportWrite(value, super.keyboardIsShown, () {
      super.keyboardIsShown = value;
    });
  }

  final _$dialogIsOpenAtom = Atom(name: '_AppControllerBase.dialogIsOpen');

  @override
  bool get dialogIsOpen {
    _$dialogIsOpenAtom.reportRead();
    return super.dialogIsOpen;
  }

  @override
  set dialogIsOpen(bool value) {
    _$dialogIsOpenAtom.reportWrite(value, super.dialogIsOpen, () {
      super.dialogIsOpen = value;
    });
  }

  final _$setAppVersionAsyncAction =
      AsyncAction('_AppControllerBase.setAppVersion');

  @override
  Future setAppVersion() {
    return _$setAppVersionAsyncAction.run(() => super.setAppVersion());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setCurrentFocus(FocusScopeNode focusScope) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setCurrentFocus');
    try {
      return super.setCurrentFocus(focusScope);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setKeyBoardIsShown(bool value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setKeyBoardIsShown');
    try {
      return super.setKeyBoardIsShown(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIfDialogIsOpen(bool value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setIfDialogIsOpen');
    try {
      return super.setIfDialogIsOpen(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appVersion: ${appVersion},
currentFocus: ${currentFocus},
keyboardIsShown: ${keyboardIsShown},
dialogIsOpen: ${dialogIsOpen}
    ''';
  }
}
