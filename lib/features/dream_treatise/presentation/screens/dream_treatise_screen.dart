import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/dream_treatise_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/state/dream_treatise_state.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/widgets/dream_treatise_card_item.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/widgets/search_text_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/utils/messaging.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/leading_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/empty_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class DreamTreatiseScreen extends ConsumerStatefulWidget {
  static const String routeName = '/dreamTreatiseScreen';

  const DreamTreatiseScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DreamTreatiseScreen> createState() =>
      _DreamTreatiseScreenState();
}

class _DreamTreatiseScreenState extends ConsumerState<DreamTreatiseScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final scrollController = ScrollController();
  bool isSearchActive = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
    _appInitial();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dreamTreatiseNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.listen(dreamTreatiseNotifierProvider.select((value) => value), (previous, next) {
       if(next.state == DreamTreatiseConcreteState.failure){
        ref.read(toastMessageProvider).messageError(message: next.message);
      }
    });
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: LeadingAppbar(title: Txt.t(context, 'dream_treatise')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Center(
                        child: SvgPicture.asset(AppConstants.search),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SearchTextField(
                        controller: _searchTextController,
                        hint: Txt.t(context, 'search_hint'),
                        onSearch: _onSearchDreamTreatise,
                      ),
                    ),
                    if (isSearchActive)
                      InkWell(
                        onTap: _onClearTextSearch,
                        child: SizedBox(
                          width: 30,
                          child: Center(
                            child: SvgPicture.asset(AppConstants.close,
                                color: AppColor.grayColor),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 26,
                            child:
                            SvgPicture.asset(HomeMenuIcons.dreamTreatise),
                          ),
                          widthBox(10),
                          Text(
                            Txt.t(context, 'dream_treatise'),
                            style:
                            styleBlack(size: 14, weight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Expanded(child: _selectorWidget(state)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSearchDreamTreatise(String query) {
    if(query.isNotEmpty){
      setState(() {
        isSearchActive = true;
      });
       ref.read(dreamTreatiseNotifierProvider.notifier).resetState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .read(dreamTreatiseNotifierProvider.notifier)
            .searchDreamTreatise(query: query);
      });
      refreshScrollControllerListener();
    }else{
      _onClearTextSearch();
    }
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(dreamTreatiseNotifierProvider.notifier);
      if (isSearchActive) {
        notifier.searchDreamTreatise(query: _searchTextController.text);
      } else {
        notifier.fetchAllDreamTreatise();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  _selectorWidget(DreamTreatiseState state) {
    if (state.state == DreamTreatiseConcreteState.loading) {
      return Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: circlePrimaryLoading(),
        ),
      );
    } else if (state.hasDreamTreatise) {
      return _bodyWidget(state, context);
    } else {
      return Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: emptyResult(
          title: Txt.t(context, Messaging.NOT_FOUND_DATA),
        ),
      );
    }
  }

  void _appInitial() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(dreamTreatiseNotifierProvider.notifier)..resetState()..fetchAllDreamTreatise();
    });
  }

  _bodyWidget(DreamTreatiseState state, BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          color: AppColor.primaryColor,
          backgroundColor: Colors.white,
          displacement: 80,
          strokeWidth: 2.2,
          onRefresh: () {
            ref.read(dreamTreatiseNotifierProvider.notifier).resetState();
            return ref.read(dreamTreatiseNotifierProvider.notifier).fetchAllDreamTreatise();
          },
          child: ListView.builder(
            itemCount: state.dreamTreatisesList.length,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemBuilder: (context, int index,) {
              final item = state.dreamTreatisesList[index];
              return DreamTreatiseCardItem(dreamTreatise: item);
            },),
        ),
        if (state.state == DreamTreatiseConcreteState.fetchingMore)
          Positioned(
            right: 0,
            left: 0,
            bottom: 15,
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 30,
                height: 30,
                child: circlePrimaryLoading(),
              ),
            ),
          ),
      ],
    );
  }

  void _onClearTextSearch() {
    _searchTextController.clear();
    focusDisable(context);
    setState(() {
      isSearchActive = !isSearchActive;
    });
    ref.read(dreamTreatiseNotifierProvider.notifier).resetState();
    if(!isSearchActive){
      ref.read(dreamTreatiseNotifierProvider.notifier).fetchAllDreamTreatise();
    }
    refreshScrollControllerListener();
  }
}
