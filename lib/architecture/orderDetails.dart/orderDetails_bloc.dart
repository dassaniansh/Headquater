import 'package:rxdart/rxdart.dart';
import 'package:shop_delivery/architecture/orderDetails.dart/orderDetails_entity.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';
import 'orderDetails_repo.dart';

class OrderDetailBloc implements BlocBase {
  var orderDetailBloc = BehaviorSubject<OrderDetails>();

   orders({String id}) async {
    var data = await OrderDetailRepo().getMyOrder(id: id);
    orderDetailBloc.add(data);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}