// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DashboardController = BindInject(
  (i) => DashboardController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$userAtom = Atom(name: '_DashboardControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$setUserAsyncAction = AsyncAction('_DashboardControllerBase.setUser');

  @override
  Future setUser() {
    return _$setUserAsyncAction.run(() => super.setUser());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
