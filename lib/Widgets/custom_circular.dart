import 'package:assingment/Constant/constant.dart';
import 'package:flutter/material.dart';

class CustomCircular extends StatelessWidget {
  const CustomCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:CircularProgressIndicator(
          valueColor:AlwaysStoppedAnimation<Color>(mainColor) ,
        ) // Image.asset("assets/Video/loading.gif",width: 50,height: 50,),
    );
  }
}
