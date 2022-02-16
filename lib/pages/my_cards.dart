// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  int _currentIndex = 0;
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
      body: Stack(children: [
        Container(
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
              Center(
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        CarouselSlider(
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
                        )
                      ],
                    ),
                    Card(
                      color: Colors.transparent,
                      borderOnForeground: true,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Color.fromARGB(122, 158, 158, 158),
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
            ],
          ),
        ),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Card $index"),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ]),
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
          child: Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    txt,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
