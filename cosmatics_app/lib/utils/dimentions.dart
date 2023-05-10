import 'package:get/get.dart';

class Dimensions{
  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;

  static double pageViewContainer=screenHeight/3.84;//standard to make the container in a near 220
  static double pageViewTextContainer=screenHeight/5.9;//standard to make the container in a near 220
  static double pageView=screenHeight/2.64;//standard to make the container in a near 220

  static double height10=screenHeight/84.4;//standard to make the 10 dynmic
  static double height20=screenHeight/42.2;//standard to make the 10 dynmic
  static double height30=screenHeight/28.13;//standard to make the 10 dynmic
  static double height45=screenHeight/18.76;//standard to make the 10 dynmic

//widths
  static double width10=screenWidth/84.4;//standard to make the 10 dynmic
  static double width20=screenWidth/42.2;//standard to make the 10 dynmic
  static double width30=screenWidth/28.13;
  static double width45=screenWidth/18.76;//standard to make the 10 dynmic
//radius
  static double radius15=screenHeight/56.27;
  static double radius20=screenHeight/42.2;
  static double radius30=screenHeight/28.13;
  //icon size 
  static double iconSize24=screenHeight/35.17;

}