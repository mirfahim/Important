import 'package:Appareltech/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController orderNameController = TextEditingController();
  String order;
  String fetch;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Saving data'),
      ),
      body: Column(
        children: [
          CustomTextField(
            controller: orderNameController,
            data: Icons.person,
            hintText: "User Name",
            isObsecure: false,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Read'),
                  onPressed: () {
                    setState(() {
                      _readingItem();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    _savingItem();
                  },
                ),
              ),
              Text(fetch == null ? "0" : fetch),
            ],
          ),
        ],
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = prefs.getString(key) ?? 0;
    order = value;
    print('read: $value');
  }

//   _save() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'my_int_key';
//     final mir = orderNameController.text;
//
//     prefs.setString(key, mir);
//     print('saved $mir');
//   }
// }

  _readingItem() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "anything_for_database_name_field";
    final myValue = prefs.getString(key) ?? 0;
    fetch = myValue;
    print("Fetching new $myValue");
  }

  _savingItem() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "anything_for_database_name_field";
    final myValue = orderNameController.text;
    prefs.setString(key, myValue);
    print("new Save $myValue");
  }
}
