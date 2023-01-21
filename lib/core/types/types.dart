import 'package:fpdart/fpdart.dart';

import 'package:astronomy/core/exception/failure.exception.dart';
import 'package:astronomy/domain/entities/media.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;
typedef ListOfMediaType = Future<Either<Failure, List<Media>>>;

typedef DownloadServiceType = Future<Either<Failure, dynamic>>;

typedef ToggleFavoriteType = Future<void>;
typedef RemoveFavoriteType = Future<void>;
