import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/exception/apod_server_failure.dart';
import '../../domain/repositories/i_apod_repository.dart';
import '../datasources/i_apod_data_source.dart';
import '../../core/types/types.dart';

@Injectable(as: IApodRepository)
class ApodRepository implements IApodRepository {
  final IApodDataSource _dataSource;

  ApodRepository(this._dataSource);

  @override
  MediaOfTheDayType getMediaOfTheDay() async {
    try {
      final response = await _dataSource.getMediaOfTheDay();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: 'An error as occurred!'));
    }
  }
}
