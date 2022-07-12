import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tej_tech/constants/dimensions.dart';

class ResponseLabel extends StatelessWidget {
  String? error;
  String? message;
  bool? isError;
  bool? isSuccess;
  ResponseLabel(
      {Key? key, this.error, this.message, this.isError, this.isSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isError!=null
        ? Text(error!,style: TextStyle(color: Colors.red,fontSize: Dimensions.getheight(16)),textAlign: TextAlign.center,)
        : isSuccess!=null
            ? Text(message!,style: TextStyle(color:const Color.fromRGBO(46, 139, 87,1),fontWeight:FontWeight.bold,fontSize: Dimensions.getheight(16)),textAlign: TextAlign.center,)
            : Container();
  }
}
