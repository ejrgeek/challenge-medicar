import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:medicar/app/models/register/response_register_model.dart';
import 'package:medicar/app/models/register/user_register_model.dart';
import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/utils/constants_errors.dart';
import 'package:medicar/app/shared/utils/constants_urls.dart';

class RegisterRepository {
  String endpoint = '/register/';

  Future<DefaultResponseModel> register(UserRegisterModel model) async {
    try {
      final http.Response response = await http.post(
        '${ConstantsUrl.baseUrl}$endpoint',
        body: model.toJson(),
      );

      if (response.statusCode == 200) {
        ResponseRegisterModel registerResponse =
            ResponseRegisterModel.fromJson(jsonDecode(response.body));

        await DataStorage().clearStorage();

        await DataStorage().saveData(ConstantsUrl.token, registerResponse.token);

        await DataStorage().saveData(ConstantsUrl.userData, response.body);

        return DefaultResponseModel(
            code: response.statusCode, message: ConstantsErrors.success);
      }
    } catch (e) {
      print(e);
    }
    return DefaultResponseModel(code: 400, message: ConstantsErrors.catchError);
  }
}
