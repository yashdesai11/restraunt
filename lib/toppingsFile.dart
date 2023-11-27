import 'package:flutter/material.dart';

import 'menuFile.dart';
import 'orderFinal.dart';

//List Of Toppings

class Toppings extends StatefulWidget {

  final List<Toppingss> toppingss;

  const Toppings({super.key, required this.toppingss});

  @override
  State<Toppings> createState() => _ToppingsState();
}

class _ToppingsState extends State<Toppings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.toppingss.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: ((){
                  setState(() {
                    total = total + widget.toppingss[index].price;
                  });

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Done()));

              }),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
      
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.toppingss[index].name,style: TextStyle(fontSize: 40,color: Colors.black),),
                        Text("\$${widget.toppingss[index].price}",style: TextStyle(fontSize: 20,color: Colors.black),)
                      ],
                    ),
      
                    Icon(Icons.add,size: 20,)
      
                  ],
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

