import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pins/style/style.dart';
import 'client/hive_names.dart';
import 'package:pins/adapter/hiver.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // final searchController = TextEditingController();
  // void searchPins() {
  //   final query = searchController.text;
  //   if (query.isNotEmpty) {
  //     filterPins = entry.where((Entry entry) {
  //       return entry.name.toLowerCase().contains(query.toLowerCase());
  //     }).toList();
  //   } else {
  //     filterPins = entry;
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 60,
        child: TextField(
          // onChanged: (value) => onSearch(value),
          style: TextStyle(
            color: Colors.grey[350],
            fontSize: 18,
          ),
          cursorColor: Colors.white,
          // controller: searchController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(54, 55, 56, 1),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none),
            hintText: 'Поиск',
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
            prefixIcon: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}

class DirWidget extends StatefulWidget {
  const DirWidget({Key? key}) : super(key: key);

  @override
  State<DirWidget> createState() => _DirWidgetState();
}

class _DirWidgetState extends State<DirWidget> {
  var box = Hive.box<Pins>(HiveBoxes.pins);
  void _dir() {
    setState(() {
      Navigator.pushNamed(context, '/allpins');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
            child: Row(
              children: [Text('Папки', style: styleforDir)],
            ),
          ),
          Search(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 60,
              child: ElevatedButton(
                  style: styleforFolder,
                  onPressed: _dir,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.folder, size: 40),
                      Padding(padding: EdgeInsets.only(right: 15)),
                      Expanded(
                        child: Text(
                          'Заметки',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          box.length.toString(),
                          style: styleforCount,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: Colors.grey[500],
                      )
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
