
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pins/details/addpin_details.dart';
import 'package:pins/dir.dart';
import 'package:pins/adapter/hiver.dart';
import 'client/hive_names.dart';
import 'pin.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PinsAdapter());
  await Hive.openBox<Pins>(HiveBoxes.pins);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main_screen': (context) => DirWidget(),
        '/allpins': (context) => AllPins(),
        '/allpins/newpin': (context) => AddPinDeatils(),
        // '/allpins/pin': ((context) {
        //   final id = ModalRoute.of(context)!.settings.arguments;
        //   return PinDetail(pinId: id);
        // })
      },
      initialRoute: '/main_screen',
    );
  }
}
