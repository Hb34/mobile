import 'package:flutter/cupertino.dart';
import 'package:pizzeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  int totalItems() { return _items.length; }
  CartItem getCartItem(int index) {
    return _items[index];
  }

  void addProduct(Pizza pizza) {
    // Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      // Ajout
      _items.add(CartItem(pizza));
    } else {
      // Incrémente la quantité
      CartItem item = _items[index];
      item.quantity++;
    }
    //Emission d'une notification de changement
    notifyListeners();
  }

  void removeProduct(Pizza pizza) {
    // Recherche produit
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      CartItem item =_items[index];
      //décrémente la quantité
      if(--item.quantity == 0) {
        // suppression
        _items.removeAt(index);
      }
      //Emission d'une notification de changement
      notifyListeners();
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  totalQuantity() {

  }
  totalPrice() {
    double allTotalTTC = 0;
    for (CartItem item in _items) {
      allTotalTTC += item.pizza.total * item.quantity;
    }
  }
}
