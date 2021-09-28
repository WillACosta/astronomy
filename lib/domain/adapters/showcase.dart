import 'package:hive/hive.dart';

part 'showcase.g.dart';

@HiveType(typeId: 3)
class Showcase extends HiveObject {
  @HiveField(0)
  bool displayHomeShowcase;

  @HiveField(1)
  bool displayGridShowcase;

  @HiveField(2)
  bool displayGridDetailShowcase;

  Showcase({
    required this.displayHomeShowcase,
    required this.displayGridShowcase,
    required this.displayGridDetailShowcase,
  });
}
