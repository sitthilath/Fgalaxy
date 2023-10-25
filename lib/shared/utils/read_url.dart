import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> readLink(String url) async {
  if(await canLaunchUrl(Uri.parse(url))){
    if(!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)){
      throw Exception('ບໍ່ສາມາດອ່ານລິ້ງນີ້ໄດ້: $url');
    }
  }
}