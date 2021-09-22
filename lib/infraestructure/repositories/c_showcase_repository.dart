import 'package:injectable/injectable.dart';

import '../../domain/repositories/showcase_repository.dart';
import '../datasources/local_data_source.dart';
import '../../domain/adapters/showcase.dart';

@Injectable(as: ShowcaseRepository)
class CShowcaseRepository implements ShowcaseRepository {
  final LocalDataSource _dataSource;

  CShowcaseRepository(this._dataSource);

  @override
  Future<Showcase> readShowcase() async {
    return await _dataSource.readShowcase();
  }

  @override
  Future<void> setShowcase({required Showcase showcase}) async {
    await _dataSource.setShowcase(showcase: showcase);
  }
}
