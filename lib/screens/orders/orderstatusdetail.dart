import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderStatusDetail extends StatefulWidget {
  final type;
  const OrderStatusDetail({Key? key, @required this.type}) : super(key: key);

  @override
  State<OrderStatusDetail> createState() => _OrderStatusDetailState();
}

class _OrderStatusDetailState extends State<OrderStatusDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.type);
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/slicing/Untitled-46.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
              // _key.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  width: 25,
                  child: Image.asset('assets/slicing/Untitled-3.png')),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Order Status',
                style: TextStyle(color: Colors.black),
              ),
              Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/slicing/Untitled-4.png',
                      fit: BoxFit.cover)),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Quotes_Card(
                MODEL: "CF34-10 DAE",
                location: "Miami, Florida",
                description:
                    "Lorem Ipsum is simply \ndummy text of the printing \nand typesetting industry",
              ),
              SizedBox(
                height: res_height * 0.03,
              ),
              Container(
                width: res_width * 0.9,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 27,
                          child: Image.asset(
                            widget.type == "Progress"
                                ? 'assets/slicing/Untitled-58.png'
                                : widget.type == "Shipped"
                                    ? 'assets/slicing/Untitled-59.png'
                                    : widget.type == "Route"
                                        ? 'assets/slicing/Untitled-60.png'
                                        : widget.type == "Arrived"
                                            ? 'assets/slicing/Untitled-61.png'
                                            : 'assets/slicing/Untitled-3.png',
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order ${widget.type}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: res_height * 0.006,
                          ),
                          Container(
                              width: res_width * 0.725,
                              child: Text(
                                  'Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenea. Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenea. Lorem ipsum dolor sit amet consectetur adipiscing elit estmaecenas aenea.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                    fontSize: 13,
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Quotes_Card extends StatelessWidget {
  var MODEL, location, description;

  Quotes_Card({Key? key, this.MODEL, this.location, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: res_width * 0.925,
          child: Card(
            // margin: EdgeInsets.fromLTRB(18.0, 4.0, 18.0, 18.0),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$MODEL",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: res_height * 0.006,
                      ),
                      Row(
                        children: [
                          Text(
                            "Location: ",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$location",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: res_height * 0.006,
                      ),
                      Text(
                        "$description",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: res_width * 0.05,
                  // ),
                  Container(
                      width: res_width * 0.375,
                      height: res_height * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Image.asset(
                        "assets/slicing/Untitled-6.png",
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: res_height * 0.0075,
        ),
      ],
    );
  }
}
