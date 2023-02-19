import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

enum FilterOptions {
  all,
  favorites,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyfavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My New Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedVal) {
                setState(() {
                  if (selectedVal == FilterOptions.favorites) {
                    _showOnlyfavorites = true;
                  } else {
                    _showOnlyfavorites = false;
                  }
                  debugPrint(selectedVal.toString());
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('All'),
                    ),
                    const PopupMenuItem(
                      value: FilterOptions.favorites,
                      child: Text('Favorites'),
                    ),
                  ])
        ],
      ),
      body: ProductsGrid(_showOnlyfavorites),
    );
  }
}
