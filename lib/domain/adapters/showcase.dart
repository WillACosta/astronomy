import 'package:hive/hive.dart';

part 'showcase.g.dart';

@HiveType(typeId: 3)
class Showcase extends HiveObject {
  @HiveField(0)
  bool displayShowCase;

  Showcase({
    required this.displayShowCase,
  });
}
