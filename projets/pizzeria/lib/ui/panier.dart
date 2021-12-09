import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/pizza.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Mon panier'),
        ),
        body:Column(
          children: [
            Expanded(
              //child: ListView.builder(
              child: ListView(
                  children: [
                  Text('Pizza 1'),
                  Text('Pizza 2'),
                  Text('Pizza 3'),
                ],
              ),
            ),
            Row(
              children: [
                Text('Total'),
                Text('30 €'),
              ],
            ),
            Container(
              child: ElevatedButton(
                child:Text('Valider'),
                  onPressed: () {
                  print('Valider');
                },
              )),
          ],
        ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Row(
      children: [
        Text('Image'),
        Column(
          children: [
            Text(cartItem.pizza.title),
            Text('Prix avec InputSpinboxWidget'),
            Text('Sous-total'),
          ],
        )
      ],
    );
  }
}
