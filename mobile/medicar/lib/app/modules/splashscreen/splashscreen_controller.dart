import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/utils/constants_urls.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splashscreen_controller.g.dart';

@Injectable()
class SplashscreenController = _SplashscreenControllerBase
    with _$SplashscreenController;

abstract class _SplashscreenControllerBase with Store {
  @observable
  bool hasToken = false;

  @action
  getToken() async {
    try {
      String token = await DataStorage().getData(ConstantsUrl.token);
      print('\n\nTOKEN: $token\n\n');
      if (token != null) hasToken = true;
    } catch (e) {
      print(e);
    }
  }
}
