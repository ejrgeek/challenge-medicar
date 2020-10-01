import 'package:flutter/foundation.dart';
import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:medicar/app/models/login/user_login_model.dart';
import 'package:medicar/app/modules/login/repository/login_repository.dart';

class LoginService {
  Future<DefaultResponseModel> login({
    @required String username,
    @required String password,
  }) async {
    UserLoginModel user = UserLoginModel(
      username: username,
      password: password,
    );
    return await LoginRepository().login(user);
  }
}
