import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:myarch/core/base/view/base_widget.dart';
import 'package:myarch/core/constant/image/pngimagepath.dart';
import 'package:myarch/core/init/lang/locale_keys.g.dart';
import 'package:myarch/features/splash/viewmodel/splashviewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) => Scaffold(
        backgroundColor: context.colorScheme.background,
        body: Center(
            child: Image.asset(
          PNGImagePaths.instance.travellogo,
          fit: BoxFit.cover,
          width: context.width * .6,
        )),
      ),
    );
  }
}
