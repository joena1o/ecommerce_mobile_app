import 'dart:convert';
import 'package:ecommerce_app/util/util.dart';
import 'package:http/http.dart' as http;


class CartClass{


  FetchCart(user) async{

    var res = await http.get(Uri.parse(connString+"/fetchcart/${user}") );

    var response = json.decode(res.body);

    return response;

  }

  FetchPending(user) async{

    var res = await http.get(Uri.parse(connString+"/fetchShipped/${user}") );

    var response = json.decode(res.body);

    return response;

  }

  removeFromCart(item) async{

    var req = await http.get(Uri.parse(connString+"/removeFromCart/$item"));


    var response = req.body;

    return response;

  }


  FetchDeliverd(user) async{

    var req = await http.post(Uri.parse(connString+"/removeFromCart"), body: jsonEncode({
      "user":user,
    }), headers: {"content-type":"application/json"});


    var response = req.body;

    return response;

  }


  CheckOut(items, price, volume, user, phone, address, location, status) async{

    var req = await http.post(Uri.parse(connString+"/checkout"), body: jsonEncode({
      "items":items,
      "price":price,
      "volume":volume,
      "user":user,
      "phone":phone,
      "address":address,
      "location":location,
      "status":status
    }), headers: {"content-type":"application/json"});


    var response = req.body;


    return response;

  }

  FetchOrders(user) async{

    var res = await http.get(Uri.parse(connString+"/fetchorder/$user"));

    var response = json.decode(res.body);

    return response;

  }




}