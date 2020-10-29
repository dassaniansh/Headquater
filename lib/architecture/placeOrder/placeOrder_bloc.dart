import 'package:shop_delivery/architecture/placeOrder/placeOrder_repo.dart';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:shop_delivery/architecture/user_create/user_create_repo.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';

class OrderPlace implements BlocBase {
  //var cardsBloc = BehaviorSubject<UserEntity>();

  Future<User> placeOrder({
    var orderData,
    // var id,
  }) async {
    var data = await OrderPlaceRepo().placeOrder(data: orderData);
    return data;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
