import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _clickedIndex = 0;

  final List<String> _demoImages = [
    'assets/r7.jpg',
    'assets/r6.jpg',
    'assets/r3.jpg',
    'assets/r4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffEDEEEA),
      backgroundColor: const Color(0xff191919),
      body: Center(
        child: Container(

          //Use this to set in webview o horizontal position
          // height: 420,

          //Use this to set in mobile o vertical position
          height: double.infinity,
          
          child: ListView.builder(
            itemCount: _demoImages.length,
            shrinkWrap: true,

            //Use this to set in webview o horizontal position
            // scrollDirection: Axis.horizontal,

            //Use this to set in mobile o vertical position
            scrollDirection: Axis.vertical,


            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _clickedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.all(8.0),

                  //Use this to set in webview o horizontal position
                  // width: _clickedIndex == index ? 600.0 : 100.0,

                  //Use this to set in mobile o vertical position
                  height: _clickedIndex == index ? 400.0 : 90.0,

                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: const Offset(3, 4),                            
                        ),
                      ],
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          _demoImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (_clickedIndex == index)
                        Positioned(
                          bottom: 8.0,
                          left: 8.0,
                          child: Container(
                            width: 30,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black38,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      if (_clickedIndex == index)
                        const Positioned(
                          bottom: 20,
                          left: 40,
                          child: Text(
                            'Royal Enfield - Motor Bike',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      if (_clickedIndex == index)
                        const Positioned(
                          bottom: 4,
                          left: 40,
                          child: Text(
                            'Since 1890',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
