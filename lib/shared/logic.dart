import 'package:flutter/material.dart';

class Logic{
  void save(List list, TextEditingController text){
    list.add([text.text , false]);
  }

  void deleteTile(List list){
     list.removeAt(0);
  }
}