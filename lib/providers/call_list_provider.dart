import 'package:flutter/material.dart';

import '../model/list_model.dart';
import '../service/list_service.dart';

class CallListProvider with ChangeNotifier {
  ListModel? _listModel;
  bool _isLoading = false;

  ListModel? get listModel => _listModel;
  bool get isLoading => _isLoading;

  final ListService _apiService = ListService();

  Future<void> getListDetails() async {
     _isLoading =true;
     notifyListeners();
    try {
      _listModel = await _apiService.getListDetails();
      _isLoading =false;
      notifyListeners();
    } catch (e) {
      _isLoading=false;
      notifyListeners();
      throw Exception(e.toString());

    }
  }
}
