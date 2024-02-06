import 'package:dartz/dartz.dart';

import '../../common/constants/variables.dart';
import '../models/request/auth_request_model.dart';
import '../models/response/auth_response_model.dart';
import 'auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource { 
  Future<Either<String, AuthResponseModel>> login( //melakukan login ke server
      AuthRequestModel requestModel) async {
    final headers = { //mengatur header request HTTP
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(   //melakukan permintaan POST ke API nya
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: requestModel.toJson(),
    );
    if (response.statusCode == 200) {     //memeriksa status kode dari respon HTTP, jika kode 200=berhasil 
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, String>> logout() async { //fungsi logout
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return const Right('Logout Successfuly');
    } else {
      return const Left('server error');
    }
  }
}
