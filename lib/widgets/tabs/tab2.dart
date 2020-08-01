import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_centovacast_api/widgets/ToastWidget.dart';
import 'package:flutter_centovacast_api/widgets/SharedPreferencesUtil.dart';
import 'package:flutter_centovacast_api/widgets/localisation/AppLocalizations.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2 createState() => _Tab2();
}

class _Tab2 extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      height: MediaQuery.of(context).size.height * 1.00,
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex: 45,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.greenAccent[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Text(
                      AppLocalizations.of(context).translate('start_autodj'),
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )
                  ],
                ),
                onPressed: () async {
                  print("Pressed: Start AutoDJ");
                  _startAutoDJ();

                  showToast(
                    AppLocalizations.of(context).translate('process_started'),
                    duration: Duration(seconds: 1),
                    position: ToastPosition.top,
                    backgroundColor: Colors.white,
                    radius: 5.0,
                    textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  );
                },
              ),
            ),
            new Expanded(
              flex: 45,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Text(
                      AppLocalizations.of(context).translate('stop_autodj'),
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )
                  ],
                ),
                onPressed: () async {
                  print("Pressed: Stop AutoDJ");
                  _stopAutoDJ();

                  showToast(
                    AppLocalizations.of(context).translate('process_started'),
                    duration: Duration(seconds: 1),
                    position: ToastPosition.top,
                    backgroundColor: Colors.white,
                    radius: 5.0,
                    textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  );
                },
              ),
            ),
          ]),
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
    ));
  }
}

/*
 *
 * Make Get Request
 *
 */

// Start Streamserver
_startAutoDJ() async {
  String url = '' +
      StorageUtil.getString("cc_url") +
      '/api.php?xm=server.switchsource&f=json&a[username]=' +
      StorageUtil.getString("cc_username") +
      '&a[password]=' +
      StorageUtil.getString("cc_password") +
      '&a[state]=up';
  Response response = await get(url);
  Map<String, String> headers = response.headers;

  showToastWidget(
      ToastWidget(
        title: 'AutoDJ',
        description: 'AutoDJ was started',
      ),
      duration: Duration(seconds: 5));
}

// Stop Streamserver
_stopAutoDJ() async {
  String url = '' +
      StorageUtil.getString("cc_url") +
      '/api.php?xm=server.switchsource&f=json&a[username]=' +
      StorageUtil.getString("cc_username") +
      '&a[password]=' +
      StorageUtil.getString("cc_password") +
      '&a[state]=down';
  Response response = await get(url);
  Map<String, String> headers = response.headers;

  showToastWidget(
      ToastWidget(
        title: 'AutoDJ',
        description: 'AutoDJ was stopped',
      ),
      duration: Duration(seconds: 5));
}
