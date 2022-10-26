import 'package:dam_dor/views/auth/screens/otp/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  TextEditingController firstCodeController = TextEditingController();
  TextEditingController secondCodeController = TextEditingController();
  TextEditingController thirdCodeController = TextEditingController();
  TextEditingController fourthCodeController = TextEditingController();
  TextEditingController fifthCodeController = TextEditingController();
  TextEditingController sixthCodeController = TextEditingController();
  VoidCallback onPress;

  OTPScreen({
    Key? key,
    required this.firstCodeController,
    required this.secondCodeController,
    required this.thirdCodeController,
    required this.fourthCodeController,
    required this.fifthCodeController,
    required this.sixthCodeController,
    required this.onPress,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Verify OTP',
          style: GoogleFonts.raleway(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'To complete your phone number login, please enter 6 digits verification code sent to your number',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            // OTP Input
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otpInput(
                  codeController: widget.firstCodeController,
                  height: size.height * 0.06,
                  width: size.width * 0.12,
                  context: context,
                ),
                otpInput(
                    codeController: widget.secondCodeController,
                    height: size.height * 0.06,
                    width: size.width * 0.12,
                    context: context),
                otpInput(
                    codeController: widget.thirdCodeController,
                    height: size.height * 0.06,
                    width: size.width * 0.12,
                    context: context),
                otpInput(
                    codeController: widget.fourthCodeController,
                    height: size.height * 0.06,
                    width: size.width * 0.12,
                    context: context),
                otpInput(
                    codeController: widget.fifthCodeController,
                    height: size.height * 0.06,
                    width: size.width * 0.12,
                    context: context),
                otpInput(
                  codeController: widget.sixthCodeController,
                  height: size.height * 0.06,
                  width: size.width * 0.12,
                  context: context,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'OTP sent to mobile number',
              style: GoogleFonts.raleway(
                fontSize: 13,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(
                  size.width * 0.3,
                  size.height * 0.05,
                ),
                backgroundColor: Color(
                  0xff379c01,
                ),
              ),
              onPressed: widget.onPress,
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
