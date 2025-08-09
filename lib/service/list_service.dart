
import 'dart:convert';
import 'dart:io';
import 'package:my_assign/model/list_model.dart';
import 'package:http/http.dart' as http;


class ListService{

  static const String listUrl ='https://mock-api.calleyacd.com/api/list/68626fb697757cb741f449b9';


  Future<ListModel?> getListDetails()async{

    try{

      final response = await http.get(
        Uri.parse(listUrl),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json'
        }
      );

      final jsonData = json.decode(response.body);

      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        return ListModel.fromJson(jsonData);
      }else{
        throw Exception(jsonData['message']?? 'Something went wrong');
      }

    }on SocketException{
      throw Exception('No Internet connection');
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}