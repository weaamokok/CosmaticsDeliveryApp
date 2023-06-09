import 'package:cosmatics_app/data/repository/brands_repo.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';


class BrandsController extends GetxController {
  final BrandRepo brandsRepo;
  BrandsController({required this.brandsRepo});
  List<List<Product>> _brandsList = [];
  List<List<Product>> _skinTypeList = [];
  List<List<Product>> _normalSkinList = [];
  List<Product> _maybillineList = [];
  List<Product> _diorList = [];
  List<Product> _nyxList = [];
  List<Product> _moovList = [];
  List<Product> _lorealList = [];
  
  List<List<Product>> get getBrandsList => _brandsList;
  List<List<Product>> get getSkinTypeList => _brandsList;

  Future<void> getmaybillineList() async {
    Response response = await brandsRepo.getMaybellineProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _maybillineList.add(Product.fromJson(v));
      });
     // print(_maybillineList);
_brandsList.add(_maybillineList);
      update();
    } else {}
  }

  Future<void> getNyxList() async {
    Response response = await brandsRepo.getNyxProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _nyxList.add(Product.fromJson(v));
      });
    //  print(_nyxList);
_brandsList.add(_nyxList);

      update();
    } else {}
  }

  Future<void> getDiorList() async {
    Response response = await brandsRepo.getdiorProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _diorList.add(Product.fromJson(v));
      });
    //  print(_diorList);
_brandsList.add(_diorList);

      update();
    } else {}
  }

  Future<void> getLorealList() async {
    Response response = await brandsRepo.getLorealProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _lorealList.add(Product.fromJson(v));
      });
    //  print(_lorealList);
_brandsList.add(_lorealList);

      update();
    } else {}
  }

  Future<void> getMoovList() async {
    Response response = await brandsRepo.getMoovProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _moovList.add(Product.fromJson(v));
      });
    //  print('$_moovList لستة موف');
_brandsList.add(_moovList);

      update();
    } else {}
  }

  Future<void> getBrands() async {
 
    getDiorList();
  update();
    getLorealList();
  update();
    getMoovList();
  update();
    getNyxList();
      update();
    getmaybillineList();

        update();
  }
}
