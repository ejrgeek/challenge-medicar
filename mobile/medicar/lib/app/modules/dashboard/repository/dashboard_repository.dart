import 'package:http/http.dart' as http;
import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/utils/constants_errors.dart';
import 'package:medicar/app/shared/utils/constants_urls.dart';

class DashboardRepository {
  String endpointLogout = '/logout/';
  String endpointGetAluno = '/aluno/';

  Future<DefaultResponseModel> logout() async {
    try {
      String token = DataStorage().getData(ConstantsUrl.token);

      final http.Response response = await http.post(
          '${ConstantsUrl.baseUrl}$endpointLogout',
          headers: {'Authorization': 'token $token'});
      DataStorage().clearStorage();
      if (response.statusCode <= 300) {
        return DefaultResponseModel(
          code: response.statusCode,
          message: ConstantsErrors.success,
        );
      } else {
        return DefaultResponseModel(
          code: response.statusCode,
          message: ConstantsErrors.catchError,
        );
      }
    } catch (e) {
      print(e);
    }
    return DefaultResponseModel(
      code: 400,
      message: ConstantsErrors.catchError,
    );
  }

  //

  Future<DefaultResponseModel> getAluno() async {
    try {
      String token = await DataStorage().getData(ConstantsUrl.token);

      final http.Response response = await http.get(
          '${ConstantsUrl.baseUrl}$endpointGetAluno',
          headers: {'Authorization': 'token $token'});

      if (response.statusCode == 200) {
        await DataStorage().saveData(ConstantsUrl.userData, response.body);
        return DefaultResponseModel(
          code: response.statusCode,
          message: ConstantsErrors.success,
        );
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
