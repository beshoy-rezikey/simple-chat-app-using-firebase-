// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/helper/showsnackbar.dart';
import 'package:scholar_chat/pages/chatPage.dart';
import 'package:scholar_chat/pages/registerPage.dart';
import 'package:scholar_chat/widgets/constatnts.dart';
import 'package:scholar_chat/widgets/customButton.dart';
import 'package:scholar_chat/widgets/customTextField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({ Key? key }) : super(key: key);

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool isLoading = false;
  String ? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
    
        backgroundColor:kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
             
              children: [
                 SizedBox(height: 75,),
                Image.asset('assets/images/scholar.png',height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Scholar Chat ', style: TextStyle(
                      fontSize: 32,
                      fontFamily:'pacifico',
                      color: Colors.white,
                    ),),
                  ],
                ),
                 SizedBox(height: 75,),
                 Row(
                   children: [
                     Text('LOGIN ', style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                ),),
                   ],
                 ),
                 const SizedBox(height: 20,),
                CustomFormTextField(hintText: 'Email' ,onChange: (data) {
                  
                  email =data ;
                },),
                  const SizedBox(height: 10,),
                CustomFormTextField(hintText: 'password',onChange: (data) {
                  password=data;
                },obsecureText:  true),
                             const SizedBox(height: 20,),
              
                CustomButton(text: 'Login',
          
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        
                      });
                      try {
                        await loginUser();
                    Navigator.pushNamed(context, ChatPage.id,arguments: email);
                      } on FirebaseException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(context, 'No user found for that email');
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'Wrong password provided for that user');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'there is an error');
                      }
                      isLoading = false;
                      setState(() {
                        
                      });
                    } else {}
                  },
                ),
                   const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(  'dont\'t have an account ?',style: TextStyle(color: Colors.white),),
                       GestureDetector(
                      child: Text('  Register',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0XFFC7EDE6,),
                          )),
                      onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                      },
                    ),
                  ],
                ),
                
              
               
              
              ],
            ),
          ),
        ),
      ),
    );
  }
 

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}