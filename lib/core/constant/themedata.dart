import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.primarycolor),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: "Cairo",
            color: AppColor.primarycolor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        backgroundColor: AppColor.backgroundColor),
    fontFamily: "PlayfairDisplay",
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            height: 2,
            color: AppColor.gray,
            fontSize: 16),
        bodyText2: TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.gray, fontSize: 14)));

ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            height: 2,
            color: AppColor.gray,
            fontSize: 16),
        bodyText2: TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.gray, fontSize: 14)));
