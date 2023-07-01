import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/app_icon.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNum;
  const OtpVerificationScreen({required this.phoneNum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.height45, horizontal: Dimensions.height30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(icon: Icons.arrow_back, onTap: () {Navigator.pop(context);}),
            Center(
              child: Image.asset('assets/image/otp.png',
                  width: Dimensions.height150),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Center(child: BigText(text: 'أدخل الرمز المرسل على الرقم $phoneNum',size: 14,color: black,)),   SizedBox(
              height: Dimensions.height20,
            ),
            Center(
                child: OTPTextField(
              length: 6,
              width: Dimensions.height150/1.5,
              fieldStyle: FieldStyle.box,
              fieldWidth: Dimensions.height50/2,
            )),SizedBox(
              height: Dimensions.height20,
            ), Center(
              child: InkWell(onTap: ()async {
              //  await FirebaseAuth.instance.();
              },
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height100,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: blueush),child: Center(child: BigText(text: " تأكيد الرمز",size: 14,color: Colors.white,)),
                    ),
                  ),
            ),SizedBox(
              height: Dimensions.height10,
            ), Center(
              child:  InkWell(onTap: () {
                        
                      },child: Text(' إعادة ارسال الرمز',style: TextStyle(fontSize: 13,color: black.withOpacity(.7),fontFamily: 'Cairo',decoration: TextDecoration.underline)),)
            )
          ],
        ),
      )),
    );
  }
}
