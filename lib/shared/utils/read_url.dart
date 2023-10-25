import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> readLink(String url) async {
  if (url.contains("facebook.com")) {
    String newUrl = url;
    if (Platform.isAndroid) {
      newUrl = "fb://facewebmodal/f?href=$url";
    }

    if (await canLaunchUrl(Uri.parse(newUrl))) {
      await launchUrl(Uri.parse(newUrl));
    } else {
      print('There was a problem to open the url: $newUrl');
    }
  } else {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('There was a problem to open the url: ${url}');
    }
  }
}