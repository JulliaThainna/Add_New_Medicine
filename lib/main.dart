import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pallete.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add New Medicine',
      theme: ThemeData(
        primarySwatch: Palette.pinkToWhite,
        fontFamily: 'Montserrat',
        backgroundColor: const Color(0xffe5e5e5),
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Palette.pinkToWhite,
        ),
        toolbarHeight: 160,
        title: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
              text: 'Add New Medicine',
              style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Montserrat',
                  height: 1.5,
                  color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: '\nAnd set the infos',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ]),
        ),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 38),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter the medicine name',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Medicine name\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            maxLength: 300,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              //contentPadding: EdgeInsetsDirectional.only(bottom: 100, start: 10, top: 20),
              hintText: 'Enter the medicine description',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Description\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
              isDense: true, 
              
            ),
          ),
        ),


      ],
    );
    
  }
  
}
