import 'package:injectable/injectable.dart';

import '../../repositories/apod_repository.dart';
import '../../../core/types/types.dart';
import '../../entities/grid_page_dto.dart';

import 'grid_usecase.dart';

@Injectable(as: GridUseCase)
class CGridUseCase implements GridUseCase {
  final ApodRepository _repository;

  CGridUseCase(this._repository);

  @override
  ListOfMediaType getMediaList(GridPageDto dto) async {
    return await _repository.getMediaList();
  }
}
