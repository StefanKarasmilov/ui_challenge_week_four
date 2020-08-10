import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {

  final String image;

  DetailPage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _title(),
                _description()
              ]
            ) 
          )
        ],
      )
   );
  }

  Widget _appBar() {

    return SliverAppBar(
      expandedHeight: 300,
      elevation: 2.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.black87,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        background: Hero(
          tag: image,
          child: FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'), 
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

  }

  Widget _title() {

    return Container(
      padding: EdgeInsets.all(30),
      height: 170,
      child: Row(
        children: <Widget>[
          SlideInDown(
            duration: Duration(milliseconds: 1000),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(image) 
              ),
            ),
          ),
          Expanded(child: Container()),
          SlideInRight(
            delay: Duration(milliseconds: 700),
            duration: Duration(milliseconds: 300),
            child: Text(
              'Title',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );

  }

  Widget _description() {

    return Container(
      padding: EdgeInsets.all(30),
      child: FadeIn(
        delay: Duration(milliseconds: 700),
        duration: Duration(milliseconds: 1000),
        child: Text(
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
          'In minim qui laborum ullamco velit sint consectetur aute minim. Est elit aliquip sunt qui fugiat exercitation quis commodo irure reprehenderit qui. Consequat cillum voluptate sunt nisi aliquip ad eiusmod irure tempor elit ipsum. Velit pariatur sit et culpa id ex ut sint cillum. Occaecat dolore dolore do veniam in.'
        ),
      ),
    );

  }

}