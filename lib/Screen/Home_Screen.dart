import 'package:api_demo/Model/photo_model.dart';
import 'package:api_demo/Model/product_model.dart';
import 'package:api_demo/utils/home_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isload=false;
  //List<ImageModel>? imagelist;
  ProductsModel? productlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getImageList();
    getProductList();
  }
  // Future<void> getImageList() async {
  //   isload=true;
  //   imagelist = await HomeScreenApi.getData();
  //   imagelist ??=[];
  //   isload=false;
  //   setState(() {});
  // }
  Future<void> getProductList() async {
    isload=true;
    productlist = await HomeScreenApi.addData();
    isload=false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: isload?Center(child: CircularProgressIndicator()):ListView.builder(
      //     itemCount: imagelist!.length,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         height: 200,
      //         width: 200,
      //         child: Image.network(imagelist![index].url!),
      //       );
      //     },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      body:isload?Center(child: CircularProgressIndicator()):
      GridView.builder(
        itemCount: productlist?.products?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  child: Image.network(productlist!.products![index].images!.first.toString()),
                ),
                Text(productlist!.products![index].title.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(productlist!.products![index].price.toString()),
                    Text(productlist!.products![index].rating.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
