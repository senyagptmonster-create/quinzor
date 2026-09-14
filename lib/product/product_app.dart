import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart';
import 'quinzor_store.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuinzorStore()..loadData(),
      child: MaterialApp(
        title: 'Quinzor',
        theme: ThemeData(useMaterial3: true),
        home: const QuinzorMainScreen(),
      ),
    );
  }
}
