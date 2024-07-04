import 'package:commushare_front/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  LoginState();

  String email = "";
  String password = "";
  String name = "";
  bool login = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: login == true ? loginWidget(context) : register(context),
    ));
  }

  Widget loginWidget(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 20,
              ),
              ElevatedButton(
                  key: const Key("Sign up"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        ((states) => Colors.white)),
                    elevation: WidgetStateProperty.resolveWith((states) => 0),
                  ),
                  onPressed: () {
                    setState(() {
                      login = false;
                    });
                  },
                  child: const Row(
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  )),
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
                          "Sign in to CommuShare",
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
                    key: const Key("Mail Address Text Field"),
                    style: const TextStyle(
                        fontFamily: "poppins",
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Mail Address*',
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
                      password = value;
                    }),
                    decoration: const InputDecoration(
                      hintText: 'Password*',
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
                    onPressed: () {
                      if (name != "" && email != "" && email.contains("@")) {
                        //Navigator.pop(context);
                        Fluttertoast.showToast(
                          //msg: "Succesfully Logged In");
                          msg: "Coming soon!");
                      } else {
                        Alert(
                            context: context,
                            title: "Error",
                            desc:
                                "Please enter a valid email address and password",
                            buttons: [
                              DialogButton(
                                  color: const Color.fromARGB(255, 18, 32, 47),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))
                            ]).show();
                      }
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign in",
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
                                Icons.connect_without_contact,
                                color: mainColor,
                                size: 30,
                              )
                            ]))),
              ])),
          Expanded(child: Container()),
        ]);
  }

  Widget register(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        ((states) => Colors.white)),
                    elevation: WidgetStateProperty.resolveWith((states) => 0),
                  ),
                  onPressed: () {
                    setState(() {
                      login = true;
                    });
                  },
                  child: const Row(
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  )),
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
                          "Welcome $name!",
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
                    key: const Key("Name Text Field"),
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
                      hintText: 'Name*',
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
                      email = value;
                    }),
                    decoration: const InputDecoration(
                      hintText: 'Mail address*',
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
                      password = value;
                    }),
                    decoration: const InputDecoration(
                      hintText: 'Password*',
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
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                            ((states) => Colors.white))),
                    onPressed: () {
                      if (name != "" &&
                          email != "" &&
                          password != "" &&
                          email.contains("@")) {
                        Fluttertoast.showToast(
                            //msg: "Account succesfully created");
                            msg: "Coming soon!");
                      } else {
                        Alert(
                            context: context,
                            title: "Error",
                            desc:
                                "Please enter a valid email address, name and password",
                            buttons: [
                              DialogButton(
                                  color: const Color.fromARGB(255, 18, 32, 47),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))
                            ]).show();
                      }
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                  child: Text(
                                "Create an account",
                                style: MediaQuery.of(context).size.width > 1200
                                    ? const TextStyle(
                                        color: mainColor, fontSize: 45)
                                    : MediaQuery.of(context).size.width > 800
                                        ? const TextStyle(
                                            color: mainColor, fontSize: 30)
                                        : const TextStyle(
                                            color: mainColor, fontSize: 20),
                              )),
                              Container(
                                width: 10,
                              ),
                              const Icon(
                                Icons.create,
                                color: mainColor,
                                size: 30,
                              )
                            ]))),
              ])),
          Expanded(child: Container()),
        ]);
  }
}
