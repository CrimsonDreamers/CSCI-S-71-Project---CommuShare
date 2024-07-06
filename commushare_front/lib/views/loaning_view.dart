import 'package:commushare_front/constant/color.dart';
import 'package:commushare_front/model/item.dart';
import 'package:commushare_front/service/database.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateItemView extends StatefulWidget {
  const CreateItemView({super.key});

  @override
  State<CreateItemView> createState() {
    return CreateItemViewState();
  }
}

class CreateItemViewState extends State<CreateItemView> {
  CreateItemViewState();
  DatabaseService databaseService = DatabaseService();

  String name = "";
  String description = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(height: 20,),
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
                          "Which item do you want to make available to the community ?",
                          textAlign: TextAlign.center,
                          style: MediaQuery.of(context).size.width > 1200
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 45)
                              : MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(
                                      color: Colors.white, fontSize: 40)
                                  : const TextStyle(
                                      color: Colors.white, fontSize: 30),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    key: const Key("Item Name Text Field"),
                    style: const TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Item Name*',
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFABA8B3),
                          fontFamily: 'poppins'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    style: const TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                    onChanged: (value) => setState(() {
                      description = value;
                    }),
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFABA8B3),
                          fontFamily: 'poppins'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                ElevatedButton(
                    key: const Key("Confirm Sign in"),
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                            ((states) => Colors.white))),
                    onPressed: () async{
                      if (name != "") {
                        await databaseService.addItem(Item(id: "item_id", name: name, description: description));
                      }
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Confirm",
                                style: MediaQuery.of(context).size.width > 1200
                                    ? const TextStyle(
                                        color: mainColor, fontSize: 45)
                                    : MediaQuery.of(context).size.width > 800
                                        ? const TextStyle(
                                            color: mainColor, fontSize: 40)
                                        : const TextStyle(
                                            color: mainColor, fontSize: 30),
                              ),
                              Container(
                                width: 10,
                              ),
                              const Icon(
                                Icons.add,
                                color: mainColor,
                                size: 30,
                              )
                            ]))),
              ])),
          Expanded(child: Container()),
        ]);
  }

  
}
