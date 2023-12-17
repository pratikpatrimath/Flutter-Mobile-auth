import 'package:blackcoffer/login_page2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _phoneNumberController = TextEditingController();
  final _codeController = TextEditingController();

  late FirebasePhoneAuthHandler _firebasePhoneAuthHandler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(height: 120),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: 'Phone Number', suffixIcon: Icon(Icons.phone)),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationId, int? resendtoken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage2(
                                    verificationId: verificationId)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: _phoneNumberController.text.toString());
                },
                child: Text('Send OTP'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
