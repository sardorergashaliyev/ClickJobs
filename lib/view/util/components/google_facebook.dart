import 'package:clickjobs/controller/auth_controller.dart';
import 'package:clickjobs/view/pages/general/home_page.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class GoogleFacebook extends StatelessWidget {
  const GoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<AuthController>().loginGoogle(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (a) => const HomePage(),
                ),
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
    );
  }
}
