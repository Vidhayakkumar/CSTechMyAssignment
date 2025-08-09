import 'package:flutter/cupertino.dart';
import '../service/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> signUp(String name, String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final results = await AuthService.signUp(
        name: name,
        email: email,
        password: password,
      );

      _isLoading = false;
      notifyListeners();
      return results;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> sendOtp(String email)async{

    try{
      final results = await AuthService.sendOtp(email);
      return results;

    }catch(e){
      _error = e.toString().replaceAll("Exception : ", "");
      notifyListeners();
      return false;
    }

  }

  Future<bool> otpVerification(String email, String otp) async {

    _isLoading =true;
    _error = null;
    notifyListeners();

    try{

      final result = await  AuthService.otpVerification(email, otp);
       _isLoading =false;
       notifyListeners();
       return result;

    }catch(e){
      _isLoading =false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

}
