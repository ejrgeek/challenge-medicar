// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splashscreen_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SplashscreenController = BindInject(
  (i) => SplashscreenController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashscreenController on _SplashscreenControllerBase, Store {
  final _$hasTokenAtom = Atom(name: '_SplashscreenControllerBase.hasToken');

  @override
  bool get hasToken {
    _$hasTokenAtom.reportRead();
    return super.hasToken;
  }

  @override
  set hasToken(bool value) {
    _$hasTokenAtom.reportWrite(value, super.hasToken, () {
      super.hasToken = value;
    });
  }

  final _$getTokenAsyncAction =
      AsyncAction('_SplashscreenControllerBase.getToken');

  @override
  Future getToken() {
    return _$getTokenAsyncAction.run(() => super.getToken());
  }

  @override
  String toString() {
    return '''
hasToken: ${hasToken}
    ''';
  }
}
