import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clickjobs/view/util/style/style.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';

class PhotoEditing extends StatefulWidget {
  const PhotoEditing({super.key});

  @override
  State<PhotoEditing> createState() => _PhotoEditingState();
}

class _PhotoEditingState extends State<PhotoEditing> {
  @override
  Widget build(BuildContext context) {
    final event = context.watch<AuthController>();
    return Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            showCupertinoDialog(
                context: context,
                builder: ((context) => CupertinoAlertDialog(
                      title: const Text('Choose'),
                      actions: [
                        CupertinoButton(
                            onPressed: (() async {
                              event.getImageFromCamera();

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }),
                            child: const Text("Take photo")),
                        CupertinoButton(
                            onPressed: (() async {
                              event.getImageFromGallery();

                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }),
                            child: const Text("From Gallery")),
                        CupertinoButton(
                            onPressed: (() async {
                              Navigator.pop(context);
                            }),
                            child: const Text('Cancel'))
                      ],
                    )));
          },
          child: Container(
            height: 55.h,
            width: 55.w,
            decoration: const BoxDecoration(
              color: Style.primaryColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.r),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ));
  }
}
