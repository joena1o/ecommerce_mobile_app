import 'package:ecommerce_app/util/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavClass{

  FetchFav()async {

    var res = await http.get(Uri.parse(connString+"/fetchFav"));

    var response = json.decode(res.body);

    return response;

  }





}