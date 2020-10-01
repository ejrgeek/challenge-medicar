import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'access_controller.g.dart';

@Injectable()
class AccessController = _AccessControllerBase with _$AccessController;

abstract class _AccessControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
