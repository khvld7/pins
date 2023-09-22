import 'package:hive/hive.dart';
part 'hiver.g.dart';

@HiveType(typeId: 0)
class Pins extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String text;

  Pins({required this.text, required this.title});
}
