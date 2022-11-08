import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:StandsAero/helper/model.dart';

class UserController extends GetxController {
  var user = UserModel();

  void addUser(UserModel data) {
    user = data;

    //print(user.userName);

    update();
  }

  void editUser(UserModel data) {
    user = data;

    update();
  }
}
