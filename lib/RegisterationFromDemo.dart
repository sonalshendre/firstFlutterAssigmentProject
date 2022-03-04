import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/userInfo.dart';

class RegisterationDemo extends StatefulWidget {
  const RegisterationDemo({Key? key}) : super(key: key);

  @override
  RegisterationDemoState createState() => RegisterationDemoState();
}

class RegisterationDemoState extends State<RegisterationDemo> {
  String fname = '';
  String lname = '';
  String mobileNum = '';

  String email = '';
  String errorp = '';

  bool passwor = false;
  String r1 = 'male';
  String r2 = 'female';
  String gender = 'male';
  bool dancing = false;
  bool coding = false;
  bool singing = false;

  TextEditingController emailCotroller = TextEditingController();
  TextEditingController fNameCotroller = TextEditingController();
  TextEditingController lNameCotroller = TextEditingController();
  TextEditingController mobileNumCotroller = TextEditingController();
  String dropdownValue = 'A+';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rgistration app'),
          actions: const [
            Icon(Icons.settings),
            Icon(Icons.notifications),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    child: Image.network('https://img.freepik.com/free-vector/'
                        'color-wing-transparent-set_1284-8933.jpg?size=626&ext=jpg'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: fNameCotroller,
                          decoration: InputDecoration(
                              label: const Text(
                                'First name',
                                style: TextStyle(fontSize: 20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 3),
                              ),
                              filled: true,
                              fillColor: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: lNameCotroller,
                          decoration: InputDecoration(
                            label: const Text(
                              'Last name',
                              style: TextStyle(fontSize: 20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.purple, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 3),
                            ),
                            fillColor: Colors.grey,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailCotroller,
                    onChanged: (val) {
                      setState(() {
                        errorp = val.isEmpty ? 'enter valid Email' : '';
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      prefixIcon: const Icon(Icons.email),
                      errorText: errorp,
                      label: const Text(
                        'Email ID',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mobileNumCotroller,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      label: const Text(
                        'Mobile number',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 3),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwor = !passwor;
                          });
                        },
                        icon: Icon(
                            passwor ? Icons.visibility : Icons.visibility_off),
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      label: const Text(
                        'Password',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 3),
                      ),
                    ),
                    obscureText: passwor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('select Blood group', style: style_text(foSize: 20)),
                      DropdownButton<String>(
                        elevation: 3,
                        focusColor: Colors.grey,
                        iconEnabledColor: Colors.blueGrey,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['A+', 'AB+', 'O+', 'B+', 'B-', 'AB-']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'gender',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: r1,
                                    groupValue: gender,
                                    onChanged: (val) {
                                      setState(() {
                                        gender = val.toString();
                                      });
                                    }),
                                const Text('Male'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: r2,
                                    groupValue: gender,
                                    onChanged: (val) {
                                      setState(() {
                                        gender = val.toString();
                                      });
                                    }),
                                const Text('Female'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Hobbies',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: dancing,
                                  onChanged: (val) {
                                    setState(() {
                                      dancing = val!;
                                    });
                                  },
                                ),
                                const Text('Dancing'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: coding,
                                  onChanged: (val) {
                                    setState(() {
                                      coding = val!;
                                    });
                                  },
                                ),
                                const Text('coding'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: singing,
                                  onChanged: (val) {
                                    setState(() {
                                      singing = val!;
                                    });
                                  },
                                ),
                                const Text('singing'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInfo(
                                email: emailCotroller.text,
                                first_name: fNameCotroller.text,
                                last_name: lNameCotroller.text,
                                genderSelect: gender,
                                mobile_number: mobileNumCotroller.text,
                                dv: dropdownValue),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => UserInfo(),
                          ),
                        );
                      }
                      /* setState(() {
                        email = emailCotroller.text;
                        fname = fNameCotroller.text;
                        lname = lNameCotroller.text;
                        mobileNum = mobileNumCotroller.text;
                      });*/
                    },
                    child: const Text('submit'),
                    color: Colors.blue,
                    elevation: 5,
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Column(
                      children: [
                        Text(
                          fname,
                          style: style_text(),
                        ),
                        Text(
                          lname,
                          style: style_text(),
                        ),
                        Text(
                          email,
                          style: style_text(),
                        ),
                        Text(
                          mobileNum,
                          style: style_text(),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'blood group:    ',
                              style: style_text(),
                            ),
                            Text(
                              dropdownValue,
                              style: style_text(),
                            ),
                          ],
                        ),
                        Text(gender, style: style_text()),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'hobies:   ',
                                style: style_text(),
                              ),
                              Text(dancing == true ? 'dancing ' : ''),
                              Text(singing == true ? 'singing ' : ''),
                              Text(coding == true ? 'coding' : ''),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style_text({double foSize = 20,
  Color foColor = Colors.black87}) {
  return TextStyle(
    fontSize: foSize,
    color: foColor,
  );
}
