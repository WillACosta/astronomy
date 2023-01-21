import 'package:astronomy/domain/adapters/showcase.dart';

abstract class ShowcaseUseCase {
  Future<void> setShowcase({required Showcase showcase});
  Future<Showcase> readShowcase();
}
