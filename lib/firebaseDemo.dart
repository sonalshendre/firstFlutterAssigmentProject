import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/databaseStorageDemo.dart';

class FireBaseDemo extends StatefulWidget {
  const FireBaseDemo({Key? key}) : super(key: key);

  @override
  _FireBaseDemoState createState() => _FireBaseDemoState();
}

class _FireBaseDemoState extends State<FireBaseDemo> {
  FirebaseStorage storage = FirebaseStorage.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String selectedDataKey = '';
  String imageURL = '';

  uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    Reference reference =
        storage.ref().child("images/${DateTime.now().toString()}");

    UploadTask uploadTask = reference.putFile(File(image!.path));

    await (await uploadTask).ref.getDownloadURL().then((value) {
      print('========${value}');
      imageURL = value;
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your Email',
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
            ),
            MaterialButton(
              onPressed: () {
                MyDatabaseClass.insertData(
                        emailController.text, passController.text, imageURL)
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Text('Insert'),
            ),
            MaterialButton(
              onPressed: () {
                MyDatabaseClass.updateData(
                  emailController.text,
                  passController.text,
                  selectedDataKey,
                ).then((value) {
                  setState(() {});
                });
              },
              child: const Text('update'),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('Delete'),
            ),
            MaterialButton(
              onPressed: () {
                MyDatabaseClass.selectData().then((value) {
                  setState(() {});
                });
              },
              child: const Text('select'),
            ),
            MaterialButton(
              onPressed: uploadImage,
              child: Text('set image'),
            ),
            MaterialButton(onPressed: (){
              login();
            },
              child: Text('login_Auth'),
              color: Colors.purpleAccent,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: MyDatabaseClass.data.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      emailController.text =
                          MyDatabaseClass.data[index]['email'];
                      passController.text =
                          MyDatabaseClass.data[index]['password'];
                      selectedDataKey = MyDatabaseClass.data[index]['key'];
                    });
                  },
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          MyDatabaseClass.data[index]['imageurl']??''),),
                  title: Text(
                    MyDatabaseClass.data[index]['email'],
                  ),
                  subtitle: Text(
                    MyDatabaseClass.data[index]['password'],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      MyDatabaseClass.deleteData(
                          MyDatabaseClass.data[index]['key']);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
