import 'package:cosmatics_app/data/api/api_client.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:get/get.dart';

class TopSaleProductRepo extends GetxService {
  final ApiClient apiClient;
TopSaleProductRepo({required this.apiClient});
  Future<Response> gettopSaleProductList() async {
return await apiClient.getData(AppConstants.GET_PRODUCT_POPULAR_PRODUCT_URL);

  }
}
