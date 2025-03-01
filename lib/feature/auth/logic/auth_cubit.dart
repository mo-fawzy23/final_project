import 'package:bloc/bloc.dart';
import 'package:final_project/core/network/remote/dio_helper.dart';
import 'package:final_project/core/network/remote/end_points.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String username, String password) {
    print("🔵 login() called with: username = $username, password = $password");
    emit(AuthLoginLoading());
    Map<String, String> data = {
      "username": "mor_2314",
      "password": "83r5^_",
    };
    DioHelper.postData(url: EndPoints.loginEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(AuthLoginSuccess());
      }else{
        emit(AuthLoginFailed("Login, Failed Please Try Again"));
      }
    }).onError( (error,stackTrace){
      emit(AuthLoginFailed("Login failed , please try again"));
    });
  }
  void register(String userName, String password, String email, String phone) {
    emit(AuthRegisterLoading());
    Map<String, String> data = {
      'username': userName,
      'password': password,
      "email": email,
      "phone": phone
    };
    DioHelper.postData(url: EndPoints.signUpEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(AuthRegisterSuccess());
      } else {
        emit(AuthRegisterFailed("Register failed , please try again"));
      }
    }).onError((error, stackTrace) {
      emit(AuthRegisterFailed("Register failed , please try again"));
    });
  }
}
