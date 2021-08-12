import 'package:astronomy/domain/repositories/i_apod_repository.dart';
import 'package:injectable/injectable.dart';

import 'i_home_usecase.dart';
import '../../../core/types/types.dart';

@Injectable(as: IHomeUseCase)
class HomeUseCase implements IHomeUseCase {
  final IApodRepository _repository;

  HomeUseCase(this._repository);

  @override
  MediaOfTheDayType getMediaOfTheDay() async {
    return await _repository.getMediaOfTheDay();
  }
}
