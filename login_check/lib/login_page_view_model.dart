import 'package:check_login/class_check_login.dart';
import 'package:check_login/login_page.dart';
import 'package:flutter/material.dart';

mixin LoginPageViewModel on State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var loginCheck = CheckLogin();

  int login() {
    if (loginCheck.isvalid) {
      if (loginCheck.email.value == 'kemal@gmail.com' &&
          loginCheck.password.value == '123456') {
        //1. state giriş yapıldı
        return 1;
      } else {
        //2. state hatalı giriş
        return 2;
      }
    } else {
      //3. state boşluk bırakılmış
      return 3;
    }
  }

  Widget? showMySnackBar();
}
