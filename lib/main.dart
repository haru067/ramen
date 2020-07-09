import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ramen/global_widgets/custom_bottom_navigation.dart';
import 'package:ramen/main_bloc.dart';
import 'package:ramen/screens/home/widgets/home_screen.dart';
import 'package:ramen/screens/shop_access/widgets/access_screen.dart';
import 'package:ramen/screens/shop_menu/widgets/menu_detail.dart';
import 'package:provider/provider.dart';
import 'package:ramen/screens/shop_menu/widgets/menu_screen.dart';
import 'package:ramen/screens/stamp/widgets/stamp_screen.dart';
import 'l10n/localization_delegate.dart';
import 'l10n/text_resource.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('ja')],
      title: 'test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider<MainBloc>(
          create: (context) => MainBloc(),
          dispose: (context, bloc) => bloc.dispose(),
          child: MyHomePage(title: '麺屋はる')),
      routes: <String, WidgetBuilder>{
        '/shop-menu': (BuildContext context) => MenuDetail(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the screens.home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainBloc = Provider.of<MainBloc>(context);
    return StreamBuilder(
        initialData: 0,
        stream: mainBloc.bottomTabIndex,
        builder: (context, snapshot) {
          Widget body;
          Widget fab = Container();
          if (snapshot.data == 0) {
            body = HomeScreen();
          } else if (snapshot.data == 1) {
            body = MenuScreen();
          } else if (snapshot.data == 2) {
            body = StampScreen();
            fab = FloatingActionButton(child: Icon(Icons.camera_alt));
          } else if (snapshot.data == 3) {
            body = AccessScreen();
          } else {
            throw StateError("Invalid bottom tab index: ${snapshot.data}");
          }
          return _buildScaffold(body, fab, widget.title, mainBloc);
        });
  }

  Widget _buildScaffold(Widget body, Widget fab, String title, MainBloc mainBloc) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
      bottomNavigationBar: CustomBottomNavigation(),
      floatingActionButton: fab,
    );
  }
}
