import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {


  UserInfo(
      {Key? key,
      this.email = '',
      this.first_name = '',
      this.last_name = '',
      this.mobile_number = '',
      this.genderSelect='', this. dv='',})
      : super(key: key);
  String first_name = '';
  String last_name = '';
  String mobile_number = '';
  String email = '';
  String genderSelect='';
  String dv='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          shadowColor: Colors.blueGrey,
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
          borderOnForeground: true,
          child: Container(

            height: 300,
           width: double.infinity,
           decoration: const BoxDecoration(
             color: Color(0xFFE1F5FE),
             borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),

           ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BackButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
               styleText(lable: 'Name:   $first_name $last_name'),
                Center(child: styleText(lable: 'Email:   $email')),
                styleText(lable: 'Moblie Number:   $mobile_number '),
                styleText(lable: 'gender:   $genderSelect'),
              styleText(lable: 'blood group:   $dv'),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget styleText({double fonSize=20, Color foColor=Colors.black87,String lable=''}){
  return Text(
    lable,
    style: TextStyle(
      fontSize:fonSize,
      color: foColor,

    ),

  );
}