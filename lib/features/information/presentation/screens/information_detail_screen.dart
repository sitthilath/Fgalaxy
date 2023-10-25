import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/infomation/information_model.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/date_formatter.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/utils/read_url.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class InformationDetailScreen extends StatelessWidget {
  static const String routeName = '/informationDetailScreen';

  const InformationDetailScreen({Key? key, required this.information})
      : super(key: key);
  final Information information;

  @override
  Widget build(BuildContext context) {
    return ThemeApp(
      child: Scaffold(
        appBar: SharedAppbar(title: Txt.t(context, 'news_detail_page_title')),
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
          ),
          child: ListView(
            children: [
              InkWell(
                onTap: () async {
                  if (information.newsLink.isNotEmpty) {
                    await readLink(information.newsLink);
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: cacheImageNetwork(information.imageUrl),
                  ),
                ),
              ),
              heightBox(6),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  information.name,
                  style: styleBlack(size: 16, weight: FontWeight.w700),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 6),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    SvgPicture.asset(
                      AppConstants.clock,
                      width: 18,
                      height: 18,
                      color: AppColor.primarySubTitle,
                    ),
                    widthBox(4),
                    Text(
                      '${dFullFormat(DateTime.now())}',
                      style: styleOption(
                        color:
                        AppColor.primarySubTitle,
                        size: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Html(
                  data: information.content,
                  onLinkTap: (url,_,e){
                    if(url!.isNotEmpty){
                      readLink(url);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
