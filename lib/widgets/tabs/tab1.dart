import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_centovacast_api_adfree/widgets/SharedPreferencesUtil.dart';
import 'package:flutter_centovacast_api_adfree/widgets/ToastWidget.dart';
import 'package:http/http.dart';
import 'package:oktoast/oktoast.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1 createState() => _Tab1();
}

class _Tab1 extends State<Tab1> {
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
              child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Text(
                        AppLocalizations.of(context)!.start_server,
                        style: new TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: "Roboto", color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: () async {
                    print("Pressed: Start Server");
                    _startStreamserver();

                    showToast(
                      AppLocalizations.of(context)!.process_started,
                      duration: Duration(seconds: 1),
                      position: ToastPosition.top,
                      backgroundColor: Colors.white,
                      radius: 5.0,
                      textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent[400])),
            ),
            new Expanded(
              flex: 45,
              child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new Text(
                        AppLocalizations.of(context)!.stop_server,
                        style: new TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w400, fontFamily: "Roboto", color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: () async {
                    print("Pressed: Stop Server");
                    _stopStreamserver();

                    showToast(
                      AppLocalizations.of(context)!.process_started,
                      duration: Duration(seconds: 1),
                      position: ToastPosition.top,
                      backgroundColor: Colors.white,
                      radius: 5.0,
                      textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[400])),
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
_startStreamserver() async {
  final url = Uri.parse('' +
      StorageUtil.getString("cc_url") +
      '/api.php?xm=server.start&f=json&a[username]=' +
      StorageUtil.getString("cc_username") +
      '&a[password]=' +
      StorageUtil.getString("cc_password") +
      '&a[noapps]=1');
  Response response = await get(url);
  Map<String, String> headers = response.headers;

  showToastWidget(
      ToastWidget(
        title: 'Stream Server',
        description: 'Stream Server was started',
      ),
      duration: Duration(seconds: 5));
}

// Stop Streamserver
_stopStreamserver() async {
  final url = Uri.parse('' +
      StorageUtil.getString("cc_url") +
      '/api.php?xm=server.stop&f=json&a[username]=' +
      StorageUtil.getString("cc_username") +
      '&a[password]=' +
      StorageUtil.getString("cc_password") +
      '');
  Response response = await get(url);
  Map<String, String> headers = response.headers;

  showToastWidget(
      ToastWidget(
        title: 'Stream Server',
        description: 'Stream Server was stopped',
      ),
      duration: Duration(seconds: 5));
}
