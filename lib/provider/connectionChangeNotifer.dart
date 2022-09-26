
 
  
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
class CheckInternetChangeNotifier extends ChangeNotifier {
  String status = 'waiting...';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
 
  void checkConnectivity() async {
    var connectionResult = await _connectivity.checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile) {
      status = "mobile";
      notifyListeners();
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = "wifi";
      notifyListeners();
    } else {
      status = "no internet";
      notifyListeners();
    }
  }


 checkRealtimeConnection() {
  _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
    switch (event) {
      case ConnectivityResult.mobile:
        {
          status = "mobile";
          notifyListeners();
        }
        break;
      case ConnectivityResult.wifi:
        {
          status = "wifi";
          notifyListeners();
        }
        break;
      default:
        {
          status = 'no internet';
          notifyListeners();
        }
        break;
    }
  });
}

}

final cheackInterentProvider = ChangeNotifierProvider<CheckInternetChangeNotifier>((ref) {
  return CheckInternetChangeNotifier();
});