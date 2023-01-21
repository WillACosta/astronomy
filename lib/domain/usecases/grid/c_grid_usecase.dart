import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:astronomy/domain/repositories/apod_repository.dart';
import 'package:astronomy/core/types/types.dart';
import 'package:astronomy/domain/entities/grid_page_dto.dart';

import 'package:astronomy/domain/usecases/grid/grid_usecase.dart';

@Injectable(as: GridUseCase)
class CGridUseCase implements GridUseCase {
  final ApodRepository _repository;

  CGridUseCase(this._repository);

  @override
  ListOfMediaType getMediaList(GridPageDto dto) async {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return await _repository.getMediaList(
      startDate: dateFormat.format(dto.dateTimeRange.start),
      endDate: dateFormat.format(dto.dateTimeRange.end),
    );
  }
}
