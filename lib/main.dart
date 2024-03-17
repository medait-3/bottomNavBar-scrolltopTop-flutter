import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollToTopButton(),
    );
  }
}

class ScrollToTopButton extends StatefulWidget {
  @override
  _ScrollToTopButtonState createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;
  int _currentIndex = 0;

  void _onTabTapped(int index) {
  if (index == 0) {
    if (_showScrollToTopButton) {
      _scrollToTop();
    } else {
      setState(() {
        _showScrollToTopButton==true  ; // Show the scroll-to-top button
        _currentIndex = index;
      });
    }
  } else {
    setState(() {
      _showScrollToTopButton = false;
      _currentIndex = index;
    });
  }
}

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _showScrollToTopButton = _scrollController.offset >= 320.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Your pages
          Home(controllers: _scrollController,),
          Message(),
          Profile(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: BottomNavigationBar(
          elevation: 33,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: _showScrollToTopButton
                  ? Icon(Icons.keyboard_double_arrow_up_sharp)
                  : Icon(Icons.home),
              label: _showScrollToTopButton ? 'Back to Top' : 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

}

class Home extends StatelessWidget {
  final ScrollController controllers;

  const Home({Key? key, required this.controllers,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controllers,
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Message Page',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
