import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/foodMenuApp.dart';
import 'package:untitled/orderFrom.dart';
import 'package:untitled/thankyou.dart';

import 'detailPage.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage>
    with TickerProviderStateMixin {
  var selected_value = '';
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF311B92),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.purple,
        child: TabBar(
          controller: tabController,
          tabs: const [
            Icon(Icons.label),
            Icon(Icons.folder),
            Icon(Icons.add_to_home_screen),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: Image.asset('assets/foodDelivery.png'),
        title: const Text(
          'FastDelivery!',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: const Text('on'),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text('off'),
                  value: 2,
                ),
              ];
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) => item(
                product[index]['image'],
                product[index]['name'],
                product[index]['price'],
                () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          imagePath: product[index]['image'],
                          productFname: product[index]['name'],
                          productFprice: product[index]['price'],
                        ),
                      ),
                    ),
                product[index]['favorite'] ?? false,
                () => {
                      setState(() {
                        product[index]['favorite'] =
                            !product[index]['favorite'];
                      })
                    }),
          ),
          OrderFormDemo(),
          MenuDemo(),
        ],
      ),
    ));
  }
}

Widget item(
  String image,
  String name,
  String price,
  Function() goTo,
  bool fav,
  Function() favorite,
  //  Function() favorite,
) {
  return Container(
    color: Colors.purple,
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.all(5),
    child: ListTile(
      leading: Image.asset(
        image,
        height: 250,
        width: 100,
      ),
      trailing: Column(
        children: [
          IconButton(
            icon: Icon(fav ? Icons.favorite : Icons.favorite_border_outlined,
                color: fav ? Colors.white : Colors.red),
            onPressed: favorite,
          ),
          IconButton(onPressed: goTo , icon: Icon(Icons.add),
          ),

        ],
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      subtitle: Text(
        price,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}

List<Map> product = [
  {
    'image': 'assets/springroll.jpeg',
    'name': 'Veg Spring roll',
    'price': '\$ 250',
    'favorite': 'false',
  },
  {
    'image': 'assets/paneerroll.jpeg',
    'name': 'Veg paneer roll',
    'price': '\$ 170',
    'favorite': 'false',
  },
  {
    'image': 'assets/chikeni.jpeg',
    'name': 'fired chicken',
    'price': '\$ 150',
    'favorite': 'false',
  },
  {
    'image': 'assets/garlicb.jpeg',
    'name': 'garlic bread',
    'price': '\$ 50',
    'favorite': 'false',
  },
  {
    'image': 'assets/biryani.gif',
    'name': 'chicken biryani',
    'price': '\$ 150',
    'favorite': 'false',
  },
  {
    'image': 'assets/HomeMadepizza.jpeg',
    'name': 'cheese burst pizza',
    'price': '\$ 250',
    'favorite': 'false',
  },
];
