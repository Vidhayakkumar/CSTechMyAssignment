import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AuthService {
  static const String singUpUrl ='https://mock-api.calleyacd.com/api/auth/register';
  static const String optUrl = 'https://mock-api.calleyacd.com/api/auth/send-otp';
  static const String otpVerifyUrl ='https://mock-api.calleyacd.com/api/auth/verify-otp';

  static Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(singUpUrl);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({"name": name, "email": email, "password": password}),
      );

      final data = json.decode(response.body);
      final message = data['message'] ?? 'Signup failed';

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception(message);
      }
    } on SocketException {
      // No Internet
      throw Exception("No internet connection.");
    } on FormatException {
      // Invalid JSON
      throw Exception("Bad response format.");
    } catch (e) {
      // Other unexpected errors
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }

  static Future<bool> sendOtp(String email) async {
    try {
      final response = await http.post(
        Uri.parse(optUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({"email": email}),
      );

      final data = json.decode(response.body);
      print("Send OTP Response: ${response.statusCode}, ${response.body}");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(data['message'] ?? 'Failed to otp send');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> otpVerification(String email, String otp)async{
    try{
      final response = await http.post(
        Uri.parse(otpVerifyUrl),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json'
        },
        body: json.encode({"email":email, "otp":otp}),
      );

      final data = json.decode(response.body);

      if(response.statusCode == 200){
        return true;
      }else{
        throw Exception(data['message']?? 'otp verification failed try again');
      }

    }on SocketException{
      throw Exception("No Internet connection");
    }catch(e){
      throw Exception(e.toString());
    }
  }

}
