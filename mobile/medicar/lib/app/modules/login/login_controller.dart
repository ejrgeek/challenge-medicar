import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'service/login_service.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String username = '';
  @action
  setUsername(String value) => this.username = value;

  @observable
  String password = '';
  @action
  setPassword(String value) => this.password = value;

  @observable
  DefaultResponseModel response;

  @action
  callLogin() async {
    try {
      this.response = await LoginService().login(
        username: username,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }
}
