import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Coding Challenge'),
      ),
      body: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Puedes usar un TabBar o un Drawer aquí para la navegación entre secciones
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Lista'),
              Tab(text: 'Otra Sección'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewSection(), // Implementa ListView en esta sección
            Placeholder(), // Puedes agregar otro widget para la segunda sección
          ],
        ),
      ),
    );
  }
}

class ListViewSection extends StatelessWidget {
  final List<String> items = [
    'elementos 1',
    'elementos 2',
    'elementos 3',
    'elementos 4'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListItemWidget(elementos: items[index]);
      },
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final String elementos;

  ListItemWidget({required this.elementos});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(elementos),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(elementos: elementos)),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String elementos;

  DetailScreen({required this.elementos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Center(
        child: Text('Detalles de $elementos'),
      ),
    );
  }
}
