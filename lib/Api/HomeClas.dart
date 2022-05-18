import 'package:ecommerce_app/util/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeClass{

  String conn = "http://10.0.2.2:3001";

  FetchProducts() async{

    var res = await http.get(Uri.parse(connString+"/fetchItems"), headers: {"Accept":"application/json"});


    var response = json.decode(res.body);


    return response;


  }

  FetchCat(cat) async{

    var res = await http.get(Uri.parse(connString+"/fetchCat/${cat}"), headers: {"Accept":"application/json"});


    var response = json.decode(res.body);


    return response;


  }



}