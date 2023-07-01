import 'package:cosmatics_app/data/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
    final AuthRepo authRepo;
  AuthController({required this.authRepo});
  loginWithPhoneNumber(String phoneNum){
    authRepo.loginWithPhone(phoneNum);
  }  verfiyPhoneOtp(String verificationId,String smsCode  ){
    authRepo.verfiyPhoneOtp(verificationId,smsCode);
  }

}