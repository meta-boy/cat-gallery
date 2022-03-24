import 'package:cat_gallery/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Cat Gallery',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo - Cat Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<CatsResponse>> _getData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return List.generate(30, (index) => CatsResponse(
          url: 'https://www.rd.com/wp-content/uploads/2021/04/GettyImages-845712410.jpg',
          title: 'Cute Cat $index',
        ));
  }

  // Future<List<CatsResponse>> _getData() async {
  //   const String url = "https://gist.githubusercontent.com/meta-boy/4a61ac4d344e9c8cd47066d15151bdba/raw/0f58709d6cfcc52f433d21b5a953c8947c0c7ce6/cats.json";
  //   final http.Response response = await http.get(Uri.parse(url));
  //   return catsResponseFromJson(response.body);
  // }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder(builder: ((context, snapshot) {
          return snapshot.hasData ? ListView.builder(
            itemCount: (snapshot.data as List<CatsResponse>).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(((snapshot.data as List<CatsResponse>)[index]).url ?? 'https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200'),
              );
            },
          ) : const CircularProgressIndicator();
        }), future: _getData(),),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
