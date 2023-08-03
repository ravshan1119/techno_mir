import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techno_mir/data/firebase/auth_service.dart';
import 'package:techno_mir/data/model/universal_data.dart';
import 'package:techno_mir/utils/ui_utils/error_message_dialog.dart';
import 'package:techno_mir/utils/ui_utils/loading_dialog.dart';
class AuthProvider with ChangeNotifier {
  AuthProvider({required this.authService});

  final AuthService authService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorText = "";

  loginButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  signupButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    showLoading(context: context);

    UniversalData universalData =
        await authService.signUpUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User signed Up", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> loginUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    showLoading(context: context);

    UniversalData universalData =
        await authService.loginUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User logged in", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    showLoading(context: context);

    UniversalData universalData = await authService.logOutUser();
    emailController.clear();
    passwordController.clear();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User logged in", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await authService.signInWithGoogle();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(
            message: "User Signed Up with Google.", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }
//
// notify(bool value) {
//   isLoading = value;
//   notifyListeners();
// }
//
// manageMessage(BuildContext context, String error) {
//   ScaffoldMessenger.of(context)
//       .showSnackBar(SnackBar(content: Text(error.toString())));
//
//   isLoading = false;
//   notifyListeners();
// }
}

// _checkAuthState() {
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });
// }
