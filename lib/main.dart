import 'package:flutter/material.dart';
import 'package:flutter_centovacast_api_adfree/widgets/NavDrawer.dart';
import 'package:flutter_centovacast_api_adfree/widgets/SharedPreferencesUtil.dart';
import 'package:flutter_centovacast_api_adfree/widgets/tabs/tab1.dart';
import 'package:flutter_centovacast_api_adfree/widgets/tabs/tab2.dart';
import 'package:flutter_centovacast_api_adfree/widgets/tabs/tab3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

List<String> testDeviceIds = ['8C9A06DEA79BB5365ED3552E5D3F0458'];

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      // Multilingual
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      title: 'Centova Cast: Control (Pro)',

      //theme: new ThemeData(primarySwatch: Colors.grey),
      themeMode: ThemeMode.dark,
      //theme: ThemeData(primarySwatch: Colors.indigo, brightness: Brightness.light),
      darkTheme: ThemeData(primarySwatch: Colors.orange, brightness: Brightness.dark),

      home: new MyHomePage(),
      // home: Scaffold(body: MyHomePage()),
      // Hide debug button, so apple is not crying
      debugShowCheckedModeBanner: false,
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.filter_drama), text: AppLocalizations.of(context)!.nav_server),
              Tab(icon: Icon(Icons.music_note), text: AppLocalizations.of(context)!.nav_autodj),
              Tab(icon: Icon(Icons.settings), text: AppLocalizations.of(context)!.nav_configuration),
            ],
          ),
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
            Tab3(),
          ],
        ),
      ),
    );
  }
}
