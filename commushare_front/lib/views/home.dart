import 'package:commushare_front/service/database.dart';
import 'package:commushare_front/views/item.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constant/color.dart';
import '../model/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService databaseService = DatabaseService();

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
            FutureBuilder(
              future: databaseService.getItems(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    List<Item> items = snapshot.data!;
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget(item: items[index]);
                          },
                        ));
                  }
                }
              },
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
