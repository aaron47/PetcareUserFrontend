import 'package:flutter/material.dart';
import 'package:pet_user_app/Theme/nativeTheme.dart';
import 'package:pet_user_app/models/businessLayer/baseRoute.dart';
import 'package:pet_user_app/network/remote/Requests/signup_request.dart';
import 'package:pet_user_app/network/services/ApiService.dart';
import 'package:pet_user_app/screens/logInScreen1.dart';
import 'package:pet_user_app/widgets/bottomNavigationBarWidget.dart';

class SIgnUpScreen extends BaseRoute {
  // SIgnUpScreen() : super();
  SIgnUpScreen({a, o}) : super(a: a, o: o, r: 'SIgnUpScreen');

  @override
  _SIgnUpScreenState createState() => new _SIgnUpScreenState();
}

class _SIgnUpScreenState extends BaseRouteState {
  _SIgnUpScreenState() : super();

  final genders = ["Male", "Female"];
  final roles = ["Sitter", "Owner"];

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _selectedGender;

  String _selectedRole;

  @override
  void initState() {
    _selectedGender = genders.first;
    _selectedRole = roles.first;
    super.initState();
  }

  void _handleSignUp() {
    var signUpRequest = new SignUpRequest(
      fullName: _fullNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
      gender: _selectedGender,
      role: _selectedRole,
    );

    ApiService.signUp(signUpRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF34385A),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
            child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Create Account',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Let's get you started",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomDropDownWidget(this.genders, (value) {
                    this._selectedGender = value;
                  }),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomDropDownWidget(this.roles, (value) {
                    this._selectedRole = value;
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    contentPadding: EdgeInsets.only(top: 5, left: 10),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                // color: Colors.red,
                height: 45,
                padding: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
                    onPressed: () {
                      // print('Hello');
                      _handleSignUp();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => BottomNavigationWidget(
                      //           a: widget.analytics,
                      //           o: widget.observer,
                      //         )));
                    },
                    child: Text(
                      "Sign Up",
                    ))),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: Theme.of(context).primaryTextTheme.headline4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInScreen1(
                                  a: widget.analytics,
                                  o: widget.observer,
                                )));
                      },
                      child: Text(
                        ' Log In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: Color(0xFFF0900C),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 10),
                  child: Text(
                    'Skip for now',
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isloading = true;
}

class CustomDropDownWidget extends StatefulWidget {
  final List<String> list;
  final Function(String) onValueChanged;

  CustomDropDownWidget(this.list, this.onValueChanged);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  String firstDropDownValue;

  @override
  initState() {
    firstDropDownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: firstDropDownValue,
      // Use the selected value from state
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: nativeTheme().primaryColor),
      underline: Container(
        height: 2,
        color: nativeTheme().primaryColor,
      ),
      onChanged: (String value) {
        // This is called when the user selects an item.
        setState(() {
          firstDropDownValue = value;
        });
        widget.onValueChanged(value);
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
