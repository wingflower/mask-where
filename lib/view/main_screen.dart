import 'package:flutter/material.dart';
import 'package:mask_where/view/main_view_model.dart';
import 'package:mask_where/view/widget/store_detail_tile.dart';
import 'package:provider/provider.dart';

import '../data/model/store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<MainViewModel>().getStores());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<MainViewModel>();
    final MainViewModel viewModel = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mask Where'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.getStores();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      // List<Widget>
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: viewModel.stores.map((e) {
                return StoreDetailWidget(store: e);
              }).toList(),
            ),
    );
  }
}
