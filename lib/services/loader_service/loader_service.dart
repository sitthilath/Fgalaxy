import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/repository/loader_repository.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/loading.dart';

class LoaderService  extends LoaderRepository{
  late BuildContext _buildContext;
  @override
  Future<void> closeLoader() {
     final navigator = Navigator.of(_buildContext);
     if (navigator.canPop()) {
         navigator.pop();
     }
     return Future.value(null);
  }

  @override
  set context(BuildContext context) {
    _buildContext = context;
  }

  @override
  Future<void> showLoader(String title) {
    return LoadingDialog.showAuthLoadingDialog(_buildContext, title: title);
  }

}