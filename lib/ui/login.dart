import 'package:flutter/material.dart';
import 'package:st_hack/Authentication/auth.dart';
import 'package:st_hack/Authentication/auth_provider.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          final String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
        } else {
          final String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print('Registered user: $userId');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(children: <Widget>[
        Container(
           width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFf45d27),
                    Color(0xFFf5851f)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90)
                )
),
        ),
        Container(
          padding: EdgeInsets.only(top: 108, left: 16, right: 16, bottom: 4),
          
          
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + buildSubmitButtons(),
            ),
          ),
        ),
      ]),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 45,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
        child: TextFormField(
          key: Key('email'),
          decoration: InputDecoration(
            hintText: 'Email',
            border: InputBorder.none,
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            ),
          ),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
      ),
      new Padding(
        padding: const EdgeInsets.all(15.0),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 45,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
        child: TextFormField(
          key: Key('password'),
          decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            icon: Icon(
              Icons.vpn_key,
              color: Colors.grey,
            ),
          ),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
      ),
      new Padding(
        padding: const EdgeInsets.all(15.0),
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          child: Text('Login',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: validateAndSubmit,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          color: Colors.orange,
        ),
        FlatButton(
          child: Text('Create an account',
              style: TextStyle(fontSize: 22.0, color: Colors.deepPurple)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          onPressed: validateAndSubmit,
          color: Colors.lightGreen,
        ),
        FlatButton(
          child:
              Text('Have an account? Login', style: TextStyle(fontSize: 20.0,color: Colors.white)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
