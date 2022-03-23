import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ToastConfig {
  final Duration? duration;
  ToastConfig({this.duration});
}

class Toast {
  static showCustomErrorNotification(
    String? message, {
    ToastConfig? config,
    Alignment alignment = const Alignment(0, 0.9),
  }) {
    showToastWidget(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 50,
              left: 4,
              right: 4,
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12.0),
            width: double.infinity,
            child: Center(
                child: message != null
                    ? Container(
                        constraints: BoxConstraints(minHeight: 55),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFEF233C))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                '$message',
                                style: TextStyle(color: Color(0xFFEF233C)),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()),
          ),
        ],
      ),
      dismissOtherToast: true,
      duration: config?.duration ?? Duration(seconds: 7),
      position: ToastPosition(align: alignment),
    );
  }
}
