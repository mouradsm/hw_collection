import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_colletion/util/colors.dart';
import 'package:hw_colletion/view/pages/home_page.dart';

import '../../../controller/auth_controller.dart';
import '../../widgets/border_textfield.dart';


class LoginPage extends StatelessWidget {
  static const String signUp = 'Don\'t have a account? SignUp';
  static const String login = 'Login';
  static const String emailHint = 'Enter your Email';
  static const String passwordHint = 'Enter your Password';
  static const String authFail = 'Authentication Fail';

  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return authController.isLoading.value
              ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: ColorConstants.WHITE,
              ))
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 80.0,
                  ),
                  const Text(
                    login,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  BorderTextField(
                    controller: authController.emailController,
                    hintText: emailHint,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  BorderTextField(
                    controller: authController.passwordController,
                    hintText: passwordHint,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () async {
                      // Get.offAll(LandingPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('Forgot your Password ?'),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorConstants.PRIMARY,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        await authController.signIn() ? Get.offAll(HomePage()) :
                            Get.snackbar("Cagou", "Deu Zebra!");

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40.0,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorConstants.PRIMARY,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text(
                            login,
                            style: TextStyle(fontSize: 30.0)
                        ),

                      ),
                    )
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Center(
                  //   child: CustomeButton(
                  //     title: signUp,
                  //     onTap: () {
                  //       Get.to(Home());
                  //     },
                  //     height: 25.0,
                  //     width: MediaQuery.of(context).size.width * 0.7,
                  //     fontSize: 15.0,
                  //     color: ColorConstants.DARK,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}