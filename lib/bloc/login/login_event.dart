part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.login(AuthRequestModel requestModel) = _Login; //ketika dilakukan login berdasarkan request ke model
}