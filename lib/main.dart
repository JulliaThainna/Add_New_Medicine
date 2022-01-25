import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
        toolbarHeight: 140,
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
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  String dropdownvalue = 'Item 1';
  var items = ['Item 1', 'Item 2', 'Item 3'];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //MEDICINE NAME FIELD
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 38),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(fontSize: 14),
              hintText: 'Enter the medicine name',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xff666666)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Medicine Name\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
            ),
          ),
        ),

        //MEDICINE DESCRIPTION FIELD
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            maxLength: 300,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsetsDirectional.only(bottom: 0, start: 10, top: 50),
              hintStyle: TextStyle(fontSize: 14),
              hintText: 'Enter the medicine description',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xff666666)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Description\n\n',
              alignLabelWithHint: false,
              fillColor: Color(0xffe6e6e6),
              filled: true,
              isDense: true,
            ),
          ),
        ),

        //CAROUSEL
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 20.0),
            child: const Text(
              'Medicine Type',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff666666),
                  fontSize: 10.5),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: SizedBox(
              height: 130.0,
              width: double.maxFinite,
              child: Carousel(
                images: const [
                  NetworkImage(
                      'https://images.unsplash.com/photo-1573883429746-084be9b5cfca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGlsbHN8ZW58MHx8MHx8&w=1000&q=80'),
                  NetworkImage(
                      'https://images.unsplash.com/photo-1573883429746-084be9b5cfca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGlsbHN8ZW58MHx8MHx8&w=1000&q=80'),
                  ExactAssetImage("assets/images/LaunchImage.jpg")
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Palette.blackToWhite.shade900,
                indicatorBgPadding: 5.0,
                dotBgColor: Palette.pinkToWhite,
                borderRadius: true,
                autoplay: false,
                //radius: const Radius.circular(30),
              ),
            ),
          ),
        ),

        //QUANTITY FIELD + DROPDOWN BUTTON
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 4,
                        decoration: const InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(fontSize: 14),
                          hintText: 'Enter the quantity',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff666666)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsetsDirectional.only(
                              bottom: 10, start: 10, top: 0, end: 0),
                          labelText: 'Quantity\n\n',
                          alignLabelWithHint: false,
                          fillColor: Color(0xffe6e6e6),
                          filled: true,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 10, start: 10, top: 0, end: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xffef6f86),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton(
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color(0xffffffff),
                          ),
                          underline: Container(
                            height: 0,
                          ),
                          dropdownColor: Palette.pinkToWhite,
                          borderRadius: BorderRadius.circular(30),
                          isExpanded: true,
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconEnabledColor: const Color(0xffffffff),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(child: Text(items)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //TIME SHEDULE
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 2,
                        decoration: const InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide.none,
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff666666),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Frequency\n\n',
                          alignLabelWithHint: false,
                          fillColor: Color(0xffe6e6e6),
                          filled: true,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xffef6f86),
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        dropdownColor: Palette.pinkToWhite,
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Center(child: Text(items)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: const Color(0xffef6f86),
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        dropdownColor: Palette.pinkToWhite,
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Center(child: Text(items)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
