import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hw_colletion/util/storage.dart';

class AuthController extends GetxController {
  var errorText = ''.obs;
  var isVerified = false.obs;
  var isLoading = false.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;

  static final firebaseInstance = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  Future<bool> signIn() async {
    isLoading.value = true;

    if (GetUtils.isEmail(emailController.text) &&
        passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential =
        await firebaseInstance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        await Storage().setLoginValue();
        await Storage().setUid(userCredential.user.uid);

        isLoading.value = false;

        return true;
      } on FirebaseAuthException catch(e) {
        if(e.code == 'user-not-found' || e.code == 'wrong-password' ) {
          errorText.value = 'Wrong user or password';
          isLoading.value = false;
          return false;
        }
      }
    }

    errorText.value = 'Please try again later.';
    isLoading.value = false;
    return false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
