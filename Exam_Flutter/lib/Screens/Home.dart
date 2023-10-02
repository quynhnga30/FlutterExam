import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(244, 243, 243, 1),
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        onPressed: () {},
      ),
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hi Guy! ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Where are you going next? ',
                      style: TextStyle(
                          color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search your destination",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.orangeAccent,
                    width: 100.0,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hotel), // Icon máy bay
                        SizedBox(width: 8.0), // Khoảng cách giữa icon và văn bản
                        Text('Khách sạn'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.pinkAccent,
                    width: 100.0,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.airplanemode_active), // Icon khách sạn
                        SizedBox(width: 8.0),
                        Text('Máy bay'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    width: 100.0,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.airplanemode_active),
                        SizedBox(width: 8.0),
                        Icon(Icons.hotel),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Popular Destinations',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              // Use GridView to display a 2x2 grid of promo cards
              SizedBox(
                height: 20, // Adjust the spacing between the text and the grid
              ),
              GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                shrinkWrap: true, // Allow the grid to be scrollable
                physics: NeverScrollableScrollPhysics(), // Disable scrolling of the grid
                mainAxisSpacing: 20.0, // Add spacing between rows
                children: <Widget>[
                  promoCard(
                    'assets/images/hue.jpg',
                    'Hue',
                    4.5,
                    Icons.favorite,
                  ),
                  promoCard(
                    'assets/images/nhatrang.jpg',
                    'Nha Trang',
                    4.0,
                    Icons.favorite,
                  ),
                  promoCard(
                    'assets/images/hanoi.jpg',
                    'Ha Noi',
                    5.0,
                    Icons.favorite,
                  ),
                  promoCard(
                    'assets/images/halong.jpg',
                    'Ha Long ',
                    4.5,
                    Icons.favorite,
                  ),
                ],
              ),
              SizedBox(
                height: 20, // Adjust the spacing between the grid and the container
              ),
            ],
          ),
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      // Define the items for the BottomNavigationBar
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _currentIndex == 0 ? Colors.blue : Colors.black12,
            size: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,
              color: _currentIndex == 1 ? Colors.blue : Colors.black12),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite,
              color: _currentIndex == 2 ? Colors.blue : Colors.black12),
          label: 'Yêu thích',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: _currentIndex == 3 ? Colors.blue : Colors.black12),
          label: 'Personel',
        ),
      ],
      // Set the current index based on the selected tab
      currentIndex: _currentIndex,
      // Define the callback when a tab is tapped
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
  );
}
  Widget promoCard(image, title, rating, tymIcon) {
    return AspectRatio(
      aspectRatio: 2.62 / 4, // Adjust the aspect ratio for the added icon and text
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5), // Add spacing between the rating and tymIcon
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
