import 'package:cosmatics_app/data/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
String errorMsssage="";
showError(String error){
  errorMsssage=error;
  update();
}
 Future checkIfExists(String phone) async{
   return await authRepo.checkIfPhoneExists(phone);
  }

  loginWithPhoneNumber(String phoneNum,String pass) {
    authRepo.loginWithPhone(phoneNum,pass);
  }
  
  signWithPhoneNumber(String phoneNum) {
    authRepo.signWithPhone(phoneNum);
  }


  verfiyPhoneOtp(String verificationId, String smsCode) {
    authRepo.verfiyPhoneOtp(verificationId, smsCode);
  }


}
