import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add1',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          ),
      home: Add(),
    );
  }
}

class Add extends StatefulWidget {
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar (

      // ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  // Pick an image
  // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 100, 30, 50),
      child: Column(
        children: <Widget>[
          Text('Username'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(25.0))),
              labelText: 'Username',
            ),
          ),
          Text('Judul'),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(25.0))),
              labelText: 'Judul',
            ),
          ),
          Text('Deksripsi'),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Deksripsi',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(25.0))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              final pickedImage =
                  await _picker.pickImage(source: ImageSource.gallery);

              if (pickedImage != null) {
                setState(() {
                  image = pickedImage;
                  imageFile = File(image!.path);
                });
              }
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(
                        20) //                 <--- border radius here
                    ),
              ),
              child: image != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Center(
                      child: Text('Tap to upload image'),
                    ),
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('Cancel'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
            )),
            SizedBox(width: 20),
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
            ))
          ])
        ],
      ),
    );
  }
}
