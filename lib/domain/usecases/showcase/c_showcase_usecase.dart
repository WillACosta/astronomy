import 'package:injectable/injectable.dart';

import '../../repositories/showcase_repository.dart';
import '../../adapters/showcase.dart';

import 'showcase_usecase.dart';

@Injectable(as: ShowcaseUseCase)
class CShowcaseUsecase implements ShowcaseUseCase {
  final ShowcaseRepository _repository;

  CShowcaseUsecase(this._repository);

  @override
  Future<Showcase> readShowcase() async {
    return await _repository.readShowcase();
  }

  @override
  Future<void> setShowcase({required Showcase showcase}) async {
    await _repository.setShowcase(showcase: showcase);
  }
}
