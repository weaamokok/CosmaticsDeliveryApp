import 'package:cosmatics_app/data/repository/brands_repository.dart';
import 'package:cosmatics_app/domain/models/product.dart';
import 'package:cosmatics_app/utils/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'products_remote_service.g.dart';

@RestApi()
@injectable
abstract class ProductsRemoteServiceApi {
  factory ProductsRemoteServiceApi(Dio dio) = _ProductsRemoteServiceApi;

  @GET(AppConstants.GET_PRODUCT_dior_PRODUCT_URL)
  Future<List<Product>> getDiorProducts();
}

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsRemoteServiceApi productsRemoteServiceApi;

  ProductsRepositoryImp({required this.productsRemoteServiceApi});

  @override
  Future<Either<String, List<Product>>> getDiorProducts() async {
    try {
      final response = await productsRemoteServiceApi.getDiorProducts();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
