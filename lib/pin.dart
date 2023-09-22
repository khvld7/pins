import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pins/client/hive_names.dart';
import 'package:pins/details/pin_details.dart';
import 'package:pins/dir.dart';
import 'package:pins/adapter/hiver.dart';
import 'package:pins/style/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:json_serializable/json_serializable.dart';

class AllPins extends StatefulWidget {
  const AllPins({
    Key? key,
  }) : super(key: key);

  @override
  State<AllPins> createState() => _AllPinsState();
}

class _AllPinsState extends State<AllPins> {
  @override
  void initState() {
    super.initState();
  }

  void onPinsTab(int index) {
    var box = Hive.box<Pins>(HiveBoxes.pins).getAt(index);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PinDetail(box: box)));
    // Navigator.of(context).pushNamed('/allpins/pin', arguments: box);
  }

  Widget countPin() {
    var box = Hive.box<Pins>(HiveBoxes.pins);
    if (box.length.toString() == '1') {
      return Text(box.length.toString() + ' заметка',
          style: const TextStyle(color: Colors.white, fontSize: 20));
    } else if (box.length.toString() == '2' ||
        box.length.toString() == '3' ||
        box.length.toString() == '4') {
      return Text(box.length.toString() + ' заметки',
          style: const TextStyle(color: Colors.white, fontSize: 20));
    } else {
      return Text(
        box.length.toString() + ' заметок',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      );
    }
  }

  void newpin() {
    Navigator.of(context).pushNamed('/allpins/newpin');
  }

  void back() {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => DirWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashColor: const Color.fromARGB(0, 255, 193, 7),
                splashRadius: 0.1,
                onPressed: (() => setState(() {})),
                icon: Icon(
                  Icons.restart_alt,
                  color: Colors.amber,
                ),
                iconSize: 30,
              ),
              // Container(width: 40),
              countPin(),
              IconButton(
                splashColor: const Color.fromARGB(0, 255, 193, 7),
                splashRadius: 0.1,
                onPressed: newpin,
                icon: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.amber[600],
                  size: 30,
                ),
              )
            ],
          )
        ],
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30,
                      color: Colors.amber,
                      splashColor: Color(0),
                      highlightColor: Color(0),
                      onPressed: back,
                      icon: Icon(FontAwesomeIcons.chevronLeft)),
                  Text(
                    'Заметки',
                    style: styleforDir,
                  ),
                  Container(width: 50),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 0),
            child: Search(),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<Pins>(HiveBoxes.pins).listenable(),
                      builder: (context, Box<Pins> box, _) {
                        return ListView.builder(
                          // reverse: true,
                          physics: ClampingScrollPhysics(),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: box.values.length,
                          itemBuilder: (BuildContext context, int index) {
                            Pins? res = box.getAt(index);
                            return Dismissible(
                              resizeDuration: Duration(milliseconds: 300),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                decoration: ShapeDecoration(
                                  color: Color.fromARGB(255, 210, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: FaIcon(
                                        FontAwesomeIcons.trash,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: ((direction) {
                                setState(() {
                                  box.deleteAt(index);
                                });
                              }),
                              key: UniqueKey(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: ElevatedButton(
                                  style: styleforPin,
                                  onPressed: () => onPinsTab(index),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                top: 25,
                                                right: 15,
                                                bottom: 10),
                                            child: Container(
                                              // color: Colors.amber,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '${res!.title}',
                                                style: styletextPin,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, bottom: 25),
                                                  child: Text(
                                                    '${res.text}',
                                                    maxLines: 1,
                                                    style: styleaboutPin,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })))
        ]));
  }
}
