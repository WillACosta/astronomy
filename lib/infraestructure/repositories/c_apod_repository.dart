import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'package:astronomy/core/exception/apod_server_failure.dart';
import 'package:astronomy/domain/repositories/apod_repository.dart';
import 'package:astronomy/infraestructure/datasources/apod_data_source.dart';
import 'package:astronomy/core/types/types.dart';

@Injectable(as: ApodRepository)
class CApodRepository implements ApodRepository {
  final ApodDataSource _dataSource;

  CApodRepository(this._dataSource);

  @override
  MediaOfTheDayType getMediaOfTheDay() async {
    try {
      final response = await _dataSource.getMediaOfTheDay();
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          message: 'An error as occurred!',
          error: e,
        ),
      );
    }
  }

  @override
  ListOfMediaType getMediaList({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await _dataSource.getMediaList(
        startDate: startDate,
        endDate: endDate,
      );

      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure(
          message: 'An error as occurred!',
          error: e,
        ),
      );
    }
  }
}
