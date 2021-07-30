import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:myarch/core/base/model/base_view_model.dart';
import 'package:myarch/core/constant/navigationconstant.dart';
import 'package:myarch/core/init/navigation/navigation_service.dart';
part 'splashviewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void init() {
    _waitSplash();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void _waitSplash() {
    Future.delayed(
        Duration(seconds: 3),
        () => {
              NavigationService.instance
                  .navigateToPageClear(data: "", path: NavigationConstants.HOME)
            });
  }
}
