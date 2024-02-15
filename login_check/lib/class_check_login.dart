import 'package:flutter/material.dart';

@immutable
final class CheckLogin {
  final ValueNotifier<String> email = ValueNotifier<String>("");
  final ValueNotifier<String> password = ValueNotifier<String>("");
  final ValueNotifier<int> message = ValueNotifier<int>(0);
  bool get isvalid => email.value.isNotEmpty && password.value.isNotEmpty;
}
