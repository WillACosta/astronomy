import '../adapters/showcase.dart';

abstract class ShowcaseRepository {
  Future<void> setShowcase({required Showcase showcase});
  Future<Showcase> readShowcase();
}
