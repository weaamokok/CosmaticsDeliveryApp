import 'package:cosmatics_app/data/repository/brands_repo.dart';
import 'package:cosmatics_app/data/repository/brands_repository.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:get/get.dart';

class BrandsController extends GetxController {
  final BrandRepo brandsRepo;
  final ProductsRepository productsRepository;
  BrandsController(
      {required this.brandsRepo, required this.productsRepository});
  final List<List<Product>> _brandsList = [];
  final List<Product> _maybillineList = [];
  final List<Product> _diorList = [];
  final List<Product> _nyxList = [];
  final List<Product> _moovList = [];
  final List<Product> _lorealList = [];

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
    // final products = await productsRepository.getDiorProducts();
    // products.fold((l) => print(l), (r) => _brandsList.add(r));
    Response response = await brandsRepo.getdiorProductList();
    if (response.statusCode == 200) {
      response.body.forEach((v) {
        _diorList.add(Product.fromJson(v));
      });

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
    print('---->get brands');
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
