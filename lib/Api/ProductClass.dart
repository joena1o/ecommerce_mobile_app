import 'package:ecommerce_app/util/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProductClass{



  addToFav(item, user)  async{

    var res = await http.post(Uri.parse(connString+"/addFav"), body: jsonEncode({
      "id": item,
      "user": user
    }), headers: {"Content-Type": "application/json"} );

    var response = res.body;

    return response;

  }
  
  addCart(item, quantity, user) async{

    
    var req = await http.post(Uri.parse(connString+"/addToCart"), body: jsonEncode({
      "id":item.toString(),
      "user":user.toString(),
      "quantity": quantity.toString()
    }), headers: {"Content-Type": "application/json"});


    var response = req.body;

    return response;
    
  }

  postReview(user, review, rating, id) async{


    var res = await http.post(Uri.parse(connString+"/postReview"), body: jsonEncode({
      "id":id,
      "review":review,
      "rating":rating,
      "user":user
    }), headers: {"Content-Type":"application/json"});


    var response = res.body;

    return response;

  }






}