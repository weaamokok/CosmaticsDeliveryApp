import 'package:cosmatics_app/home/Cosmatics_page_body.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/big_text.dart';

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
          Container(//header
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20.0),
                            child: Row(
                              children: [
                                BigText(
                                    text: "طرابلس", color: black.withOpacity(.8)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_drop_down_outlined))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: IconButton(
                          icon: Icon(Icons.search_sharp,color: Colors.white,),
                          onPressed: () {},
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: blueush),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          CosmaticsPageBody()//body
        ],
      ),
    );
  }
}
