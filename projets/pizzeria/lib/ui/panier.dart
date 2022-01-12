import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: Column(
        children: [
          Expanded(
            //child: ListView.builder(widget._cart),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _CartList(),
            ),
          ),
          _CartTotal(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
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

class _CartList extends StatelessWidget {
  var format = NumberFormat("###.00 €");
  @override
  Widget build(BuildContext context){
    var cart = context.watch<Cart>();
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount : cart.totalItems(),
      itemBuilder : (context, index) => _buildListViewItem (cart.getCartItem(index), context),
    );
  }
}
class _CartTotal extends StatelessWidget {
  var format = NumberFormat("###.00 €");
  @override
  Widget build(BuildContext context){
    return Container(
      padding:  EdgeInsets.all(12.0),
      height: 220,
      child: Consumer<Cart>(
          builder:(context, cart, child) {
            final double _total = cart.totalPrice();

            if (_total == 0) {
              return Center(
                child: Text('Aucun produit',
                  style: PizzeriaStyle.priceTotalTextStyle,),
              );
            } else {
              return Column(
                children: [
                  Table()
                ],
              );
            }
          }
      ),
    );
  }
}
_buildListViewItem(CartItem cartItem, BuildContext context) {

}