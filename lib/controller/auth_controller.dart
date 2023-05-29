// ignore_for_file: avoid_print

import 'package:clickjobs/domen/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import '../domen/interface/auth_facade.dart';

class AuthController extends ChangeNotifier {
  UserCredential? userObject;
  String? wrongPassword;
  bool isLoading = false;
  bool loadingLogin = false;
  bool isVisibility = true;
  String email1 = '';
  final AuthFacade authRepo = AuthRepo();
  int currentIndex = 0;
  String fcmtoken2 = '';
  String? imageUrl;
  XFile? image;
  final ImagePicker picker = ImagePicker();

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

  signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    if (password == confirmPassword) {
      var res = await authRepo.login(email, password);
      email1 = email;
      // ignore: unrelated_type_equality_checks
      if (res == 200) {
        isLoading = false;
        notifyListeners();
        onSuccess();
      }
    } else {
      wrongPassword = "Error Password";
      notifyListeners();
    }
  }

  login({
    required String email,
    required String password,
    required VoidCallback onSuccess,
  }) async {
    loadingLogin = true;
    notifyListeners();

    // var res = await authRepo.login(email, password);
    // if (res?.statusCode == 200) {
    //   var login = LoginModel.fromJson(res?.data);
    //   LocalStore.setAccessToken(login.accessToken ?? "");
    //   loadingLogin = false;
    //   notifyListeners();
    //   onSuccess();
    // }
  }

  logOut() {
    authRepo.logOut();
    // LocalStore.clearAll();
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
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
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
      debugPrint(e.toString());
    }
  }
}
