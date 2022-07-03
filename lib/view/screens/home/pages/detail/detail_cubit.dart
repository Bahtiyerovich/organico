
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/view/screens/home/pages/detail/detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());
  int count = 0;

  plus(int i) {
    count += i;
    emit(DetailComplete(count: count));
  }

  minus(int i) {
    if (count == 0) {
      count = 0;
    } else {
      count -= i;
    }
    emit(DetailComplete(count: count));
  }
}
