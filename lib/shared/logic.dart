import 'package:flutter/material.dart';

class Logic{
  void save(List list, TextEditingController text){
    list.insert(0,[text.text , false]);
  }

}