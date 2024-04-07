import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/event/weekly_event_timeline.dart';
import 'screens/export/weekly_export_timeline.dart';
import 'screens/new_event/new_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fa_IR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 239, 239, 1.0),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            const Icon(Icons.more_vert),
            GestureDetector(
              onTap: () => print('D'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Text(
                  'D',
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 20,
                    fontFamily: 'Sahel',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
          title: const Text('Weekly Timeline'),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FloatingActionButton.large(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff0a2c5e),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
        body: const NewEvent(),
      ),
    );
  }
}