import 'package:flutter/material.dart';
import 'components.dart';
import '../utils/myOwnTheme.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedItem = 0;

  static List<Widget> pages = [
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.indigo,
    ),
    Container(
      color: Colors.redAccent,
    ),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _onItemSelected,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Card-1',
            icon: Icon(Icons.card_giftcard),
          ),
          BottomNavigationBarItem(
            label: 'Card-2',
            icon: Icon(Icons.card_giftcard),
          ),
          BottomNavigationBarItem(
            label: 'Card-3',
            icon: Icon(Icons.card_giftcard),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Recipe',
          style: MyOwnTheme.darkTextTheme.headline4,
        ),
      ),
      body: PageView(
        children: const [
          // Card1(),
          // Card2(),
          // Card3(),
        ],
      ),
    );
  }
}
