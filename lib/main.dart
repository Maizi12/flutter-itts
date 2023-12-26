import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:SIAKMHS_NIM/login.dart';
import 'package:SIAKMHS_NIM/splash-2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDkKQ50Au8uKK2JFzYpJ7mx5CoWzpnxagI",
        appId: "1:466725686767:android:71cd43493db065c05ffa1a",
        messagingSenderId: "466725686767",
        projectId: "siak-mhs-azzam",
      ),
    );
  } on FirebaseException catch (e) {
    print(e.message.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sistem Akademik Mahasiswa'),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.cyan,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text("<<< Exit")),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: 500,
                      height: 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Institut Teknologi Tangerang Selatan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF005A92),
                                fontSize: 20,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            )
                          ])),
                  const SizedBox(
                      width: 500,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(image: AssetImage('assets/splash1.png'))
                        ],
                      )),
                  const SizedBox(
                    width: 343,
                    height: 200,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Splash()));
                        },
                        child: const Text("Next >>>")),
                  )
                ],
              )
            ])));
    // body:
  }
}
