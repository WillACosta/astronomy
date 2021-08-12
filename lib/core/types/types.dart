import 'package:fpdart/fpdart.dart';

import '../../domain/entities/media.dart';
import '../exception/failure.exception.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;