import 'package:rxdart/rxdart.dart';
import 'package:shop_delivery/architecture/myOrder/myOrder_entity.dart';
import 'package:shop_delivery/architecture/myOrder/myOrder_repo.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';

class OrderBloc implements BlocBase {
  var orderBloc = BehaviorSubject<MyOrder>();

   orders({int id}) async {
    var data = await MyOrderRepo().getMyOrder(id: id);
    orderBloc.add(data);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
