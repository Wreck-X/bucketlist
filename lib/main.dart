import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'models/session_token.dart';
import 'utils/Routes/route.dart';
import 'package:provider/provider.dart' as provider;
import 'view/token_view.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    provider.ChangeNotifierProvider(
      create: (context) => TokenViewModel(TokenStorage()),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

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
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
