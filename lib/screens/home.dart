import 'package:flutter/material.dart';
import 'package:app_jks/modelo/producto_modelo.dart';
import 'package:app_jks/servicio/api_externa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<ProductModel>? _productModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = (await ApiExterna.getProductos())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cosmeticos API Example'),
      ),
      body: _productModel == null || _productModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _productModel!.length,
        itemBuilder: (context, index) {
          return  Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 50,
                    child: Image(image: NetworkImage(_productModel![index].image_link.toString()),fit: BoxFit.fill,),
                  ),
                  Expanded(child: Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(_productModel![index].name.toString(),style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),),
                        Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(_productModel![index].brand.toString()),),
                        Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(_productModel![index].price.toString()),)
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}