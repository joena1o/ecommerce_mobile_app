import 'package:ecommerce_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchClass{


  FetchSearch(query) async{

    var res = await http.get(Uri.parse(connString+"/fetchSearch/$query"));

    var response = json.decode(res.body);

    return response;


  }



}