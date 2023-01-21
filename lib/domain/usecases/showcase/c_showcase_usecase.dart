import 'package:injectable/injectable.dart';

import 'package:astronomy/domain/repositories/showcase_repository.dart';
import 'package:astronomy/domain/adapters/showcase.dart';

import 'package:astronomy/domain/usecases/showcase/showcase_usecase.dart';

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
