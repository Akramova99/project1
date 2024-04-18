import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:project1/model/registration_response.dart';

import '../model/registration_request.dart';

class AuthService{
 static String BASE = "books.uz";
 static String POST_API ='/api/v1/auth/registration';
 static Map<String, String> header = {
   "Accept-Language": "uz",
   "Content-type":"application/json",
 //  'Authorization': 'Bearer ${Get.find<AuthHolder>().authToken}',
 };
static Future<RegistrationResponse?> registration (AuthModel user) async {
 Uri uri = Uri.https(BASE,POST_API) ;
 var response =await post(uri,headers: header,body: json.encode(user));
 if(response.statusCode==200){
   Logger().i(RegistrationResponse.fromJson(json.decode(response.body)));

   return RegistrationResponse.fromJson(json.decode(response.body));
 }
 return  null;
}

}