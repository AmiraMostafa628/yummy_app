import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/constants.dart';
import 'package:yummy_app/features/components/pop_menu_button.dart';
import 'package:yummy_app/features/screens/views/account_view.dart';
import 'package:yummy_app/features/screens/views/explore_view.dart';
import 'package:yummy_app/features/screens/views/orders_view.dart';


class YummyView extends StatefulWidget {
  const YummyView({
    super.key,
    required this.changedTheme,
    required this.colorSelected,
    required this.changeColor,
  });

  final VoidCallback changedTheme;
  final ColorSelection colorSelected;
  final void Function(int index) changeColor;

  @override
  State<YummyView> createState() => _YummyViewState();
}

class _YummyViewState extends State<YummyView> {
  int _currentTap =0;
  final List<Widget> _pages = [
    ExploreView(),
    OrdersView(),
    AccountView(),

  ];
  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text('Yummy'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.changedTheme,
            icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
          ),
          PopMenuButton(
            colorSelected: widget.colorSelected,
            changeColor: widget.changeColor,),
    
        ],
      ),
      body: IndexedStack(
        index: _currentTap,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTap,
        onDestinationSelected: (index){
          setState(() {
            _currentTap = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            label: 'Orders',
            selectedIcon: Icon(Icons.list),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
            selectedIcon: Icon(Icons.person),
          ),
        ], //
      ),
    
    );
  }
}
