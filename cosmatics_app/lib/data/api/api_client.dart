import 'dart:convert';

import 'package:cosmatics_app/helper/curent_user.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:cosmatics_app/utils/endPionts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
         "Content-Type": "application/x-www-form-urlencoded",

    };
  }
//insted of http respons we are using getx respons
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      print(response.body);
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  } //Auth with phone number
//sign up
  SignupWithphoneNumber(String phoneNum) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth
            .signInWithCredential(credential)
            .then((value) => {
                  shared.setString('userId', value.user!.uid),
                  currentUser.currentUserID = value.user!.uid,
                  debugPrint(value.user!.uid)
                })
            .whenComplete(() {
          Get.to(() => const HomePage());
        });
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
        }  if (e.code == 'invalid-phone-number') {
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

  //Auth with phone number
  LoginWithphoneNumber(String phoneNum,String pass) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final auth = FirebaseAuth.instance;



    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: phoneNum,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await auth
    //         .signInWithCredential(credential)
    //         .then((value) => {
    //               shared.setString('userId', value.user!.uid),
    //               currentUser.currentUserID = value.user!.uid,
    //               debugPrint(value.user!.uid)
    //             })
    //         .whenComplete(() {
    //       Get.to(() => const HomePage());
    //     });
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     if (e.code == 'invalid-phone-number') {
    //       Get.snackbar(
    //           '   رقم الهاتف غير صحيح', "تأكد من رقم الهاتف واعد المحاولة ",
    //           backgroundColor: blueush,
    //           colorText: Colors.white,
    //           animationDuration: const Duration(milliseconds: 50),
    //           isDismissible: true,
    //           duration: const Duration(milliseconds: 1500));
    //     }
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     Get.to(() => OtpVerificationScreen(
    //         phoneNum: phoneNum, verificationId: verificationId));
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }

  verfiyOtp(String verificationId, String smsCode) async {
    final auth = FirebaseAuth.instance;
    final SharedPreferences shared = await SharedPreferences.getInstance();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await auth
        .signInWithCredential(credential)
        .then((value) => {
              shared.setString('userId', value.user!.uid),
              currentUser.currentUserID = value.user!.uid,
              debugPrint(value.user!.uid)
            })
        .whenComplete(() => Get.to(() => const HomePage()));
  }

 Future<String> checkIfPhoneExists(String phone)async {

     
      var message='';
    try {
      Map<String, dynamic> body = {
        'phone': phone,
      };
     // print(phone);
      Response response = await post(
          'https://cosmoapp.000webhostapp.com/isRegistered.php', body,
          contentType:
              'application/x-www-form-urlencoded',headers: _mainHeaders //هذا نوع البيانات الي مفروض نبعتوه باش يتعرف عليه الريكويست
          );
          if(response.statusCode==200)
       message = jsonDecode(response.body);
print(message);
      return message;
    } catch (e) {
   
      return  e.toString();
    }
  }
}
