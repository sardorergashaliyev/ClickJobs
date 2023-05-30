// ignore_for_file: prefer_const_constructors
import 'package:clickjobs/domen/service/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../util/components/auth_button.dart';
import '../../util/components/custom_textfromfiled.dart';
import '../../util/style/style.dart';
import 'confirm_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    email = TextEditingController();
    name = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    name.dispose();
    confirmPassword.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var state = context.read<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ClickJobs',
                    style: Style.textStyleRegular(
                        size: 32, textColor: Style.primaryColor),
                  ),
                  7.27.verticalSpace,
                  Text('Registration 👍',
                      style: Theme.of(context).textTheme.titleMedium),
                  7.verticalSpace,
                  Text(
                    'Let’s Register. Apply to jobs!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  31.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (s != '') {
                        return null;
                      } else {
                        return "Ismingizni kiriting";
                      }
                    },
                    controller: name,
                    hintext: '',
                    label: 'Name',
                    isObscure: false,
                  ),
                  16.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (AppValidators.isValidEmail(s ?? '')) {
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
                  16.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (AppValidators.isValidPassword(s ?? '')) {
                        return null;
                      } else {
                        return "Parol xato";
                      }
                    },
                    controller: password,
                    hintext: '',
                    label: 'Password',
                    isObscure: true,
                  ),
                  16.verticalSpace,
                  CustomTextFrom(
                    validator: (s) {
                      if (AppValidators.isValidConfirmPassword(
                          password.text, s)) {
                        return null;
                      } else {
                        return "Tasdiqlash parol xato";
                      }
                    },
                    controller: confirmPassword,
                    hintext: '',
                    label: 'Confirm Password',
                    isObscure: true,
                  ),
                  context.watch<AuthController>().wrongPassword != null
                      ? Text(
                          context.watch<AuthController>().wrongPassword ?? "",
                        )
                      : SizedBox.shrink(),
                  32.verticalSpace,
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context.read<AuthController>().createUser(
                                context: context,
                                email: email.text,
                                username: name.text,
                                role: 'applicant',
                                password: password.text,
                                onSuccess: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => VerifyPage(
                                        email: email.text,
                                      ),
                                    ),
                                  );
                                },
                              );
                        }
                      },
                      child: const Button(text: 'Register'),
                    ),
                  ),
                  32.verticalSpace,
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
                        ),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('object1122');
                          state.loginGoogle(
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => VerifyPage(
                                    email: email.text,
                                  ),
                                ),
                              );
                            },
                          );
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
                  32.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Have an account? ',
                              style: TextStyle(color: Color(0xffBDBEC2)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(
                                    color: Color(0xff0E9D57),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
