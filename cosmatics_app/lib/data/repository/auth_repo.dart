import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  AuthRepo({required this.apiClient});

   checkIfPhoneExists(String phone) async {
    return await apiClient.checkIfPhoneExists(phone);
  }

  Future<Response> login() async {
    return await apiClient
        .getData(AppConstants.GET_PRODUCT_POPULAR_PRODUCT_URL);
  }

  loginWithPhone(String phoneNum,String pass) async {
    await apiClient.LoginWithphoneNumber(phoneNum, pass);
  }
  signWithPhone(String phoneNum) async {
    await apiClient.SignupWithphoneNumber(phoneNum);
  }

  verfiyPhoneOtp(String verificationId, String smsCode) async {
    await apiClient.verfiyOtp(verificationId, smsCode);
  }
}
