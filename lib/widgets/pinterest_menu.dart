import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MenuButton {

  final Function onPressed;
  final IconData icon;

  MenuButton({
    @required this.onPressed, 
    @required this.icon
  });

}


class GridMenu extends StatelessWidget {

  final bool mostrar;
  
  final Color backgroudColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<MenuButton> items;

  GridMenu({
    this.mostrar = true,
    this.backgroudColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
  });

  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: () {print('Icon pie_chart');}),
  //   PinterestButton(icon: Icons.search, onPressed: () {print('Icon search');}),
  //   PinterestButton(icon: Icons.notifications, onPressed: () {print('Icon notifications');}),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {print('Icon supervised_user_circle');}),
  // ];

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {

            Provider.of<_MenuModel>(context).backgroudColor = this.backgroudColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return  _PinterestMenuContainer(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );

  }

}

class _PinterestMenuContainer extends StatelessWidget {

  final Widget child;

  _PinterestMenuContainer({@required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroudColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}


class _MenuItems extends StatelessWidget {

  final List<MenuButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );

  }

}


class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final MenuButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent, // para que detecte mejor el onTap
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );

  }

}


class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;

  Color backgroudColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

}