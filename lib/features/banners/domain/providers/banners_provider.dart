import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/data/datasource/banners_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/banners/data/repository/banners_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/repository/banners_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final bannersDatasourceProvider = Provider.family<BannersDatasource, NetworkService>((_, networkService) => BannersRemoteDatasource(networkService));
final bannersRepositoryProvider = Provider<BannersRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final BannersDatasource bannersDatasource = ref.watch(bannersDatasourceProvider(networkService));
  return BannersRepositoryImpl(bannersDatasource);
});