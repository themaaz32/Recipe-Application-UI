import 'package:chat_tut/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  ///Image paths and food names
  final images = [
    "assets/burger.jpg",
    "assets/chicken_g.jpg",
    "assets/chiken_f.jpeg",
    "assets/pizza.jpg",
    "assets/spaghetti.jpg",
  ];

  final foodNames = [
    "Grilled Burger",
    "Crispy Fried Chicken",
    "Grilled Chicken",
    "Pasta",
    "Pizza"
  ];

  @override
  Widget build(BuildContext context) {
    ///For screen size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), title: Text("Recipes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), title: Text("Subscription")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ///Container for Header
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Looking for your favorite meal",
                          style: GoogleFonts.playfairDisplay(fontSize: 30),
                        ),
                      ),

                      ///For spacing
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_none),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                ///For vertical Spacing
                SizedBox(
                  height: 32,
                ),

                ///Container For List of Recipes type
                ///Give 25 percent height relative to screen
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                            aspectRatio: 0.9 / 1,

                            ///Width : screen,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),

                                ///Add Text Also,
                                SizedBox(
                                  height: 8,
                                ),

                                ///For spacing

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    "${foodNames[index]} Recipes",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey[800], fontSize: 11),
                                  ),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 4),
                ),

                ///For vertical spacing
                SizedBox(
                  height: 32,
                ),

                ///For quick recipe list
                Container(
                  height: size.height * 0.4,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailScreen(images[4 - index])
                            ));
                          },
                          child: AspectRatio(
                              aspectRatio: 0.9 / 1,

                              ///Width : screen,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Hero(
                                      child: Container(
                                        child: ClipRRect(
                                          child: Image.asset(
                                            images[4 - index],
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      tag: images[4 - index],
                                    ),
                                  ),

                                  ///Add Text Also,
                                  SizedBox(
                                    height: 8,
                                  ),

                                  ///For spacing

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "${foodNames[4 - index]}",
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "Recipe by Sarah Ahmed",
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[600], fontSize: 11),
                                    ),
                                  )
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
