import 'package:clickjobs/domen/model/user_model.dart';
import 'package:clickjobs/domen/repo/auth_repo.dart';
import 'package:clickjobs/domen/service/local_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  bool loadingLogin = false;
  bool isVisibility = true;

  UserCredential? userObject;
  String? wrongPassword;
  String email1 = '';

  final ImagePicker picker = ImagePicker();
  final AuthRepo authRepo = AuthRepo();

  int currentIndex = 0;
  XFile? image;

  getImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    print("xfile: ${image?.path}");
    notifyListeners();
  }

  getImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    print("xfile: ${image?.path}");
    notifyListeners();
  }

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  login(
    String email,
    String password, {
    required VoidCallback onSuccess,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.login(email, password);
    res.fold(
      (l) {
        LocalStore.setToken(l.token);
        onSuccess.call();
      },
      (r) {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(r.toString()),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
    isLoading = false;
    notifyListeners();
  }

  getApplicat(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.getUser(context);
    print('got youuuu');
    res.fold((l) {
      UserModel user = l;

      // ignore: avoid_print
      print('Modell: $user');
    }, (r) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(r),
          duration: const Duration(seconds: 3),
        ),
      );
    });
    isLoading = false;
    notifyListeners();
  }

  logOut(VoidCallback onSuccess) {
    authRepo.logOut(onSuccess);
  }

  onChange() {
    isVisibility = !isVisibility;
    notifyListeners();
  }

  loginGoogle(VoidCallback onSuccess) async {
    isLoading = true;
    notifyListeners();
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userObj =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userObj.user?.email != null) {
        userObject = userObj;
        // sing in
        onSuccess();
        isLoading = false;
        notifyListeners();
        googleSignIn.signOut();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      debugPrint(e.toString());
    }
  }

  createUser({
    required String email,
    required String password,
    required String username,
    required String role,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    // ignore: unused_local_variable
    final res = await authRepo.createUser(username, email, password, role);
    // ignore: unrelated_type_equality_checks
    if (res == '') {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.toString()),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      onSuccess();
    }
    isLoading = false;
    notifyListeners();
  }

  verificateEmail({
    required String verCode,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.verificateCode(verCode);
    // ignore: unrelated_type_equality_checks
    if (res == '') {
      onSuccess();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.toString()),
          duration: const Duration(seconds: 3),
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }
}
