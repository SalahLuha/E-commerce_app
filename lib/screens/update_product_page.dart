import 'package:flutter/material.dart';
import 'package:story_app/models/product_model.dart';
import 'package:story_app/services/update_product.dart';
import 'package:story_app/widgets/custom_button.dart';
import 'package:story_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Update Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data){
                  productName = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'description',
                onChanged: (data){
                  desc = data;
                },
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Price',
                onChanged: (data){
                  price = data;

                },
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'image',
                onChanged: (data){
                  image = data;
                },

              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Update',
                onTap: (){
                UpdateProductService().updateProduct(
                    title: productName!,
                    price: price!,
                    desc: desc!,
                    image: image!,
                    category: product.category);
                 },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
