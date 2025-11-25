import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/my_response.dart';
import '../utils/constants.dart';
import '../widgets/app_dialog.dart';

class CustomInterceptor extends Interceptor {
  CustomInterceptor({
    required this.tokenRequired,
    required this.context,
    required this.showLoader,
    required this.includeEntity,
  });

  final bool tokenRequired;
  final BuildContext context;
  final bool showLoader;
  final bool includeEntity;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // tokenRequired
    //     ? options.headers['Authorization'] = Constants.user!.token
    //     : null;
    // if (Constants.user != null && Constants.user!.ownerEntityId != null) {
    //   options.headers['x-ownerentityid'] = Constants.user!.ownerEntityId!;
    // }
    // if (Constants.user != null && Constants.user!.id != null) {
    //   options.headers['x-userid'] = Constants.user!.id!;
    // }

    print(options.baseUrl);
    print(options.path);
    print(options.data);
    print(options.queryParameters);
    if (Constants.connectivityResult != ConnectivityResult.none) {
      super.onRequest(options, handler);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    print(
      "err type ${err.response?.statusCode ?? ""} ${err.requestOptions.path}",
    );
    // if (showLoader && context.mounted) {
    //   Navigator.pop(context);
    // }
    String _message = "";
    print("err type ${err.type}");
    switch (err.type) {
      case DioExceptionType.cancel:
        _message = "Request cancelled";
        break;
      case DioExceptionType.connectionError:
        _message = "Please contact admin";
        break;
      case DioExceptionType.connectionTimeout:
        _message = "Please contact admin";
        break;
      case DioExceptionType.receiveTimeout:
        _message = "Please contact admin";
        break;
      case DioExceptionType.sendTimeout:
        _message = "Please contact admin";
        break;
      case DioExceptionType.badResponse:
        try {
          Map<String, dynamic> map =
              jsonDecode(err.response.toString()) as Map<String, dynamic>;
          _message =
              map['message'] ??
              "Please try again!. If problem persists contact admin";
        } catch (e) {
          _message = "Please try again!. If problem persists contact admin";
        }
        break;
      case DioExceptionType.unknown:
        _message = "Please contact admin";
        break;
      case DioExceptionType.badCertificate:
        _message = "Please contact admin";
        break;
    }
    await showErrorDialog(context: context, body: _message);
    // if (err.response!.statusCode != 403) {
    //   showCommonDialog(
    //       context: context,
    //       title: "",
    //       message1: _message,
    //       onPressed: () {
    //         if (err.response!.statusCode == 406) {
    //           Navigator.pop(context);
    //           Constants.clearSharedPref();
    //           Navigator.popAndPushNamed(context, LoginScreen.route);
    //         } else {
    //           Navigator.pop(context);
    //         }
    //       },
    //       subTitle: "");
    // }
    // super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    MyResponse myResponse = MyResponse.fromJson(response.data);
    if (myResponse.error!) {
      if (myResponse.status == 409) {
        super.onResponse(response, handler);
      } else {
        await showErrorDialog(
          context: context,
          body: myResponse.message,
          redirection: true,
          redirect: () {
            Navigator.pop(context);
            super.onResponse(response, handler);
          },
        );
      }
      // if (context.mounted) {
      //   Navigator.pop(context);
      // }
    } else {
      print("object success");
      super.onResponse(response, handler);
    }
  }
}
