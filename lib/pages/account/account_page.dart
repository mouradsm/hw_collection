import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_colletion/pages/account/account_controller.dart';


class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Account Page"),
          ],
        ),
      ),
    );
  }
}
