import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sourcecode_project/views/Welcome/welcome1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sourcecode_project/views/Welcome/welcome2.dart';
import 'package:sourcecode_project/views/auth/login.dart';
import 'package:sourcecode_project/views/auth/register.dart';
import 'package:sourcecode_project/views/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Router(),
  ));
}

class Router extends StatefulWidget {
  const Router({super.key});

  @override
  State<Router> createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  // Pendefinisian routers
  final GoRouter _router = GoRouter(routes: [
    // Welcome
    GoRoute(path: '/', builder: (context, State) => const Welcome1(), routes: [
      GoRoute(path: 'welcome', builder: (context, state) => const Welcome2()),
      GoRoute(path: 'login', builder: (context, state) => const LoginPages()),
      GoRoute(
        path: 'register',
        builder: (context, state) => const SignInPages(),
      ),
      GoRoute(path: 'beranda', builder: (context, state) => const HomePage()),
    ]),
  ]);
}
