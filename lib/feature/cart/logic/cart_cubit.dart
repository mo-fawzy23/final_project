import 'package:final_project/core/network/local/data_base/local_db_helper.dart';
import 'package:final_project/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/product_cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  double totalPrice = 0;

  List<ProductCartModel> products = [];

  Future<void> getCartData() async {
    emit(CartLoading());
    try {
      await SQLHelper.get().then((value) {
        products = value.map((e) => ProductCartModel.fromJson(e)).toList();
      });
      calculateTotalPrice();
      emit(CartLoaded());
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> deleteProduct(String id, int index) async {
    emit(CartLoading());
    try {
      await SQLHelper.delete(id);
      products.removeAt(index);
      calculateTotalPrice();

      emit(CartProductDeleted());
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      totalPrice += (products[i].quantity! * products[i].price!.toDouble());
      totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    }

  }
}