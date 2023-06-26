import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BigText(
                    text: 'تسجيل دخول',
                    size: 25,
                    color: black,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                SizedBox(
                  width: Dimensions.height150,
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'إسم المستخدم أو البريد الالكتروني....',
                          hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              color: black.withOpacity(.5)),
                          focusColor: blueush,contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.height30,vertical: Dimensions.height20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueush),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: black.withOpacity(.7)),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)))),
                ),
                SizedBox(height: Dimensions.height20,),   SizedBox(
                  width: Dimensions.height150,
                  child: TextFormField(obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'كلمة المرور..',
                          hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              color: black.withOpacity(.5)),
                          focusColor: blueush,contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.height30,vertical: Dimensions.height20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueush),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: black.withOpacity(.7)),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)))),
                )
              ],
            ),
          )),
    );
  }
}
