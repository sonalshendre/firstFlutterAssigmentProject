import 'package:flutter/material.dart';
import 'package:untitled/thankyou.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OrderFormDemo extends StatefulWidget {
  OrderFormDemo({Key? key, this.product_Name = ''}) : super(key: key);
  String product_Name = '';

  @override
  OrderFormDemoState createState() => OrderFormDemoState();
}

class OrderFormDemoState extends State<OrderFormDemo> {
  bool pass = false;
  String error = '';
  bool success = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = '';



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fill the detail',
                  style: TextStyle(fontSize: 20),
                ),
                Text('Product Name : ${widget.product_Name}'),
                TextFormField(
                  controller: nameController,
                  decoration: inputField(
                      hintext: 'Enter Your Name', lable: 'Full Name'),
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) {
                    return val!.isEmpty ? 'Please Enter valid email' : null;
                  },
                  decoration: inputField(
                    hintext: 'Enter Your Email Address',
                    lable: 'Enter Email',
                  ),
                  onChanged: (val) {},
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  decoration: inputField(
                    hintext: 'Enter Your Address',
                    lable: 'Address',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  decoration: inputField(
                      hintext: 'Enter Your password',
                      lable: 'password'),
                ),
                SizedBox(
                  width: 10,
                ),

                MaterialButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text('Do you want to continue'),
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ThanksPage(
                                              user_name: nameController.text,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Text('ok')),
                              TextButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('cancel'))
                            ],
                          );
                        },
                      );
                    }
                  },
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  child: Text('submit'),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


  }

  @override
InputDecoration inputField({
  String hintext = '',
  String lable = '',
  String? errorT = null,
}) {
  return InputDecoration(
    hintText: hintext,
    label: Text(
      lable,
      style: TextStyle(color: Colors.black),
    ),
    errorText: errorT,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 5,
        color: Colors.grey,
        style: BorderStyle.solid,
      ),
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.black,
        )),
  );
}
