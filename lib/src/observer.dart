import 'package:flutter_bloc/flutter_bloc.dart';

class DataObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    print("onCreate call");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    print("onClose call");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print("onError call");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    print("onTransition call");
    super.onTransition(bloc, transition);

//
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    print("onChange call");

    super.onChange(bloc, change);
  }
}
