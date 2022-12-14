import 'package:dam_dor/constants/widgets/showSnackBar.dart';
import 'package:dam_dor/views/auth/screens/otp/screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthServices {
  final FirebaseAuth auth;

  AuthServices({
    required this.auth,
  });

  //phone sign in

  Future<void> phoneSignIn(String phoneNumber, BuildContext context) async {
    TextEditingController codeController = TextEditingController();
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            showSnackBar(
              context: context,
              message: 'Verification Failed: ${e.message}',
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(
                  codeController: codeController,
                  onPress: () async {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: codeController.text.trim());
                    await auth.signInWithCredential(phoneAuthCredential);
                  },
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      showSnackBar(context: context, message: e.toString());
    }
  }
// phone sign in end
}
