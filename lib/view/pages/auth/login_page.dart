import 'package:clickjobs/domen/service/app_validators.dart';
import 'package:clickjobs/view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clickjobs/view/pages/auth/register_page.dart';
import 'package:clickjobs/view/pages/general/general_page.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../util/components/auth_button.dart';
import '../../util/components/custom_textfromfiled.dart';
import '../../util/style/style.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController password;
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    password = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.read<AuthController>();
    return Scaffold(
      body: ListView(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'ClickJobs',
                    style: Style.textStyleRegular(
                        size: 32, textColor: Style.primaryColor),
                  ),
                ),
                7.27.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text('Welcome Back 👋',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ]),
          7.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              'Let’s Register. Apply to jobs!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          47.verticalSpace,
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: CustomTextFrom(
                    validator: (s) {
                      if (AppValidators.isValidEmail(s)) {
                        return null;
                      } else {
                        return "Email xato";
                      }
                    },
                    controller: email,
                    hintext: '',
                    label: 'E-mail',
                    isObscure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFrom(
                    controller: password,
                    hintext: '',
                    label: 'Password',
                    isObscure: true,
                    validator: (s) {
                      if (s?.isEmpty ?? true) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<AuthController>().login(
                      email.text,
                      password.text,
                      onSuccess: () async {
                        context.read<AuthController>().getApplicat(context);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => const GeneralPage()),
                            (route) => false);
                      },
                      context: context,
                    );
                  }
                },
                child: const Button(text: 'Log in')),
          ),
          30.verticalSpace,
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ForgetPassword()));
              },
              child: const Center(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xff0E9D57),
                  ),
                ),
              )),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 70,
                  child: Divider(
                    color: Style.greyColor90,
                    thickness: 2,
                    height: 50,
                  )),
              16.horizontalSpace,
              const Text(
                'Or continue with',
                style: TextStyle(color: Color(0xffBDBEC2)),
              ),
              16.horizontalSpace,
              const SizedBox(
                  width: 70,
                  child: Divider(
                    color: Style.greyColor90,
                    thickness: 2,
                    height: 50,
                  )),
            ],
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  state.loginGoogle(() {
                    state.login(
                      state.userObject!.user!.email!,
                      'password',
                      onSuccess: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                      context: context,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Logo(Logos.google)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Logo(Logos.facebook_logo)),
              ),
            ],
          ),
          48.verticalSpace,
          SizedBox(
            width: 350,
            height: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                    (route) => false);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(color: Color(0xffBDBEC2)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(color: Color(0xff0E9D57))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
