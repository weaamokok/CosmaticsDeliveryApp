import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:flutter/material.dart';

import '../../domain/models/product.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../improved_product_details.dart';

class BrandsPage extends StatelessWidget {
  final List<Product> listOfProducts;
  const BrandsPage({required this.listOfProducts, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cont = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height20),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height50,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: blueush),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      controller: cont,
                      keyboardType: TextInputType.text,
                      onChanged: (String query) {},
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText:
                            '${listOfProducts.first.brand.toString()} ابحث في منتجات  ',
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: black.withOpacity(.2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: blueush),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listOfProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImprovedProductDetails(
                              product: listOfProducts[index]),
                        )),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            border: Border.all(color: black.withOpacity(.2))),
                        // width: Dimensions.height150,
                        // height: Dimensions.height150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20,
                            vertical: Dimensions.height10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    listOfProducts[index].imageLink.toString(),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/image/error.png');
                                    },
                                    height: Dimensions.height90,
                                  ),
                                ),
                                // SizedBox(
                                //   height: Dimensions.height10,
                                // ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: BigText(
                                          text: listOfProducts[index]
                                              .name
                                              .toString(),
                                          size: 13,
                                          color: black.withOpacity(.8),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10),
                                          child: BigText(
                                            text:
                                                '${listOfProducts[index].price}' +
                                                    'د.ل',
                                            size: 15,
                                            wieght: FontWeight.w600,
                                            color: black.withOpacity(.7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: Dimensions.height10,
                                        vertical: Dimensions.height10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        color: blueush.withOpacity(.7)),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 23,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )))
                          ],
                        )),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
