// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  int _currentIndex = 0;
  int _transactionIndex = DateTime.parse(DateTime.now().toString()).month - 1;
  int _day = DateTime.parse(DateTime.now().toString()).day;
  var date = DateTime.now().toString();

  final List<String> _month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'My Cards',
        ),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [
                    Colors.lightBlue,
                    Colors.deepPurple,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 55,
                  ),
                  Flexible(
                    child: CarouselSlider(
                      items: [
                        CardSlider("*3425"),
                        CardSlider("Card 2"),
                        CardSlider("Card 3"),
                      ],
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _currentIndex = index;
                            },
                          );
                        },
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        aspectRatio: 2.0,
                        initialPage: 0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == i
                                  ? Colors.white
                                  : Color.fromARGB(115, 224, 224, 224),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Card(
                    color: Colors.transparent,
                    borderOnForeground: true,
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromARGB(64, 255, 255, 255),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Functional("https://picsum.photos/200", "Transfer"),
                        Functional("https://picsum.photos/200", "Blocked"),
                        Functional("https://picsum.photos/200", "Frosts"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.4,
              maxChildSize: 0.94,
              builder: (context, scrollController) {
                return Material(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Container(
                              height: 2, width: 40, color: Colors.white),
                        ),
                      ),
                      //SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: _month[_transactionIndex],
                          isExpanded: true,
                          dropdownColor: Colors.transparent,
                          menuMaxHeight: 150,
                          elevation: 2,
                          underline: Container(),
                          items: _month
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  onTap: () {
                                    _transactionIndex = _month.indexOf(e);
                                  },
                                  value: e,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Transaction ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: e,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 145, 190),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            // ignore: avoid_print
                            print(value);
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          controller: ScrollController(),
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context, int index) =>
                              Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  "$_day ${_month[_transactionIndex]} 2022",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                physics: ClampingScrollPhysics(),
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.only(top: 0),
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        minVerticalPadding: 0,
                                        title: Text(
                                          "Dribble $index",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        subtitle: Text(
                                          "$_day ${_month[_transactionIndex]} 2022",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        leading: Image.asset(
                                          "assets/dribble.png",
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        trailing: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "-\$100,00",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "01.00 PM",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                          color:
                                              Color.fromARGB(50, 253, 253, 253),
                                          thickness: 1),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Functional extends StatelessWidget {
  final String img;
  final String txt;
  const Functional(
    this.img,
    this.txt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(img, height: 50, fit: BoxFit.cover),
              Text(txt)
            ],
          ),
        ),
      ),
    );
  }
}

class CardSlider extends StatelessWidget {
  final String txt;
  const CardSlider(this.txt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 255, 115, 157),
              Color.fromARGB(255, 202, 115, 255),
              Color.fromARGB(255, 155, 136, 255),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned.directional(
                textDirection: TextDirection.ltr,
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 34,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Balance",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(117, 255, 255, 255)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '\$1.924,3',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Image.asset(
                          "assets/circle.png",
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
