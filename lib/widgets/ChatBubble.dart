import 'package:flutter/material.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/constatnts.dart';

class ChatBubble extends StatelessWidget {
const  ChatBubble({
    Key? key,
    required this.message
  }) : super(key: key);
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
     
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: EdgeInsets.only(left: 16,bottom: 24,top: 24,right: 28),

        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(32),
            topEnd: Radius.circular(32),
            bottomEnd: Radius.circular(32),
          ) ,
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubbleForFreined  extends StatelessWidget {
const  ChatBubbleForFreined({
    Key? key,
    required this.message
  }) : super(key: key);
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
     
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: EdgeInsets.only(left: 16,bottom: 24,top: 24,right: 28),

        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(32),
            topEnd: Radius.circular(32),
            bottomStart: Radius.circular(32),
          ) ,
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}