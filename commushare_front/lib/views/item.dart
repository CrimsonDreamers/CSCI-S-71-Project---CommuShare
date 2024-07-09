import 'package:commushare_front/constant/color.dart';
import 'package:commushare_front/model/availability.dart';
import 'package:commushare_front/model/item.dart';
import 'package:commushare_front/service/database.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.item, required this.databaseService});
  final Item item;
  final DatabaseService databaseService;

  @override
  State<ItemWidget> createState() {
    // ignore: no_logic_in_create_state
    return ItemWidgetState(item, databaseService);
  }
}

class ItemWidgetState extends State<ItemWidget> {
  ItemWidgetState(this.item, this.databaseService);
  Item item;
  DatabaseService databaseService;
  

  String email = "";
  String password = "";
  String name = "";
  bool login = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    var shownDescription = "No description";
    if (item.description != null && item.description != "") {
      shownDescription = item.description ?? "";
    }
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 150,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/view_item", arguments: [item, databaseService]),
          child: Card(
            child: Column(
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 30),
                ),
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      shownDescription,
                      style: const TextStyle(fontSize: 15),
                    )),
                Expanded(child: Container()),
                SizedBox(
                    width: 200,
                    child: item.availability.available == true ? ElevatedButton(
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
                            desc: "Go to ${item.location} to get it",
                            buttons: [
                              DialogButton(
                                  key: const Key("Alert_Button"),
                                  color:
                                      const Color.fromARGB(255, 19, 31, 44),
                                  onPressed: () async {
                                    await databaseService.setItemAvailability(item, const Availability(available: false));
                                    Navigator.pushNamed(context, "/");
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )),
                    ) : ElevatedButton(
                      key: const Key("Return"),
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
                            
                            title: "Let's return it!",
                            desc: "Go to ${item.location} to return it",
                            buttons: [
                              DialogButton(
                                  key: const Key("Alert_Button"),
                                  color:
                                      const Color.fromARGB(255, 19, 31, 44),
                                  onPressed: () async {
                                    await databaseService.setItemAvailability(item, const Availability(available: true));
                                    Navigator.pushNamed(context, "/");
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
                            "Return it",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
      )
    );
  }
}
