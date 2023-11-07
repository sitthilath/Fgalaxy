import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/lotteries_treatise_state.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/domain/repository/lottery_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/repository/lotteries_treatise_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class LotteriesTreatiseNotifier extends StateNotifier<LotteriesTreatiseState> {
  final LotteriesTreatiseRepository repository;
  final LotteriesTreatiseCacheRepository cacheRepository;

  LotteriesTreatiseNotifier(
      {required this.repository, required this.cacheRepository})
      : super(const LotteriesTreatiseState.initial());

  Future<bool> get hasLotteriesTreatise async =>
      (await cacheRepository.hasLotteriesTreatise());

  Future<void> fetchAllLotteriesTreatise() async {
    state = state.copyWith(
      state: LotteriesTreatiseConcreteState.loading,
      isLoading: true,
    );
    if (await hasLotteriesTreatise) {
      final result = await cacheRepository.fetchLotteriesTreatise();
      _updateStateFromResult(result);
    } else {
      _fetchAllLotteriesTreatiseFromApi();
    }
  }

  void _fetchAllLotteriesTreatiseFromApi() async {
    final response = await repository.fetchAllLotteriesTreatise();
    response.fold((failure) {
      state = state.copyWith(
        state: LotteriesTreatiseConcreteState.failure,
        isLoading: false,
        message: failure.message,
      );
    }, (data) async {
      final lotteriesTreatiseList =
          data.data.map((e) => LotteriesTreatise.fromJson(e)).toList();
      await cacheRepository.saveLotteriesTreatise(
          lotteriesTreatise: lotteriesTreatiseList);
      state = state.copyWith(
        state: LotteriesTreatiseConcreteState.loaded,
        isLoading: false,
        hasLotteriesTreatise: true,
        lotteriesTreatiseList: lotteriesTreatiseList,
        message: '',
        filterLotteriesTreatise: lotteriesTreatiseList
      );
    });
  }

  Future<void> searchLotteryTreatise(String digits) async {
    final result = await cacheRepository.fetchLotteriesTreatise();
    _updateStateFromResult(result);
    final lottoTreatiseList = state.lotteriesTreatiseList;
    state = state.copyWith(
      state: LotteriesTreatiseConcreteState.loading,
      isLoading: true,
    );
    String concatDigit = '0';
    final lastDigit = (int.parse(digits) % 100).toString();
    if (lastDigit.length == 1) {
      concatDigit = '0$lastDigit';
    } else {
      concatDigit = lastDigit;
    }
    lottoTreatiseLoop:
    for (var data in lottoTreatiseList) {
      for (var digit in data.digits) {
        if (digit.digit.contains(concatDigit)) {
          state = state.copyWith(
            state: LotteriesTreatiseConcreteState.loaded,
            lotteriesTreatiseList: [data],
            hasLotteriesTreatise: true,
            isLoading: false,
          );
          break lottoTreatiseLoop;
        }
      }
    }
  }

  void resetState() {
    state = const LotteriesTreatiseState.initial();
  }

  void _updateStateFromResult(Either<AppException, List<LotteriesTreatise>> result) {
    result.fold((failure) {
      state = state.copyWith(
        state: LotteriesTreatiseConcreteState.failure,
        isLoading: false,
        message: failure.message,
      );
    }, (data) {
      state = state.copyWith(
        state: LotteriesTreatiseConcreteState.loaded,
        isLoading: false,
        lotteriesTreatiseList: data,
        hasLotteriesTreatise: true,
        message: '',
          filterLotteriesTreatise: data
      );
    });
  }



}
