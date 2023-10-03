import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/loader_service.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/repository/loader_repository.dart';

final loaderProvider = Provider<LoaderRepository>((_) => LoaderService());