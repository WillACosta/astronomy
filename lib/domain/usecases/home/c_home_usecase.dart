import 'package:astronomy/domain/repositories/apod_repository.dart';
import 'package:injectable/injectable.dart';

import 'home_usecase.dart';
import '../../../core/types/types.dart';

@Injectable(as: HomeUseCase)
class CHomeUseCase implements HomeUseCase {
  final ApodRepository _repository;

  CHomeUseCase(this._repository);

  @override
  MediaOfTheDayType getMediaOfTheDay() async {
    return await _repository.getMediaOfTheDay();
  }
}
