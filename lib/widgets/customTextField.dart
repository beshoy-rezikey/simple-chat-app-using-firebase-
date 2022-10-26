import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {

   CustomFormTextField({ this.onChange,this.hintText,this.obsecureText =false }) ;

String ? hintText;
 void Function (String)? onChange;
bool ?obsecureText ;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obsecureText!,
      validator:(data) 
      {
        if (data!.isEmpty)
        {
          return 'field is requierd';
        }
      },

            onChanged: onChange,
            decoration: InputDecoration(
              hintText:hintText ,
              hintStyle:TextStyle(color: Colors.white) ,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ) ,
              border:OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ) ,
            ),
          );
}
}