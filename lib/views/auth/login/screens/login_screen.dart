import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.14,
          ),
          Align(
            child: Text(
              'Enter your mobile number',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'You will receive a one time pin as an SMS',
            style: GoogleFonts.raleway(
              fontSize: 15,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                helperText:
                    '*Login With Your Mobile Number with your country code',
                hintText: '+88',
                hintStyle: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff3a9c05),
                minimumSize: Size(
                  double.infinity,
                  size.height * 0.07,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Login with OTP',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
