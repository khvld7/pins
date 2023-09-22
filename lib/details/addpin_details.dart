// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pins/style/style.dart';
import 'package:hive/hive.dart';

import '../client/hive_names.dart';
import 'package:pins/adapter/hiver.dart';
import '../pin.dart';

class AddPinDeatils extends StatefulWidget {
  AddPinDeatils({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPinDeatils> createState() => _AddPinDeatilsState();
}

class _AddPinDeatilsState extends State<AddPinDeatils> {
  String? title;
  String? text;
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  TextEditingController controller_two = TextEditingController();

  void onFormSubmit() {
    if (_formKey.currentState!.validate()) {}

    Box<Pins> allpinsBox = Hive.box<Pins>(HiveBoxes.pins);
    setState(() {
      final add = allpinsBox.add(Pins(text: text!, title: title!));

      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => AllPins()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: TextButton(
            onPressed: onFormSubmit,
            child: Text(
              'Готово',
              style: TextStyle(fontSize: 22),
            ),
            style: styleforEdit,
          ),
          body: Container(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      validator: ((value) {
                        if (controller.value.text == null ||
                            controller.value.text == '') {
                          return 'Заполните поле';
                        }
                        return null;
                      }),
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 2,
                      maxLength: 25,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => setState(() {
                        title = value;
                      }),

                      controller: controller,
                      showCursor: true,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                      // keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          errorStyle: errorStyle,
                          hintText: 'Введите название',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20, right: 20)),
                      scrollPhysics: NeverScrollableScrollPhysics(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: ((value) {
                          if (controller_two.value.text == null ||
                              controller_two.value.text == '') {
                            return 'Заполните поле';
                          }
                          return null;
                        }),
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.newline,
                        onChanged: (value) => setState(() {
                          text = value;
                        }),
                        minLines: 1,
                        controller: controller_two,
                        cursorColor: Colors.white,
                        showCursor: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            errorStyle: errorStyle,
                            hintText: 'Введите текст',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20)),
                        scrollPhysics: BouncingScrollPhysics(),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
   
    // titleErr() {
    //   return AlertDialog(
    //     title: Text('Ошибка'),
    //     content: Text('Введите название заметки'),
    //   );
    // }

    // textErr() {
    //   return AlertDialog(
    //     title: Text('Ошибка'),
    //     content: Text('Введите текст'),
    //   );
    // }

    // setState(() {});

    // var delete = Hive.box<Pins>(HiveBoxes.pins).delete(this);/
    // final add = allpinsBox.add(Pins(
    //     text: text == null ? '' : text!, title: title == null ? '' : title!));
    // Navigator.of(context).pop();

