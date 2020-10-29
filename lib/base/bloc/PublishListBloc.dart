// import 'package:best_flutter_ui_templates/base/bloc/BlocBase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_delivery/base/bloc/BlocBase.dart';

class BehaviorListBloc<T> implements BlocBase {
  final bloc = PublishSubject<List<T>>();

  get stream => bloc.stream;

  get sink => bloc.sink;

  @override
  void dispose() {
    bloc.close();
  }
}
