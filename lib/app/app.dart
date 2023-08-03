import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/auth_provider.dart';
import 'package:techno_mir/ui/tab/tab_box.dart';
import 'package:techno_mir/ui/tab_client/tab_box.dart';
import 'package:techno_mir/utils/constants.dart';

import '../ui/auth/auth_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return const AuthScreen();
          } else {
            return snapshot.data!.email == adminEmail
                ? const TabBoxAdmin()
                : const TabBoxClient();
          }
        },
      ),
    );
  }
}
