import 'package:cosmatics_app/domain/models/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<String, List<Product>>> getDiorProducts();
}
