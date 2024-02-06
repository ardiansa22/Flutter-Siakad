part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial; //ketika aplikasi dijalankan
  const factory LoginState.loading() = _Loading; // ketika sedang login
  const factory LoginState.loaded(AuthResponseModel data) = _Loaded; //ketika data berhasil dimuat
  const factory LoginState.error(String message)   = _Error; //ketika terjadi error
}
