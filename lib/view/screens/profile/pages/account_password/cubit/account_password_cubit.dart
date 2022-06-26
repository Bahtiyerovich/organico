import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/view/screens/profile/pages/account_password/state/account_password_state.dart';

class AccountPasswordCubit extends Cubit<AccountPasswordState> {
  AccountPasswordCubit() : super(AccountPasswordInitial());
  bool sec1 = true;
  bool sec2 = true;
  bool sec3 = true;
  editSec1(bool v) {
    sec1 = v;
    emit(AccountPasswordComplete());
  }

  editSec2(bool v) {
    sec2 = v;
    emit(AccountPasswordComplete());
  }

  editSec3(bool v) {
    sec3 = v;
    emit(AccountPasswordComplete());
  }
}
