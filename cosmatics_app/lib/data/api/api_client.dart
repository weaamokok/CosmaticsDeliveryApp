import 'package:cosmatics_app/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/auth_pages/otp_verification_screen.dart';
import '../../pages/home/home_page.dart';
import '../../utils/colors.dart';

class ApiClient extends GetConnect implements GetxService {
  late String
      token; //when dealing with server we need a token and it should be initialized at the begining
  final String appBaseUrl;

  late Map<String, String> _mainHeaders; //
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl; //has to do with getx package managment
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN; //will wait 30 se for data to get
    _mainHeaders = {
      //headers are important to communicate with the server the same info are sent everytime so we make this line
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
//insted of http respons we are using getx respons
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //Auth with phone number
  LoginWithphoneNumber(String phoneNum) async {
    final auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth
            .signInWithCredential(credential)
            .whenComplete(() => Get.to(() => const HomePage()));
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
              '   رقم الهاتف غير صحيح', "تأكد من رقم الهاتف واعد المحاولة ",
              backgroundColor: blueush,
              colorText: Colors.white,
              animationDuration: const Duration(milliseconds: 50),
              isDismissible: true,
              duration: const Duration(milliseconds: 1500));
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.to(() => OtpVerificationScreen(
            phoneNum: phoneNum, verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verfiyOtp(String verificationId,String smsCode )async{
    final auth=FirebaseAuth.instance;
         
             
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential).whenComplete(() => Get.to(()=>const HomePage()));
  }
}
