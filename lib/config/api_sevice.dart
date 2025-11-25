import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/my_response.dart';
import '../utils/Constants.dart';
import 'custom_interceptor.dart';

class ApiService {
  late final Dio dio;
  final BuildContext context;

  ApiService({required this.context}) {
    dio = Dio();
    // dio.interceptors.add(RequestsInspectorInterceptor());
    dio.options.baseUrl = Constants.baseURL;
  }

  Future<dynamic> postApi({
    required String path,
    required bool includeInterceptor,
    required dynamic data,
    bool showLoader = true,
    required bool includeRetailer,
  }) async {
    final BuildContext safeContext =
        context; // Store context before async calls

    dio.interceptors.add(
      CustomInterceptor(
        includeEntity: includeRetailer,
        tokenRequired: includeInterceptor,
        context: safeContext,
        showLoader: showLoader,
      ),
    );

    try {
      Response response = await dio.post(path, data: data);
      MyResponse myResponse = MyResponse.fromJson(response.data);
      if (myResponse.status == 409) {
        return myResponse.message;
      }
      return myResponse.data;
    } catch (e) {
      print("API Error: $e");
      return Future.error("API call failed");
    } finally {
      // if (showLoader) {
      //   if (safeContext.mounted && Navigator.canPop(safeContext)) {
      //     Navigator.pop(safeContext);
      //   }
      // }
    }
  }

  Future<dynamic> getApi({
    required String path,
    required bool includeInterceptor,
    required bool includeRetailer,
    bool showLoader = true,
    options,
    body,
    required Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
  }) async {
    final BuildContext safeContext =
        context; // Store context before async calls
    dio.interceptors.add(
      CustomInterceptor(
        includeEntity: includeRetailer,
        tokenRequired: includeInterceptor,
        context: safeContext,
        showLoader: showLoader,
      ),
    );

    // bool isOnline = await checkNetworkConnectivity();
    try {
      // if (isOnline) {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : null,
        data: body,
      );

      // if (showLoader) {
      //   if (safeContext.mounted) {
      //     // Ensure context is valid
      //     Navigator.pop(safeContext);
      //   }
      // }

      MyResponse myResponse = MyResponse.fromJson(response.data);
      return myResponse.data;
      // }
    } catch (e) {
      print('catch res -');
      print(e);
      return Future.error("API call failed");
    }
  }

  Future<dynamic> deleteApi({
    required String path,
    required bool includeInterceptor,
    required bool includeRetailer,
    showLoader = true,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    dio.interceptors.add(
      CustomInterceptor(
        includeEntity: includeRetailer,
        tokenRequired: includeInterceptor,
        context: context,
        showLoader: showLoader,
      ),
    );

    // bool isOnline = await checkNetworkConnectivity();
    try {
      // if (isOnline) {
      Response response = await dio.delete(
        path,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      // if (showLoader) {
      //   Navigator.pop(context);
      // }
      MyResponse myResponse = MyResponse.fromJson(response.data);
      return myResponse.message;
      // }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> patchApi({
    required String path,
    required bool includeInterceptor,
    required bool includeRetailer,
    showLoader = true,
    required data,
  }) async {
    dio.interceptors.add(
      CustomInterceptor(
        includeEntity: includeRetailer,
        tokenRequired: includeInterceptor,
        context: context,
        showLoader: true,
      ),
    );
    // bool isOnline = await checkNetworkConnectivity();
    // if (isOnline) {
    Response response = await dio.patch(path, data: data);
    if (showLoader) {
      // if (response.data['status'] == 200) {
      //   Navigator.pop(context);
      // } else {
      //   Navigator.pop(context);
      //   Navigator.pop(context);
      // }
    }
    return response.data;
    // }
  }

  Future<dynamic> putApi({
    required String path,
    required bool includeInterceptor,
    required bool includeRetailer,
    showLoader = true,
    required data,
    Map<String, String>? headers,
  }) async {
    dio.interceptors.add(
      CustomInterceptor(
        includeEntity: includeRetailer,
        tokenRequired: includeInterceptor,
        context: context,
        showLoader: true,
      ),
    );
    // bool isOnline = await checkNetworkConnectivity();
    // if (isOnline) {
    Response response = await dio.put(path, data: data);
    // if (showLoader) {
    //   Navigator.pop(context);
    // }
    return response.data;
    // }
  }
}
