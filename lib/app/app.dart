import 'package:material_ui/material_ui.dart';
import '../view_models/counter_view_model.dart';
import '../views/home_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final CounterViewModel _counterViewModel;

  @override
  void initState() {
    super.initState();
    _counterViewModel = CounterViewModel();
  }

  @override
  void dispose() {
    _counterViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Okhati MVVM Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(
        title: 'Flutter Demo Home Page',
        viewModel: _counterViewModel,
      ),
    );
  }
}
