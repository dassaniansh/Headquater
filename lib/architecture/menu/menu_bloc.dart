import 'package:rxdart/rxdart.dart';
import 'package:shop_delivery/architecture/menu/menu_entity.dart';
import 'package:shop_delivery/architecture/menu/menu_repo.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';

class GetMenuBloc implements BlocBase {
  var getMenuBloc = BehaviorSubject<GetMenu>();

  Future<GetMenu> getMenu() async {
    var data = await GetMenuRepo().getMenu();
    getMenuBloc.add(data);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
