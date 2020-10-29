import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:shop_delivery/architecture/user_create/user_create_repo.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';

class LoginBloc implements BlocBase {
  //var cardsBloc = BehaviorSubject<UserEntity>();

  Future<User> login({
    String email,
    String phone,
    String address,
    String dob,
    String name,
    // var id,
  }) async {
    var data = await LoginRepo().login(
        email: email, phone: phone, address: address, dob: dob, name: name);
    return data;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
