import 'package:flutter/material.dart';
import './model.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Modal modal;
  Color kPrimaryColor = Color(0xFFF68820);

  Result({Key key, @required this.modal}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("You Submit Your Information Successfuly"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: EdgeInsets.all(32),
            //     child:
            //     Text(
            //       "Welcome",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Let's start it Now!",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 28,
                    //       fontWeight: FontWeight.bold,
                    //       backgroundColor: kPrimaryColor),
                    // ),
                    // Text(
                    //   "It's Just a Simple Info Submit Form ",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              //Animation 2
              transitionBuilder: (widget, animation) =>
                  ScaleTransition(child: widget, scale: animation),

              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(size.height > 770
                        ? 64
                        : size.height > 670
                            ? 32
                            : 16),
                    child: Center(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: size.height *
                              (size.height > 770
                                  ? 0.7
                                  : size.height > 670
                                      ? 0.8
                                      : 0.9),
                          width: 500,
                          color: Colors.white,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Submited Information",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 30,
                                      child: Divider(
                                        color: kPrimaryColor,
                                        thickness: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      "First Name: ",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Text(
                                      modal.firstName,
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Last Name: ",
                                        style: TextStyle(fontSize: 20.0)),
                                    Text(
                                      modal.lastName,
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Email: ",
                                        style: TextStyle(fontSize: 20.0)),
                                    Text(
                                      modal.email,
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text("Message: ",
                                        style: TextStyle(fontSize: 20.0)),
                                    Text(
                                      modal.message,
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    // RaisedButton(
                                    //   color: kPrimaryColor,
                                    //   child: Text(
                                    //     'Back',
                                    //     style: TextStyle(color: Colors.white),
                                    //   ),
                                    //   onPressed: () {
                                    //     Navigator.push(context, );
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Successful"),
  //     ),
  //     body: Container(
  //       margin: EdgeInsets.all(10.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(right: 20.0),
  //             child: Text(
  //               "Thanks For Submit your Message!!! Here is Your Info",
  //               style: TextStyle(fontSize: 40.0),
  //             ),
  //           ),
  //           Text(
  //             modal.firstName,
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           Text(
  //             modal.lastName,
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           Text(
  //             modal.email,
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           Text(
  //             modal.message,
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
