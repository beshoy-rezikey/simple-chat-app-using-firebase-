
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/pages/chatPage.dart';
import 'package:scholar_chat/pages/loginPage.dart';
import 'package:scholar_chat/pages/registerPage.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(

  );
 
  runApp( ScholarChat());
}
class ScholarChat extends StatelessWidget {
  const ScholarChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
 
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatPage.id :(context) => ChatPage(),
      } ,
      initialRoute: LoginPage.id, 
    );
  }
}