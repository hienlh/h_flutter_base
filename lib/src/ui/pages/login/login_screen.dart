import 'package:flutter/material.dart';
import 'package:flutter_base/src/data/repositories/user_repository.dart';
import 'package:get/get.dart';

part 'login_controller.dart';

class LoginPage extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('LoginPage')),

    body: SafeArea(
      child: Text('LoginController'))
    );
  }
}