import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dw_warehouse/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static String baseURL = '';
  static User? user;

  static ConnectivityResult connectivityResult = ConnectivityResult.none;
  static late StreamSubscription<List<ConnectivityResult>>
  _connectivitySubscription;

  static startListeningToNetwork() async {
    final initial = await Connectivity().checkConnectivity();
    connectivityResult = initial[0];

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      result,
    ) async {
      connectivityResult = result.isNotEmpty
          ? result.first
          : ConnectivityResult.none;

      if (connectivityResult == ConnectivityResult.none) {}
    });
  }

  static stopNetworkChangeListening() {
    print('cancelled listener');
    _connectivitySubscription.cancel();
  }

  static void clearSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Constants.user = null;
  }

  static Future<void> insertLoginData({required User user}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String data = jsonEncode(user.toJson());
    // await sharedPreferences.setString("user", data);
    await getLoginData();
  }

  static Future<User?> getLoginData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? data = sharedPreferences.getString("user");

    // if (data != null) {
    //   Constants.user = User.fromJson(jsonDecode(data));
    //   print("User ID: ${Constants.user!.id}");
    // } else {
    //   Constants.user = null;
    // }
    // if (kIsWeb) {
    //   Constants.retrieveJsonData();
    // }
    return Constants.user;
  }
}
