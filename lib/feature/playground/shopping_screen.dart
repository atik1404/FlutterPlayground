import 'package:first_flutter/resources/AppDimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});

  final products = ["A","B","C","D","E"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoping screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(products[position]),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<CartCubit>().addProduct(products[position]);
                            },
                            icon: const Icon(Icons.add)));
                  }),
            ),
            BlocBuilder<CartCubit, List<String>>(
              builder: (_, products){
                return Column(
                  children: [
                    Text("Carts: ${products.join(",")}")
                  ],
                );
              }
            ),

            BlocBuilder<CheckoutCubit, int>(
              builder: (_, price){
                return Padding(
                  padding: AppDimensions.kPadding10,
                  child: Text("$price"),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

final class CartCubit extends Cubit<List<String>>{
  CartCubit() : super([]);

  void addProduct(String product){
    var carts = List<String>.from(state)..add(product);

    emit(carts);
  }
}

final class CheckoutCubit extends Cubit<int>{
  final CartCubit cartCubit;

  CheckoutCubit(this.cartCubit) : super(0){
    cartCubit.stream.listen((products){
      var total = products.length * 20;
      emit(total);
    });
  }
}