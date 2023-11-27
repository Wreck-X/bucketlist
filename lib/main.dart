import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'models/session_token.dart';
import 'utils/Routes/route.dart';
import 'package:provider/provider.dart';
import 'view/token_view.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => TokenViewModel(TokenStorage()),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bucket List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteNames.signup,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
