import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/canvas_state.dart';
import 'providers/pipeline_state.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUIMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUIOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const PaintingApp());
}

class PaintingApp extends StatelessWidget {
  const PaintingApp({super.key});

  @Override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CanvasState()),
        ChangeNotifierProvider(create: (_) => PipelineState()),
      ],
      child: MaterialApp(
        title: 'pAInting',
        theme: AppTheme.darkTheme,
        debugShowCheckedBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
