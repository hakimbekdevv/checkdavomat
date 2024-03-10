import 'package:checkdavomat/ui/first/presentation/first_page.dart';
import 'package:checkdavomat/ui/first/provider/first_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<FirstViewModel>(
          create: (context) => FirstViewModel(),
        ),
      ],
      child: Consumer(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const FirstPage(),
          );
        },
      ),
    );
  }
}

