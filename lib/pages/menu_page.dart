import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenge_week_four/pages/detail_page.dart';
import 'package:ui_challenge_week_four/widgets/pinterest_menu.dart';


class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Grid(),
            _MenuLocation()
          ],
        )
   ),
    );
  }

}


class _MenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final widthPantalla = MediaQuery.of(context).size.width;

    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          alignment: Alignment.center,
          child: GridMenu(
            mostrar: mostrar,
            backgroudColor: Colors.black87,
            activeColor: Colors.red,
            items: [
              MenuButton(onPressed: () {}, icon: Icons.pie_chart),
              MenuButton(onPressed: () {}, icon: Icons.search),
              MenuButton(onPressed: () {}, icon: Icons.notifications),
              MenuButton(onPressed: () {}, icon: Icons.supervised_user_circle),
            ] 
          ),
        ),
      ),
    );

  }

}


class Grid extends StatefulWidget {

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {

  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    
    controller.addListener(() {

      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;        
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true; 
      }

      scrollAnterior = controller.offset;

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _Item(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );

  }
}

class _Item extends StatelessWidget {

  final int index;

  _Item(this.index);

  @override
  Widget build(BuildContext context) {

    final image = 'https://picsum.photos/500/375/?image=$index';

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(image))),
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Hero(
            tag: image,
            child: FadeInImage(
              placeholder: AssetImage('assets/jar_loading.gif'), 
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

  }

}


class _MenuModel with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }

}