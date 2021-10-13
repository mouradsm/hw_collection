
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_colletion/controller/home_controller.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Home Page"),
          ],
        ),
      ),
    );

  }

}