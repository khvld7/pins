import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pins/pin.dart';
import 'package:pins/style/style.dart';

import '../client/hive_names.dart';
import 'package:pins/adapter/hiver.dart';

class PinDetail extends StatefulWidget {
  final Pins? box;
  // final pinId;
  const PinDetail({Key? key, required this.box}) : super(key: key);

  @override
  State<PinDetail> createState() => _PinDetailState();
}

class _PinDetailState extends State<PinDetail> {
  final controller = TextEditingController();
  final controller_two = TextEditingController();
  String? title;
  String? text;


  
  

  void onFormSubmit() {
    Box<Pins> allpinsBox = Hive.box<Pins>(HiveBoxes.pins);


    allpinsBox.put(
        allpinsBox.keyAt.toString(),
        Pins(
            text: text == null ? widget.box!.text : text!,
            title: title == null ? widget.box!.title : title!));
    // Navigator.of(context).pop();

    setState(() {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => AllPins()));
    });

    // allpinsBox(Pins(title: title!, text: text!));
    // allpinsBox.putAt(
    //     Hive.box<Pins>(HiveBoxes.pins).values.length,
    //     Pins(
    //       title: controller.value.text == null ? title! : controller.value.text,
    //       text: controller_two.value.text,
    //     ));
  }

  void initState() {
    controller.text = widget.box!.title;
    controller_two.text = widget.box!.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = widget.box!.title;
    // FocusNode _focusNode = FocusNode();

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: TextButton(
        onPressed: (() {
          onFormSubmit();
        }),
        child: Text(
          'Готово',
          style: TextStyle(fontSize: 22),
        ),
        style: styleforEdit,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                TextFormField(
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
                  padding: const EdgeInsets.only(top: 15),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (value) => setState(() {
                      text = value;
                    }),
                    // focusNode: _focusNode,

                    // onEditingComplete: () => setState(() {
                    //   text = controller_two.value.text;
                    // }),
                    minLines: null,
                    controller: controller_two,
                    cursorColor: Colors.white,
                    showCursor: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'Введите текст',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20, right: 20)),
                    scrollPhysics: BouncingScrollPhysics(),
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}  
//  TextFormField(
//                   maxLines: 2,
//                   // keyboardType: TextInputType.multiline,
//                   textInputAction: TextInputAction.next,
//                   onChanged: (value) => setState(() {
//                     title = value;
//                   }),
//                   controller: controller,
//                   showCursor: true,
//                   cursorColor: Colors.white,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 55,
//                       fontWeight: FontWeight.bold),
//                   // keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                       hintText: 'Введите название',
//                       hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.only(left: 20, right: 20)),
//                   scrollPhysics: BouncingScrollPhysics(),
//                 ),