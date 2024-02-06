import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_tugas_besar/bloc/login/login_bloc.dart';
import 'package:flutter_template_tugas_besar/data/datasources/auth_local_datasource.dart';
import 'package:flutter_template_tugas_besar/data/models/request/auth_request_model.dart';
import 'package:flutter_template_tugas_besar/pages/dosen/dosen_page.dart';
import 'package:flutter_template_tugas_besar/pages/mahasiswa/mahasiswa_page.dart';

import '../../../common/components/buttons.dart';
import '../../../common/components/custom_text_field.dart';
import '../../../common/constants/colors.dart';

class LoginBottomSheet extends StatefulWidget { //widget yang menampilkan bottom sheet untuk login.
  // final VoidCallback onPressed;
  const LoginBottomSheet({
    super.key,
    //   required this.onPressed,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState(); 
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final usernameController = TextEditingController(); //digunakan untuk mengendalikan input username dan password.
  final passwordController = TextEditingController();

  @override
  void dispose() { //fungsi dispose untuk membersihkan sumber daya yang tidak lagi digunakan utk hemat memori
    usernameController.dispose();
    passwordController.dispose();
    super.dispose(); //untuk memanggil metode dispose()
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 40.0),
            ],
          ),
          const Divider(), //widget yang digunakan untuk menampilkan garis pemisah secara horizontal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Masukkan username dan password agar bisa mengakses informasi administrasi.",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              const SizedBox(height: 50.0),
              CustomTextField(
                controller: usernameController,
                label: 'Username',
              ),
              const SizedBox(height: 12.0),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: (){},
                    loaded: (data){
                      AuthLocalDatasource().saveAuthData(data);
                      if(data.user.roles == 'Mahasiswa' || data.user.roles == 'admin'){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return MahasiswaPage();
                        }));
                      }else{
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context){
                          return DosenPage();
                        }));
                      }
                    
                },
                error: (message){
                  showDialog(
                    context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(message),
                      );
                    });
                  },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: (){
                      return Button.filled(
                        onPressed: (){
                          final requestModel = AuthRequestModel(
                            email: usernameController.text, 
                            password: passwordController.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(requestModel));
                        },
                        label: 'Masuk'
                      );
                  }, loading: (){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
                  },
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
