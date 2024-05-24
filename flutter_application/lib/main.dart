import 'package:flutter/material.dart';


//Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/src/pages/auth/login/login_page.dart';
import 'package:flutter_application/src/pages/auth/register/register_page.dart';
import 'package:flutter_application/src/pages/home/home_page.dart';
// import 'package:flutter_application/src/services/firestore_service.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routename,
      routes: {
        LoginPage.routename: (BuildContext context) => const LoginPage(),
        RegisterPage.routename: (BuildContext context) => const RegisterPage(),
        HomePage.routename: (BuildContext context) => const HomePage(),
      }
    );
  }
}

