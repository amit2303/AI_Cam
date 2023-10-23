import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Camera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker picker = ImagePicker();


  File? _image;
  chooseImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      setState(() {
      _image =File(image.path);
      });
    }
  }
  capctureImage()async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image !=null){
      setState(() {
      _image =File(image.path);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image !=null ? Image.file(_image!) : const Icon(Icons.image,size: 100,),
      
              ElevatedButton(
                onPressed: () {
                  chooseImage();
                },
                // onLongPress: (){
                //   capctureImage();
                // },
                child: const Text('Click to Capcture'),
              )
            ],
          ),
        ),
      ),
    );
  }
}