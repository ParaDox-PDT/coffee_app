import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:paradoxs_coffee/data/local/storage_repository/storage_repository.dart';
import 'package:paradoxs_coffee/ui/app_routes.dart';
import 'package:paradoxs_coffee/utils/colors.dart';
import 'package:paradoxs_coffee/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init()async{
    await Future.delayed(const Duration(seconds: 2));
    if(StorageRepository.getBool("isStart")){
      if(context.mounted){
        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      }
    }else{
      await StorageRepository.putBool("isStart", true);
      if(context.mounted){
        Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
      }
    }

  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.white),
      ),
      body: Center(
        child: Lottie.asset(AppImages.splash),
      ),
    );
  }
}
