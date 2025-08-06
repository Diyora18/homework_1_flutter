import 'package:flutter/material.dart';

class CategoryModel {
  final int id;
  final String image;
  final String title;

  CategoryModel({required this.id, required this.image, required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
        id: json['id'], image: json['image'], title: json['title']);
  }
}
