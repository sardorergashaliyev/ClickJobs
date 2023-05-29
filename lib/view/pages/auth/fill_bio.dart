import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../util/components/custom_date_picker.dart';
import '../../util/components/custom_phone_number_input.dart';
import '../../util/components/custom_textfromfiled.dart';
import '../../util/components/photo_editing.dart';
import '../../util/components/unfocus.dart';
import '../../util/components/uploading_photo.dart';

class FillBioPage extends StatefulWidget {
  const FillBioPage({super.key});

  @override
  State<FillBioPage> createState() => _FillBioPageState();
}

class _FillBioPageState extends State<FillBioPage> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phonenumber;
  late TextEditingController dateOfBirth;
  late TextEditingController bio;
  late TextEditingController speciality;

  String? countryValue;
  String? stateValue;
  String? cityValue;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String datetext = '';

  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    dateOfBirth = TextEditingController();
    phonenumber = TextEditingController();
    bio = TextEditingController();
    speciality = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    dateOfBirth.dispose();
    phonenumber.dispose();
    bio.dispose();
    speciality.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
    return OnUnFocusTap(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Fill in your bio',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'This data will be displayed in your account profile',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  state.image == null
                      ? const UploadingPhoto()
                      : const SizedBox.shrink(),
                  state.image == null
                      ? const SizedBox.shrink()
                      : Stack(
                          children: [
                            Container(
                              width: 250.w,
                              height: 250.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(
                                      File('${state.image?.path}'),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const PhotoEditing()
                          ],
                        ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Please enter First Name";
                        }
                        return null;
                      },
                      label: 'First Name',
                      controller: firstName,
                      keyboardType: TextInputType.emailAddress,
                      hintext: '',
                      isObscure: false,
                    ),
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Please enter Last Name";
                        }
                        return null;
                      },
                      controller: lastName,
                      label: 'Last Name',
                      keyboardType: TextInputType.name,
                      hintext: '',
                      isObscure: false,
                    ),
                  ),
                  35.verticalSpace,
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 24, right: 24),
                      child: CustomPhoneInput(
                        controller: phonenumber,
                      )),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: DatePicker(
                      controller: dateOfBirth,
                    ),
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: CSCPicker(
                      stateSearchPlaceholder: 'Search City',
                      stateDropdownLabel: 'City',
                      showCities: false,
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        cityValue = value;
                      },
                    ),
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Please enter your Bio";
                        }
                        return null;
                      },
                      label: 'Bio',
                      isObscure: false,
                      controller: bio,
                      keyboardType: TextInputType.emailAddress,
                      hintext: '',
                    ),
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    child: CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "Please enter your Speciality";
                        }
                        return null;
                      },
                      label: 'Speciality',
                      isObscure: false,
                      controller: speciality,
                      keyboardType: TextInputType.emailAddress,
                      hintext: '',
                    ),
                  ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
