import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/providers/information_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/providers/state/information_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/simple_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class InformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/informationScreen';

  const InformationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => InformationState();
}

class InformationState extends ConsumerState<InformationScreen> {
  final ScrollController _controller = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(scrollControllerListener);
  }

  void scrollControllerListener() {
    if (_controller.position.maxScrollExtent == _controller.offset) {
      final notifier = ref.read(informationNotifierProvider.notifier);
      notifier.fetchAllInformation();
    }
  }

  void refreshScrollControllerListener() {
    _controller.removeListener(scrollControllerListener);
    _controller.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(informationNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.listen(informationNotifierProvider.select((value) => value), (previous, next) {
      if(next.state == InformationConcreteState.fetchedAll){
        if(next.message.isNotEmpty){
          ref.read(toastMessageProvider).messageInfo(message: Txt.t(context, next.message));
        }
      }
    });
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SimpleAppbar(title: Txt.t(context, 'news_page_title')),
        body: state.state == InformationConcreteState.loading
            ? Center(child: circleLoading(color: AppColor.whiteColor))
            : state.hasData
                ? Stack(
                    children: [
                      RefreshIndicator(
                        color: AppColor.whiteColor,
                        backgroundColor: AppColor.primaryColor,
                        displacement: 80,
                        strokeWidth: 2.2,
                        onRefresh: (){
                          ref.read(informationNotifierProvider.notifier).resetState();
                         return ref.read(informationNotifierProvider.notifier).fetchAllInformation();
                        },
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: state.informationList.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          itemBuilder: (BuildContext context, int index) {
                            final information = state.informationList[index];
                            return InkWell(
                              onTap: (){
                                AutoRouter.of(context).push(InformationDetailRoute(information: information));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          height: 200,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: cacheImageNetwork(
                                                information.imageUrl,
                                              ),
                                            ),
                                          ),
                                        ),
                                        heightBox(6),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text(
                                            information.name,
                                            style: styleBlack(
                                                size: 16, weight: FontWeight.w700),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 6),
                                        //   child: Text(
                                        //     information.content,
                                        //     style: styleOption(
                                        //       size: 14,
                                        //       fontWeight: FontWeight.w400,
                                        //       color: AppColor.fontGrayColor,
                                        //     ),
                                        //     overflow: TextOverflow.ellipsis,
                                        //     maxLines: 2,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (state.state == InformationConcreteState.fetchingMore)
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 15,
                          child: Container(
                            alignment: const Alignment(0, 0),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : Center(
                    child: Text(
                      Txt.t(context, state.message),
                      style: styleWhite(size: 16, weight: FontWeight.w400),
                    ),
                  ),
      ),
    );
  }
}
