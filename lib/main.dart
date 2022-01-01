import 'package:flutter/material.dart';
import 'package:flutter_list_pagination/app/app.locator.dart';
import 'package:flutter_list_pagination/ui/views/paginated_list/paginated_list_view.dart';

void main() {
  setupLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter List Pagination Example',
      home: PaginatedListView(),
    );
  }
}
