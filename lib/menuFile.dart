import 'package:flutter/material.dart';
import 'package:restaurantapp/toppingsFile.dart';

int total = 0;

class MenuFile extends StatefulWidget {
  const MenuFile({super.key});

  @override
  State<MenuFile> createState() => _MenuFileState();
}


class _MenuFileState extends State<MenuFile> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    List<Toppingss> toppings1 = [];
    List<Menu> menu = [];
    menu.add(Menu(menIid: 1, name: "Veggie", toppings: toppings1, menuAssets: "assets/veggie.jpg", price: 10));
    toppings1.add(Toppingss(toppingsId: 0, name: "Olives", price: 4));
    toppings1.add(Toppingss(toppingsId: 1, name: "Mushroom", price: 5));


    List<Toppingss> toppings2 = [];
    menu.add(Menu(menIid: 1, name: "Pepperoni", toppings: toppings2, menuAssets: "assets/pepproni.jpg", price: 12));
    toppings2.add(Toppingss(toppingsId: 0, name: "Salami", price: 8));
    toppings2.add(Toppingss(toppingsId: 1, name: "Mushroom", price: 5));

    List<Toppingss> toppings3 = [];
    menu.add(Menu(menIid: 1, name: "Cheese", toppings: toppings3, menuAssets: "assets/cheese.jpg", price: 15));
    toppings3.add(Toppingss(toppingsId: 0, name: "Mozzarella", price: 8));
    toppings3.add(Toppingss(toppingsId: 1, name: "Tomato Sauce", price: 5));

    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: menu.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: ((){

                setState(() {
                  total = total + menu[index].price;
                });


                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Toppings(toppingss: menu[index].toppings,)));

              }),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(height/15), // Image radius
                          child: Image.asset(menu[index].menuAssets, fit: BoxFit.fill),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(menu[index].name,style: TextStyle(fontSize: 40,color: Colors.black),),
                          Text("\$${menu[index].price}",style: TextStyle(fontSize: 20,color: Colors.black),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
      bottomSheet: total > 0 ? Container(child: Text("PRICE \$${total}"),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child: Text("Select Pizza from Menu"),),
      ),
    );
  }
}


class Menu{
  int menIid;
  String name;
  List<Toppingss> toppings;
  String menuAssets;
  int price;

  Menu({required this.menIid,required this.name,required this.toppings,required this.menuAssets,required this.price});
}

class Toppingss{
  int toppingsId;
  String name;
  int price;
  Toppingss({required this.toppingsId,required this.name,required this.price});
}