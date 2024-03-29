// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../domen/service/local_store.dart';
import '../../util/style/style.dart';
import '../general/general_page.dart';
import 'onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      isLoading;
      checkToken();
      isLoading = false;
      setState(() {});
    });

    super.initState();
  }

  checkToken() async {
    if (await LocalStore.getAccessToken() == null ||
        await LocalStore.getAccessToken() == "") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const OnBoarding()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const GeneralPage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E9D57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 250.h,
              width: 250.w,
            ),
            Text(
              'ClickJobs',
              style: Style.textStyleRegular(
                size: 48,
                textColor: Style.whiteColor,
              ),
            ),
            34.verticalSpace,
            isLoading
                ? LoadingAnimationWidget.fallingDot(
                    color: Style.whiteColor,
                    size: 50,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
