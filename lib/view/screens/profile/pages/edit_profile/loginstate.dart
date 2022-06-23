abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoding extends AuthState {}

class AuthComplete extends AuthState {
  bool? syncContacts = true;
  String? value = 'USA';
  String? phoneCityCode = '+1';
  

  AuthComplete({this.syncContacts, this.value,this.phoneCityCode});
}

class AuthError extends AuthState {}