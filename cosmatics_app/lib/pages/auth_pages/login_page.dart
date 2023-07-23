import 'package:cosmatics_app/pages/auth_pages/sign_up.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../controllers/auth_controller.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
     PhoneNumber phoneCon = PhoneNumber();
     TextEditingController passCon = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            width: Dimensions.height150,
                            height: Dimensions.height150,
                            child: SvgPicture.asset(
                                'assets/image/home_page _paint.svg'))),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: BigText(
                          text: 'تسجيل دخول',
                          size: 22,
                          color: black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    SizedBox(
                        width: Dimensions.height50 * 5,
                        height: Dimensions.height45,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: InternationalPhoneNumberInput(
                            onSubmit: () {
                              print(phoneCon);
                            },
                            countries: ['LY'],
                            textAlign: TextAlign.right,
                            inputDecoration: InputDecoration(
                                hintText: ' رقم الهاتف',
                                hintStyle: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: black.withOpacity(.5)),
                                focusColor: blueush,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.height30,
                                    vertical: Dimensions.height10),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blueush),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: black.withOpacity(.7)),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15))),
                            onInputChanged: (value) {
                              print(value);
                              phoneCon=value;
                            },
                          ),
                        )
                        //  TextFormField(controller: emailCon,
                        //     decoration: InputDecoration(
                        //         hintText: 'إسم المستخدم أو البريد الالكتروني....',
                        //         hintStyle: TextStyle(
                        //             fontFamily: 'Cairo',
                        //             fontSize: 13,
                        //             color: black.withOpacity(.5)),
                        //         focusColor: blueush,
                        //         contentPadding: EdgeInsets.symmetric(
                        //             horizontal: Dimensions.height30,
                        //             vertical: Dimensions.height10),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: blueush),
                        //             borderRadius:
                        //                 BorderRadius.circular(Dimensions.radius15)),
                        //         border: OutlineInputBorder(
                        //             borderSide:
                        //                 BorderSide(color: black.withOpacity(.7)),
                        //             borderRadius:
                        //                 BorderRadius.circular(Dimensions.radius15)))),
                        ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    SizedBox(
                      width: Dimensions.height50*5,
                      height: Dimensions.height45,
                      child: TextFormField(controller: passCon,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'كلمة المرور..',
                              hintStyle: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                  color: black.withOpacity(.5)),
                              focusColor: blueush,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.height30,
                                  vertical: Dimensions.height10),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blueush),
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius15)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: black.withOpacity(.7)),
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius15)))),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.loginWithPhoneNumber(phoneCon.phoneNumber!,passCon.text);
                      },
                      child: Container(
                        height: Dimensions.height45,
                        width: Dimensions.height50 * 5,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Color.fromARGB(255, 235, 100, 120)),
                        child: Center(
                            child: BigText(
                          text: "تسجيل دخول",
                          size: 13,
                          color: Colors.white,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.height45),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(' تجربتك الاولى مع كوزمو؟',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Cairo',
                                  fontSize: 13)),
                          SizedBox(
                            width: Dimensions.height10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(()=>SignUpPage());
                            },
                            child: Text('انشاء حساب',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: black,
                                    fontFamily: 'Cairo',
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
