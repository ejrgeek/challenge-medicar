import 'package:medicar/app/models/default_response/default_response_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'service/register_service.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  String name = '';
  @action
  setName(String value) => this.name = value;

  @observable
  String email = '';
  @action
  setEmail(String value) => this.email = value;
  @computed
  bool get emailValid => this.email.contains('@');

  @observable
  String username = '';
  @action
  setUsername(String value) => this.username = value;

  @computed
  bool get enableFirstButton =>
      emailValid && this.name.length >= 2 && this.username.length >= 3;

  @observable
  String password1 = '';
  @action
  setPassword1(String value) => this.password1 = value;

  @observable
  String password2 = '';
  @action
  setPassword2(String value) => this.password2 = value;

  @computed
  bool get passwordEquals => this.password1 == this.password2;

  @computed
  bool get enableButtonFinish => this.password1.length >= 8 && passwordEquals;

  //

  @observable
  DefaultResponseModel response;

  @action
  callRegister() async {
    try {
      this.response = await RegisterService().register(
        email: this.email,
        name: this.name,
        password: this.password1,
        username: this.username,
      );
    } catch (e) {
      print(e);
    }
  }
}
