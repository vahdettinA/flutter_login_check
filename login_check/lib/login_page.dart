import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:check_login/login_page_view_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextField(
                  onChanged: (value) {
                    loginCheck.email.value = emailController.text;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'email',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    loginCheck.password.value = passwordController.text;
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'password',
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  loginCheck.message.value = login();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 600),
                    content: showMySnackBar()!,
                    backgroundColor: Colors.white,
                  ));
                },
                child: const Text("login"))
          ],
        ),
      ),
    );
  }

  @override
  Widget? showMySnackBar() {
    switch (loginCheck.message.value) {
      case 1:
        return AwesomeSnackbarContent(
            title: 'Başarılı',
            message: 'Giriş Yapıldı',
            contentType: ContentType.success);
      case 2:
        return AwesomeSnackbarContent(
            title: 'Hatalı',
            message: 'Hatalı giriş yapıldı',
            contentType: ContentType.failure);
      case 3:
        return AwesomeSnackbarContent(
            title: 'Boşluk',
            message: 'Boş alan bırakmayın',
            contentType: ContentType.warning);
      default:
        return null;
    }
  }
}
