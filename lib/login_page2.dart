import 'dart:math';

import 'package:blackcoffer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage2 extends StatefulWidget {
  String verificationId;
  LoginPage2({super.key, required this.verificationId});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otp Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'OTP', suffixIcon: Icon(Icons.lock)),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: _otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) {
                    if (value.user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  });
                } catch (ex) {
                  log(ex.toString() as num);
                }
              },
              child: Text('Verify OTP')),
        ],
      ),
    );
  }
}
