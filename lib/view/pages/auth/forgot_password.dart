import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/components/auth_button.dart';
import '../../util/components/custom_textfromfiled.dart';
import '../../util/style/style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            Text(
              'ClickJobs',
              style: Style.textStyleRegular(
                  size: 32, textColor: Style.primaryColor),
            ),
            32.verticalSpace,
            Text('Forgot Password',
                style: Theme.of(context).textTheme.displayMedium),
            34.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Enter your email or phone number, we will send you verification code',
                style: TextStyle(color: Color(0xff0D0D26)),
              ),
            ),
            30.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: CustomTextFrom(
                hintext: '',
                label: 'E-mail',
                isObscure: false,
              ),
            ),
            const Spacer(),
            const Button(text: 'Send Code'),
            26.verticalSpace
          ],
        ),
      ),
    );
  }
}
