import 'package:fpdart/fpdart.dart';

import '../../domain/entities/media.entity.dart';
import '../exception/failure.exception.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;