import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';

import '../data/repository/top_sale_repo.dart';

class TopSaleProductController extends GetxController {
  final TopSaleProductRepo topSaleProductRepo;
  TopSaleProductController({required this.topSaleProductRepo});
  List<dynamic> _topSaleProductList = [];
  List<dynamic> get gettopSaleProductList => _topSaleProductList;

  Future<void> getTopSaleProductList() async {
    Response response = await topSaleProductRepo.gettopSaleProductList();
    print('${response.statusCode} code');

    if (response.statusCode == 200) {
      _topSaleProductList = [];
response.body.forEach((v){_topSaleProductList.add(Product.fromJson(v));});

      update();
    } else {}
  }
}
