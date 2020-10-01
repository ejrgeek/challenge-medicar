import 'dart:convert';
import 'package:medicar/app/models/user/user_model.dart';
import 'package:medicar/app/modules/dashboard/repository/dashboard_repository.dart';
import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/utils/constants_urls.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dashboard_controller.g.dart';

@Injectable()
class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  @observable
  UserModel user = UserModel();
  @action
  setUser() async {
    await DashboardRepository().getAluno();
    String userData = await DataStorage().getData(ConstantsUrl.userData);
    user = UserModel.fromJson(jsonDecode(userData));
  }

  logout() => DashboardRepository().logout();
}
