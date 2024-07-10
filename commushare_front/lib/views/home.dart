import 'package:commushare_front/service/database.dart';
import 'package:commushare_front/views/item.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../model/item.dart';

class Home extends StatefulWidget {
  final DatabaseService databaseService;

  const Home({super.key, required this.databaseService});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseService databaseService;
  String? search;

  @override
  void initState() {
    super.initState();
    databaseService = widget.databaseService;
  }

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

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //         key: const Key("Go to Sign In"),
            //         style: ButtonStyle(
            //           backgroundColor: WidgetStateProperty.resolveWith<Color>(
            //               ((states) => Colors.white)),
            //           elevation: WidgetStateProperty.resolveWith((states) => 0),
            //         ),
            //         onPressed: () {
            //           Navigator.pushReplacementNamed(context, '/login');
            //         },
            //         child: const Row(
            //           children: [
            //             Text(
            //               "Sign in / Register",
            //               style: TextStyle(
            //                 color: mainColor,
            //                 fontSize: 30,
            //               ),
            //             ),
            //           ],
            //         )),
            //     Container(
            //       height: 20,
            //     ),
            //   ],
            // ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextFormField(
                key: const Key("Search"),
                style: const TextStyle(
                    fontFamily: "poppins", fontSize: 14, color: mainColor),
                textAlign: TextAlign.start,
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search items by owner',
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor)),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFABA8B3),
                      fontFamily: 'poppins'),
                ),
              ),
            ),
            Container(
              height: 20,
            ),

            FutureBuilder(
              future: databaseService.getItems(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    List<Item> items = snapshot.data!;
                    if (search != null && search != "") {
                      items = items
                          .where((element) => element.owner
                              .toLowerCase()
                              .contains(search!.toLowerCase()))
                          .toList();
                    }

                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget(
                              item: items[index],
                              databaseService: databaseService,
                            );
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
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          child: ElevatedButton(
              key: const Key("add_Button"),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    ((states) => mainColor)),
                elevation: WidgetStateProperty.resolveWith((states) => 0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/loan_item',
                    arguments: databaseService);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Loan an item",
                        textAlign: TextAlign.center,
                        style: MediaQuery.of(context).size.width > 1200
                            ? const TextStyle(color: Colors.white, fontSize: 30)
                            : MediaQuery.of(context).size.width > 800
                                ? const TextStyle(
                                    color: Colors.white, fontSize: 20)
                                : MediaQuery.of(context).size.width > 600
                                    ? const TextStyle(
                                        color: Colors.white, fontSize: 15)
                                    : const TextStyle(
                                        color: Colors.white, fontSize: 10),
                      )),
                ],
              ))),
    );
  }
}
