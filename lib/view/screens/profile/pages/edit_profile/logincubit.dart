import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/view/screens/profile/pages/edit_profile/loginstate.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool syncCont = true;
  String selectedLocation = 'USA';
  String phoneCityCode = '+1';

  syncContacts(bool syncContacts) {
    syncCont = syncContacts;
    emit(AuthComplete(syncContacts: syncCont));
  }

  valueDrop(String v) {
    selectedLocation = v;
    emit(AuthComplete(value: selectedLocation));
    if ('USA' == selectedLocation) {
      phoneCityCode = '+1';
      emit(AuthComplete(value: v, phoneCityCode: phoneCityCode));
    } else if ('RUS' == selectedLocation) {
      phoneCityCode = '+7';
      emit(AuthComplete(value: v, phoneCityCode: phoneCityCode));
    } else if ('UZB' == selectedLocation) {
      phoneCityCode = '+998';
      emit(AuthComplete(value: v, phoneCityCode: phoneCityCode));
    }
  }

  codeCity(String v) {
  phoneCityCode = v;

    emit(AuthComplete(value: phoneCityCode));

    if (v == '+1') {
      selectedLocation = 'USA';
      emit(AuthComplete(value: selectedLocation, phoneCityCode: v));
    } else if (v == '+7') {
      selectedLocation = 'RUS';
      emit(AuthComplete(value: selectedLocation, phoneCityCode: v));
    } else if (v == '+998') {
      selectedLocation = 'UZB';
      emit(AuthComplete(value: selectedLocation, phoneCityCode: v));
    }
  }
}