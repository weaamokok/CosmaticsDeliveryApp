import 'package:flutter/material.dart';

class CosmaticsPageBody extends StatefulWidget {
  const CosmaticsPageBody({Key? key}) : super(key: key);

  @override
  State<CosmaticsPageBody> createState() => _CosmaticsPageBodyState();
}

class _CosmaticsPageBodyState extends State<CosmaticsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => _buildPageItem(index),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Container(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Color(0xff69c5df)),
    );
  }
}
