import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  AuthRepo({required this.apiClient});
  Future<Response> login( ) async {
    return await apiClient
        .getData(AppConstants.GET_PRODUCT_POPULAR_PRODUCT_URL);
  }   loginWithPhone( String phoneNum) async {
     await apiClient
        .LoginWithphoneNumber(phoneNum);
  } verfiyPhoneOtp( String verificationId,String smsCode ) async {
     await apiClient
        .verfiyOtp(verificationId,smsCode);
  }
}
