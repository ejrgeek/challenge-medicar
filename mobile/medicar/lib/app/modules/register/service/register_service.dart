import 'package:flutter/foundation.dart';
import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:medicar/app/models/register/user_register_model.dart';
import 'package:medicar/app/modules/register/repository/register_repository.dart';

class RegisterService {
  Future<DefaultResponseModel> register({
    @required String name,
    @required String username,
    @required String email,
    @required String password,
  }) async {
    UserRegisterModel user = UserRegisterModel(
      email: email,
      firstName: name,
      password: password,
      username: username,
    );
    return await RegisterRepository().register(user);
  }
}
