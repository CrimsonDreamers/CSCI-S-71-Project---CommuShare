import 'package:commushare_front/constant/color.dart';
import 'package:commushare_front/model/availability.dart';
import 'package:commushare_front/model/item.dart';
import 'package:commushare_front/service/database.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewItemView extends StatefulWidget {
  final Item item;
  final DatabaseService databaseService;

  const ViewItemView({super.key, required this.item, required this.databaseService});

  @override
  State<ViewItemView> createState() {
    return ViewItemViewState();
  }
}

class ViewItemViewState extends State<ViewItemView> {
  late Item item;
  late DatabaseService databaseService;

  @override
  void initState() {
    super.initState();
    item = widget.item;
    databaseService = widget.databaseService;
  }

  @override
  Widget build(BuildContext context) {
    var shownDescription = "No description";
    if (item.description != null && item.description != "") {
      shownDescription = item.description ?? "";
      shownDescription = "Description: $shownDescription";
    }
    return Container(key: const Key("ViewItemView"),child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              ElevatedButton(
                  key: const Key("back Home"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        ((states) => Colors.white)),
                    elevation: WidgetStateProperty.resolveWith((states) => 0),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: mainColor,
                        size: 30,
                      ),
                    ],
                  )),
              Container(
                width: 20,
              ),
            ],
          ),
          Expanded(child: Container()),
          Card(
              color: mainColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              child: Column(children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Name: ${item.name}",
                          textAlign: TextAlign.center,
                          style: MediaQuery.of(context).size.width > 1200
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 45)
                              : MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 35)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 25),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          shownDescription,
                          textAlign: TextAlign.center,
                          style: MediaQuery.of(context).size.width > 1200
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 40)
                              : MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 30)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 20),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Owner: ${item.owner}",
                          textAlign: TextAlign.center,
                          style: MediaQuery.of(context).size.width > 1200
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 40)
                              : MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 30)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 20),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Location: ${item.location}",
                          textAlign: TextAlign.center,
                          style: MediaQuery.of(context).size.width > 1200
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 40)
                              : MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 30)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 20),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                    width: 200,
                    child: item.availability.available == true ? ElevatedButton(
                      key: const Key("Borrow it"),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                                ((states) => Colors.white)),
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
                                    // ignore: use_build_context_synchronously
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
                              color: mainColor,
                              fontSize: 25,
                            ),
                          )),
                    ) : ElevatedButton(
                      key: const Key("Return"),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                                ((states) => Colors.white)),
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
                                    // ignore: use_build_context_synchronously
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
                              color: mainColor,
                              fontSize: 25,
                            ),
                          )),
                    )),
              ])),
          Expanded(child: Container()),
        ]));
  }
}
