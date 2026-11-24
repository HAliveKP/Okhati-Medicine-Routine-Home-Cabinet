import 'package:material_ui/material_ui.dart';
import '../view_models/counter_view_model.dart';
import 'widgets/counter_display.dart';

class HomeView extends StatefulWidget {
  final String title;
  final CounterViewModel viewModel;

  const HomeView({
    super.key,
    required this.title,
    required this.viewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: widget.viewModel.resetCounter,
            tooltip: 'Reset Counter',
          ),
        ],
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            return CounterDisplay(count: widget.viewModel.count);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: widget.viewModel.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: widget.viewModel.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
