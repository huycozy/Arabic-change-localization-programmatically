import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isArabic = false;
  Locale _locale = Locale('en');

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale('ar', 'AE'),
      ],
      locale: _locale,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arabic Language Testing'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('InkWell 1 clicked');
                    },
                    child: Container(
                      height: double.infinity,
                      width: 180,
                      color: Colors.grey[400],
                      child: const Center(child: Text('InkWell 1')),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('InkWell 2 clicked');
                    },
                    child: Container(
                      height: double.infinity,
                      width: 180,
                      color: Colors.amber[400],
                      child: const Center(child: Text('InkWell 2')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              child: Text(
                _isArabic == true ? 'Change to English' : 'Change to Arabic',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                setState(() {
                  _isArabic = !_isArabic;
                });
                if (_isArabic) {
                  changeLanguage(Locale('ar'));
                } else {
                  changeLanguage(Locale('en'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
