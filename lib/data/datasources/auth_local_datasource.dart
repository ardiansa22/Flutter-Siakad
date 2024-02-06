import 'package:flutter_template_tugas_besar/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthLocalDatasource { //mengelola data authentikasi lokal
  Future<bool> saveAuthData(AuthResponseModel data) async { //menyimpan data auth ke sharedpreferences
    final pref = await SharedPreferences.getInstance(); //fungsi sharePreferences:menyimpan informasi dan data yg diterima
    final result = await pref.setString('auth', data.toJson()); //fungsi await yaitu agar jika proses sebelumnya belum selesai 
                                                                 //maka tidak akan lanjut ke proses selanjutnya
    return result;
  }

  Future<bool> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.remove('auth');
    return result;
  }

    Future<String> getToken() async { //untuk mendapatkan token
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';
    if (jsonString.isEmpty) {
      return '';
    }
    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.jwtToken;
  }
Future<bool> isLogin() async { //apakah user sudah login atau belum?
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
 
 Future<User> getUser() async { //mendapatkan data dari user
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';

    final authModel = AuthResponseModel.fromJson(jsonString);
    return authModel.user;
  }
}
