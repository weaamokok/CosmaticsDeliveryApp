import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';

class BrandRepo extends GetxService {
  final ApiClient apiClient;
BrandRepo({required this.apiClient});
  Future<Response> getMaybellineProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_MAYBELLINE_PRODUCT_URL);

  }  Future<Response> getNyxProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_NYX_PRODUCT_URL);

  }Future<Response> getdiorProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_dior_PRODUCT_URL);

  }Future<Response> getLorealProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_loreal_PRODUCT_URL);

  }
  Future<Response> getMoovProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_MOOV_PRODUCT_URL);
  }
}
