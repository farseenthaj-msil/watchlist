import 'dart:convert';

import '../model/usermodel.dart';
import 'package:http/http.dart';

class HomeRepository {
  String contactUrl = 'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts';

  Future<List<UserModel>> fetchAPI() async {
    Response response = await get(Uri.parse(contactUrl));
    //print('fetchAPI()');
    
    if (response.statusCode == 200) {
      //print('success()');
      List result = json.decode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
        //print('error()');
        throw Exception(response.reasonPhrase);
    }
  }
}