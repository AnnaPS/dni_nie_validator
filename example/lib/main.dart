import 'package:flutter/material.dart';
import 'package:dni_nie_validator/dni_nie_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DNI/NIE validator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DNI/NIE validator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  // Create a global key for your scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DNI/NIE Validator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: 'Enter a document number',
                  labelText: 'DNI/NIE number',
                  prefixIcon: const Icon(
                    Icons.article_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _validateDocument(myController.text);
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _validateDocument(String value) {
    String _validation = '';
    if (value.isValidDNI()) {
      _validation = 'DNI Valid';
    } else if (value.isValidNIE()) {
      _validation = 'NIE Valid';
    } else {
      _validation = 'Invalid document';
    }

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$_validation'),
      action: SnackBarAction(
        label: 'Accept',
        onPressed: () {},
      ),
    ));
  }
}
