import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;
import './model.dart';
import './result.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

Color kPrimaryColor = Color(0xFFF68820);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Form Submit',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _firstNameController,
      _lastNameController,
      _emailController,
      _passwordController,
      _messageController;

  final _formkey = GlobalKey<FormState>();
  Modal modal = Modal();

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _messageController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('UserData');
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formkey,
      child: Container(
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
                                      "Submit Form",
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
                                      height: 10,
                                    ),
                                    SubmitForm(
                                      contoller: _firstNameController,
                                      hintText: 'First Name',
                                      labelText: 'First Name',
                                      suffixIcon:
                                          Icon(Icons.person_add_alt_1_outlined),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter Your First Name';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        modal.firstName = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SubmitForm(
                                      contoller: _lastNameController,
                                      hintText: 'Last Name',
                                      labelText: 'Last Name',
                                      suffixIcon:
                                          Icon(Icons.person_add_alt_1_rounded),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Enter Your Last Name';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        modal.lastName = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SubmitForm(
                                      contoller: _emailController,
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      isEmail: true,
                                      suffixIcon: Icon(Icons.mail_outline),
                                      validator: (String value) {
                                        if (!validator.isEmail(value)) {
                                          return 'Please Enter a valid Email';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        modal.email = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SubmitForm(
                                      contoller: _passwordController,
                                      hintText: 'Password',
                                      labelText: 'Password',
                                      suffixIcon: Icon(Icons.lock_outline),
                                      isPassword: true,
                                      validator: (String value) {
                                        if (value.length < 7) {
                                          return 'Password Should be minimum 7 characters';
                                        } else {
                                          if (value.isEmpty) {
                                            return 'Please Enter Your Password';
                                          }
                                        }
                                        _formkey.currentState.save();
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        modal.password = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SubmitForm(
                                      hintText: 'Password',
                                      labelText: 'Confirm Password',
                                      suffixIcon:
                                          Icon(Icons.lock_outline_sharp),
                                      isPassword: true,
                                      validator: (String value) {
                                        if (value.length < 7) {
                                          return 'Password Should be minimum 7 characters';
                                        } else {
                                          if (modal.password != null &&
                                              value != modal.password) {
                                            return 'Password not match';
                                          } else {
                                            if (value.isEmpty) {
                                              return 'Please Confirm your password';
                                            }
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLines: 3,
                                      controller: _messageController,
                                      decoration: InputDecoration(
                                        hintText: 'Type Your Message Here',
                                        labelText: 'Typye Your Message',
                                        suffixIcon:
                                            Icon(Icons.message_outlined),
                                      ),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please Must be Type Your Message';
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        modal.message = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    RaisedButton(
                                      color: kPrimaryColor,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        saveContact();
                                      },
                                    ),
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

  void saveContact() {
    // String firstName = _firstNameController.text;
    // String lastName = _lastNameController.text;
    // String email = _emailController.text;
    // String password = _passwordController.text;
    // String message = _messageController.text;

    // Map<String, String> userdata = {
    //   'firstName': firstName,
    //   'LastName': lastName,
    //   'Email': email,
    //   'Message': message,
    //   'Password': password
    // };

    // if (_formkey.currentState.validate()) {
    //   _formkey.currentState.save();
    //   _ref.push().set(userdata).then((value) {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => Result(modal: this.modal)));
    //   });
    // }

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Result(modal: this.modal)));
    }
  }
}

class SubmitForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String icons;
  final Function validator;
  final Widget suffixIcon;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController contoller;

  SubmitForm(
      {Key key,
      this.hintText,
      this.labelText,
      this.icons,
      this.validator,
      this.suffixIcon,
      this.contoller,
      this.onSaved,
      this.isEmail = false,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: contoller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
