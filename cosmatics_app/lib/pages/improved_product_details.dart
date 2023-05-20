import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimentions.dart';
import '../widgets/app_column.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';
import '../widgets/exoandable_text.dart';

class ImprovedProductDetails extends StatelessWidget {
  const ImprovedProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(automaticallyImplyLeading: false,
          title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                AppIcon(
                  icon: Icons.shopping_bag,
                  iconColor: Colors.white,
                  onTap: () {
                    
                  },
                )
              ],
            ),
          expandedHeight: 300,
          pinned: true,
          backgroundColor: Colors.white12,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/image/e.png',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: Dimensions.screenHeight,
                padding: EdgeInsets.only(
                    right: Dimensions.width30,
                    left: Dimensions.width30,
                    top: Dimensions.height30),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: black.withOpacity(.1),
                          offset: Offset(0, -2))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius30),
                        topRight: Radius.circular(Dimensions.radius30)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      productName: 'LA ROCHE-POSAY ',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: 'عن المنتج:',
                      size: Dimensions.font17,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text:
                              ' مكياج تضعينه بكل ثقة، لأنه خضع لجميع اختبارات الحساسية كريم أساس أيقوني لتصحيح العيوب يوفر تغطية كاملة لكل أنواع البشرة الحساسة، حتى المعرضة للحساسية المنnjjjjbgjbnhjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjkjjjnmnbk,bljkbhjh,kmbk.bnbmbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnhjjjjjjjjjjjjjjjjjjjjjjjgligyyyyyyyyhgyhiiuhkjhjkhoihiuhuhjkhjknkjnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnvvvvvvvvvbvjbvjhbvاعية ',
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        decoration: BoxDecoration(
            color: blueush,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius30),
                topRight: Radius.circular(Dimensions.radius30))),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width45, vertical: Dimensions.height20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: Dimensions.height5),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: black.withOpacity(.1),
                      offset: Offset(0, -2))
                ],
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            child: Row(children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: black.withOpacity(.8),
                  )),
              SizedBox(
                width: Dimensions.width10,
              ),
              BigText(
                text: '0',
                color: black.withOpacity(.5),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: black.withOpacity(.8),
                  )),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.height10, horizontal: Dimensions.width20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: black.withOpacity(.1),
                      offset: Offset(0, -2))
                ],
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            child: BigText(
              text: ' إضافة للسلة | \$10',
              color: black.withOpacity(.7),
            ),
          )
        ]),
      ),
    );
  }
}
