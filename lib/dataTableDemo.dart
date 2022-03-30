import 'package:flutter/material.dart';
import 'package:untitled/listOfProductPage.dart';

class DataTableDemo extends StatelessWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: GridView.builder(
                itemCount: product.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                     ),
                  itemBuilder: (context,index)=>gridataContainer(
                    image: product[index]['image'],
                    name: product[index]['name'],
                    price: product[index]['price'],
                  )),
            ),
            Expanded(
              flex: 1,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'name',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'roll',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  for (int i = 0; i < product.length; i++)
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(product[i]['name']),
                        ),
                        DataCell(
                          Text(product[i]['price']),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

gridataContainer({
  String image: '',
  String name: '',
  String price: '',
}) {
  return Container(
    color: Colors.lightBlueAccent,
    child: Column(children: [Image.asset(image), Text(name), Text(price)]),
  );
}
