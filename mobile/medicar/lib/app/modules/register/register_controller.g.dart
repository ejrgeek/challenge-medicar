// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegisterController = BindInject(
  (i) => RegisterController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_RegisterControllerBase.emailValid'))
          .value;
  Computed<bool> _$enableFirstButtonComputed;

  @override
  bool get enableFirstButton => (_$enableFirstButtonComputed ??= Computed<bool>(
          () => super.enableFirstButton,
          name: '_RegisterControllerBase.enableFirstButton'))
      .value;
  Computed<bool> _$passwordEqualsComputed;

  @override
  bool get passwordEquals =>
      (_$passwordEqualsComputed ??= Computed<bool>(() => super.passwordEquals,
              name: '_RegisterControllerBase.passwordEquals'))
          .value;
  Computed<bool> _$enableButtonFinishComputed;

  @override
  bool get enableButtonFinish => (_$enableButtonFinishComputed ??=
          Computed<bool>(() => super.enableButtonFinish,
              name: '_RegisterControllerBase.enableButtonFinish'))
      .value;

  final _$nameAtom = Atom(name: '_RegisterControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$usernameAtom = Atom(name: '_RegisterControllerBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$password1Atom = Atom(name: '_RegisterControllerBase.password1');

  @override
  String get password1 {
    _$password1Atom.reportRead();
    return super.password1;
  }

  @override
  set password1(String value) {
    _$password1Atom.reportWrite(value, super.password1, () {
      super.password1 = value;
    });
  }

  final _$password2Atom = Atom(name: '_RegisterControllerBase.password2');

  @override
  String get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  final _$responseAtom = Atom(name: '_RegisterControllerBase.response');

  @override
  DefaultResponseModel get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(DefaultResponseModel value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$callRegisterAsyncAction =
      AsyncAction('_RegisterControllerBase.callRegister');

  @override
  Future callRegister() {
    return _$callRegisterAsyncAction.run(() => super.callRegister());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsername(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword1(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword1');
    try {
      return super.setPassword1(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword2(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
username: ${username},
password1: ${password1},
password2: ${password2},
response: ${response},
emailValid: ${emailValid},
enableFirstButton: ${enableFirstButton},
passwordEquals: ${passwordEquals},
enableButtonFinish: ${enableButtonFinish}
    ''';
  }
}
