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
              //child: ListView.builder(widget._cart),
              child: ListView.builder(
                itemCount : widget._cart.totalItems(),
                itemBuilder : (context, index) {
                  return _buildItem(widget._cart.getCartItem(index));
                }
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
