import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LibaryDemo extends StatefulWidget {
  const LibaryDemo({Key? key}) : super(key: key);

  @override
  _LibaryDemoState createState() => _LibaryDemoState();
}

class _LibaryDemoState extends State<LibaryDemo> {
  final ImagePicker _picker = ImagePicker();
  File? setPhoto;

  setImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      setPhoto = File(photo!.path);
    });
  }

  startWebView(){
    return   WebView(
      initialUrl: 'https://flutter.dev',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  minRadius: 100,
                  backgroundImage: setPhoto == null
                      ? AssetImage('assets/HomeMadepizza.jpeg')
                      : FileImage(setPhoto!) as ImageProvider),
              MaterialButton(
                onPressed: () {
                  setImage();
                },
                child: Text('set profile Image'),
              ),
              Text('To view webview'),
              MaterialButton(
                color: Colors.purpleAccent,
                onPressed: startWebView,
                child: Text('click'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
