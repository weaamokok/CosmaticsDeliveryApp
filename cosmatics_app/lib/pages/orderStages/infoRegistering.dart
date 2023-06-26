import 'package:cosmatics_app/controllers/cart_controller.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:cosmatics_app/widgets/app_icon.dart';
import 'package:cosmatics_app/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';

class CostumerInfoRegistering extends StatelessWidget {
  const CostumerInfoRegistering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.height30, vertical: Dimensions.height45),
          child: SingleChildScrollView(
            child: GetBuilder<CartController>(
              builder: (controller) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text:
                                    'قيمة الفاتورة : ${controller.totalAmount.toStringAsFixed(2)} د.ل',
                                color: Color(0xffE65E50),
                                size: 15,
                                dirction: TextDirection.rtl,
                              ),
                              AppIcon(
                                icon: Icons.arrow_forward,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                size: Dimensions.height45,
                              ),
                            ]),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Divider(),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: 'عناوين التوصيل ',
                              color: black,
                            ),
                            InkWell(
                              child: Row(children: [
                                Icon(
                                  Icons.add,
                                  color: blueush,
                                  size: 15,
                                ),
                                BigText(
                                  text: 'إضافة عنوان ',
                                  color: blueush,
                                  size: 14,
                                ),
                              ]),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ), //address section
                        GetBuilder<CartController>(
                          builder: (controller) {
                            //replace with usercontroller
                            return Container(
                              //use Listview builder to generate addresses from address table
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.height20,
                                  vertical: Dimensions.height20),
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10),
                              decoration: BoxDecoration(
                                  color: blueush.withOpacity(.1),
                                  border: Border.all(color: blueush),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.home_rounded,
                                              size: 30,
                                              color: blueush,
                                            ),
                                            SizedBox(
                                              width: Dimensions.height5,
                                            ),
                                            BigText(
                                              text: 'المنزل',
                                              size: 18,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: Dimensions.height5,
                                        ),
                                        BigText(
                                          text:
                                              'الظهرة بجانب سوق العملة منزل رقم 10',
                                          size: 14,
                                        )
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: blueush,
                                        )),
                                  ]),
                            );
                          },
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: 'أرقام الهاتف',
                              color: black,
                            ),
                            InkWell(
                              child: Row(children: [
                                Icon(
                                  Icons.add,
                                  color: blueush,
                                  size: 15,
                                ),
                                BigText(
                                  text: 'إضافة رقم ',
                                  color: blueush,
                                  size: 14,
                                ),
                              ]),
                            )
                          ],
                        ),
                        
                       GetBuilder<CartController>(builder: (controller) {
                         return ListView.builder(shrinkWrap: true,itemCount: 2,itemBuilder: (context, index) =>  Container(decoration: BoxDecoration(color: blueush.withOpacity(.1),borderRadius: BorderRadius.circular(Dimensions.radius20),border: Border.all(color: blueush)),
                         margin: EdgeInsets.symmetric(vertical: Dimensions.height5), padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.height20,
                              vertical: Dimensions.height20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: blueush.withOpacity(.7),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height5,
                                  ),
                                  BigText(
                                    text: '09253304020',
                                    color: black.withOpacity(.7),
                                    size: 15,
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: blueush,
                                  ),
                                  Container(
                                    width: Dimensions.height20,
                                    height: Dimensions.height20,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: blueush, width: 2),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),);
                       },)
                      ]),
                );
              },
            ),
          )),
  bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
            return Container(
              height: Dimensions.bottomHeight,
              decoration: BoxDecoration(
                  color: blueush.withOpacity(0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30))),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height45,
                  vertical: Dimensions.height30),
              child: InkWell(
                onTap: () {
              controller.addToHistory();
              Get.to(()=>CostumerInfoRegistering());
                },
                child: Container(height: Dimensions.height50,width: Dimensions.height150,
                  padding: EdgeInsets.symmetric(
                    
                      horizontal: Dimensions.height50),
                  decoration: BoxDecoration(
                      border: Border.all(color: black.withOpacity(.4)),
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 10,
                      //       color: black.withOpacity(.1),
                      //       offset: Offset(0, -2))
                      // ],
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                      color: blueush),
                  child: Center(child: BigText(text:'تأكيد الطلب ' ,color: Colors.white,size: 20,))
                ),
              ),
            );
          },
        )  );
  }
}
