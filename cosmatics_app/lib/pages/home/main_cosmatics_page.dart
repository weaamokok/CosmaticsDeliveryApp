import 'package:cosmatics_app/pages/home/Cosmatics_page_body.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:cosmatics_app/utils/dimentions.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class MainCosmaticPage extends StatefulWidget {
  const MainCosmaticPage({Key? key}) : super(key: key);

  @override
  State<MainCosmaticPage> createState() => _MainCosmaticPageState();
}

class _MainCosmaticPageState extends State<MainCosmaticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              BigText(
                                  text: "طرابلس",
                                  color: black.withOpacity(.8)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_down_outlined))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: blueush),
                      child: IconButton(
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        onPressed: ()  {
 
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,          ),
          const Expanded(child: SingleChildScrollView(child: CosmaticsPageBody())),
          //body,
          //Catagories,
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String mainText;
  final String hintText;
  const SectionHeader(
      {super.key, required this.hintText, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Row(
            children: [
              BigText(
                text: mainText,size: 17,
              ),
              SizedBox(
                width: Dimensions.width20,
              ),
              BigText(
                text: hintText,
                color: black.withOpacity(.3),
                size: 14,
              )
            ],
          ),
        ));
  }
}
