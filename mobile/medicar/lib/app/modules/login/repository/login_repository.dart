import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:medicar/app/models/login/login_response_model.dart';
import 'package:medicar/app/models/login/user_login_model.dart';
import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/utils/constants_errors.dart';
import 'package:medicar/app/shared/utils/constants_urls.dart';

class LoginRepository {
  String endpoint = '/login/';

  Future<DefaultResponseModel> login(UserLoginModel model) async {
    try {
      final http.Response response = await http.post(
        '${ConstantsUrl.baseUrl}$endpoint',
        body: model.toJson(),
      );

      if (response.statusCode == 200) {
        LoginResponseModel loginResponse =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        await DataStorage().saveData(ConstantsUrl.token, loginResponse.token);
        return DefaultResponseModel(code: response.statusCode);
      }
      return DefaultResponseModel(
        code: response.statusCode,
        message: ConstantsErrors.catchError,
      );
    } catch (e) {
      print(e);
    }
    return DefaultResponseModel(
      code: 400,
      message: ConstantsErrors.catchError,
    );
  }
}
