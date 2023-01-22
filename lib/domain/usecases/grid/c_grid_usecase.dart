import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../repositories/apod_repository.dart';
import '../../../core/types/types.dart';
import '../../models/grid_page_dto.dart';

import 'grid_usecase.dart';

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
