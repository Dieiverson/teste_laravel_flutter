import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Utils{

  static showLoadingProgress(BuildContext context)
  {
    EasyLoading.show(status: 'Carregando...');
  }

  static dismissLoadingProgress(BuildContext context){
    EasyLoading.dismiss();
  }
}