import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hw_colletion/pages/account/account_page.dart';
import 'package:hw_colletion/pages/colletion/collection_page.dart';
import 'package:hw_colletion/pages/dashboard/dashboard_binding.dart';
import 'package:hw_colletion/pages/dashboard/dashboard_page.dart';
import 'package:hw_colletion/util/storage.dart';
import 'package:hw_colletion/view/pages/auth/login_page.dart';

import 'view/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DashboardBindings(),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/collection': (context) => const CollectionPage(),
        '/account': (context) => const AccountPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Storage().getLoginValue() ? DashboardPage() : const LoginPage()
    );
  }
}






