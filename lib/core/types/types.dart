import 'package:fpdart/fpdart.dart';

import '../exception/failure.exception.dart';
import '../../domain/entities/media.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;
typedef ListOfMediaType = Future<Either<Failure, List<Media>>>;

typedef DownloadServiceType = Future<Either<Failure, dynamic>>;

typedef AddFavoriteType = Future<void>;
typedef RemoveFavoriteType = Future<void>;
