import 'package:bloc/bloc.dart';
import 'package:flutter_template_tugas_besar/data/datasources/auth_local_datasource.dart';
import 'package:flutter_template_tugas_besar/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_template_tugas_besar/data/models/request/auth_request_model.dart';
import 'package:flutter_template_tugas_besar/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

//import file yang terkait di bloc
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) { //konstruktor inisialisasi login dengan state awal initial
    on<_Login>((event, emit) async { //menunjukkan bahwa proses login sedang berlangsung
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.requestModel); //memanggil method login dari authremotedatasourse
      response.fold( //hasil dari login
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
