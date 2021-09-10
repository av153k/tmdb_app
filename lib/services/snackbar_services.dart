import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarServices {
  SnackbarServices._();

  static SnackbarServices _services = SnackbarServices._();
  static SnackbarServices get service => _services;

  static GlobalKey<ScaffoldMessengerState>? _scaffoldKey;
  GlobalKey<ScaffoldMessengerState>? get key => _scaffoldKey;
  set scaffoldMessengerKey(GlobalKey<ScaffoldMessengerState>? key) {
    _scaffoldKey = key;
    log("Scaffold Messenger key debug label ---- ${_scaffoldKey.toString()}");
  }

  showTextSnackbar({String? message}) {
    _scaffoldKey?.currentState?.showSnackBar(
      SnackBar(
        elevation: 1000,
        backgroundColor: Colors.transparent,
        // duration: Duration(seconds: 1),
        // margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(100),
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
