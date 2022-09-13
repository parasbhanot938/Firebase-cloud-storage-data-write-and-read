import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project1/var_file.dart';

class ListController extends GetxController{
  ScrollController scrollController=ScrollController();
  int page=1;
  List<Name> names=[];
  bool? isLoading=false;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    for(int i=0;i<5;i++){
      names.add(Name(""));
    }
    super.onInit();
  }

  pagination(){
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        page++;
      }
    });
  }

}