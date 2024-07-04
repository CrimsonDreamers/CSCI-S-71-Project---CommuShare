import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constant/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    key: const Key("Go to Sign In"),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          ((states) => Colors.white)),
                      elevation: WidgetStateProperty.resolveWith((states) => 0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Sign in / Register",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: 20,
                ),
              ],
            ),
            Expanded(child: Container()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              child: Card(
                child: Column(
                  children: [
                    const Text(
                      "Pair of scissors",
                      style: TextStyle(fontSize: 30),
                    ),
                    const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "A beautiful pair of right-handed scissors",
                          style: TextStyle(fontSize: 20),
                        )),
                    Expanded(child: Container()),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          key: const Key("Borrow it"),
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                                    ((states) => mainColor)),
                            elevation:
                                WidgetStateProperty.resolveWith((states) => 0),
                          ),
                          onPressed: () {
                            Alert(
                                context: context,
                                title: "Let's grab it !",
                                desc: "Go to Adams House, room 123 to get it",
                                buttons: [
                                  DialogButton(
                                      color:
                                          const Color.fromARGB(255, 18, 32, 47),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Ok",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))
                                ]).show();
                          },
                          child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Borrow it",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )),
                        )),
                    Container(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
