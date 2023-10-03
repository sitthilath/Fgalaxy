import 'package:flutter/cupertino.dart';

abstract class LoaderRepository {
  set context(BuildContext context);
  Future<void> showLoader(String title);
  Future<void> closeLoader();
}