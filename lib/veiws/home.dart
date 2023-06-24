import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/painting.dart';
// import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
        child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color:  Color.fromARGB(255, 245, 242, 242),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        // color: const Color.fromARGB(255, 250, 243, 243),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: Card(
                color: const Color.fromARGB(255, 245, 242, 242),
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [
                        const CarouselItem1(),
                        carouselItem2(),
                      ],
                      // setting Carousel options
                      options: CarouselOptions(
                        height: 275,
                        initialPage: 0,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // calls the buildCircles so that the dot sliders appear
                    Align(
                      alignment: Alignment.center,
                      child: Container(child: buildCircles),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Divider(
              color: Color.fromARGB(255, 245, 100, 100),
              thickness: 3,
            ),
            const SizedBox(height: 35),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('emergency-services');
                        },
                        leading: Image.asset(
                          'assets/images/emergency_contact.png',
                          width: 35,
                          height: 35,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.emergency_services,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('donate-to-cc');
                        },
                        leading: Image.asset(
                          'assets/images/CCE.png',
                          width: 50,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.chfe,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('donate-blood');
                        },
                        leading: Image.asset(
                          'assets/images/red_cross.png',
                          width: 30,
                          height: 30,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.donate_blood,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, 'about-first-aid');
                        },
                        leading: Image.asset(
                          'assets/images/med_kit.png',
                          width: 30,
                          height: 30,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.about_first_aid,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }

  // builds the dots of the CarsouleSlider
  Widget get buildCircles => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: const ScaleEffect(
          activeDotColor: Color.fromARGB(255, 241, 81, 81),
          dotColor: Colors.grey,
          dotHeight: 6,
          dotWidth: 6,
        ),
      );

  Widget carouselItem2() => (ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/chfe.jpg',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, bottom: 7, top: 210, right: 5),
                    child: Text(
                      AppLocalizations.of(context)!.chfe_vision,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 99, 98, 98),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )); //end
}

class CarouselItem1 extends StatelessWidget {
  const CarouselItem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(188, 188, 231, 255),
       decoration: const BoxDecoration(
          color: Color.fromARGB(188, 188, 231, 255),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),),
      
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(31), topRight: Radius.circular(31)),
            child: Image.asset(
            'assets/images/blue_health_logo.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
                ),
          ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(188, 188, 231, 255),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
            ),
            // color: Color.fromARGB(188, 188, 231, 255),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 3),
              child: Text(
                AppLocalizations.of(context)!.medica_link_vision_subtitle,
                style: const TextStyle(
                  color: Color.fromARGB(255, 108, 128, 138),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        )]
      ),
    );
  }
}





// 
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/painting.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int activeIndex = 0;
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: const Color.fromARGB(255, 250, 243, 243),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//               child: Card(
//                 color: const Color.fromARGB(255, 253, 229, 229),
//                 elevation: 8,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24)),
//                 child: Column(
//                   children: [
//                     CarouselSlider(
//                       items: [
//                         const CarouselItem1(),
//                         carouselItem2(),
//                       ],
//                       // setting Carousel options
//                       options: CarouselOptions(
//                         height: 275,
//                         initialPage: 0,
//                         autoPlay: false,
//                         viewportFraction: 1,
//                         onPageChanged: (index, reason) =>
//                             setState(() => activeIndex = index),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     // calls the buildCircles so that the dot sliders appear
//                     Align(
//                       alignment: Alignment.center,
//                       child: Container(child: buildCircles),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 25),
//             const Divider(
//               color: Color.fromARGB(255, 218, 178, 178),
//               thickness: 3,
//             ),
//             const SizedBox(height: 35),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 247, 226, 226),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   child: ListView(
//                     children: [
//                       Card(
//                         elevation: 2,
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.of(context).pushNamed('emergency-services');
//                           },
//                           leading: Image.asset(
//                             'assets/images/emergency_contact.png',
//                             width: 35,
//                             height: 35,
//                           ),
//                           title: Text(
//                             AppLocalizations.of(context)!.emergency_services,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Card(
//                         elevation: 1,
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.of(context).pushNamed('donate-to-cc');
//                           },
//                           leading: Image.asset(
//                             'assets/images/CCE.png',
//                             width: 50,
//                           ),
//                           title: Text(
//                             AppLocalizations.of(context)!.chfe,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Card(
//                         elevation: 1,
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.of(context).pushNamed('donate-blood');
//                           },
//                           leading: Image.asset(
//                             'assets/images/red_cross.png',
//                             width: 30,
//                             height: 30,
//                           ),
//                           title: Text(
//                             AppLocalizations.of(context)!.donate_blood,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       Card(
//                         elevation: 1,
//                         child: ListTile(
//                           onTap: () {
//                             Navigator.pushNamed(context, 'about-first-aid');
//                           },
//                           leading: Image.asset(
//                             'assets/images/med_kit.png',
//                             width: 30,
//                             height: 30,
//                           ),
//                           title: Text(
//                             AppLocalizations.of(context)!.about_first_aid,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // builds the dots of the CarsouleSlider
//   Widget get buildCircles => AnimatedSmoothIndicator(
//         activeIndex: activeIndex,
//         count: 2,
//         effect: const ScaleEffect(
//           activeDotColor: Color.fromARGB(255, 241, 81, 81),
//           dotColor: Colors.grey,
//           dotHeight: 6,
//           dotWidth: 6,
//         ),
//       );

//   Widget carouselItem2() => (ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           color: Colors.white,
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(24),
//                 child: Image.asset(
//                   'assets/images/chfe.jpg',
//                   height: MediaQuery.of(context).size.height,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15, bottom: 7, top: 210, right: 5),
//                     child: Text(
//                       AppLocalizations.of(context)!.chfe_vision,
//                       style: const TextStyle(
//                         color: Color.fromARGB(255, 99, 98, 98),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       )); //end
// }

// class CarouselItem1 extends StatelessWidget {
//   const CarouselItem1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return (Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(24),
//           child: Image.asset(
//             'assets/images/blue_health_logo.png',
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 15, bottom: 7),
//               child: Text(
//                 AppLocalizations.of(context)!.medica_link_vision_subtitle,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 108, 128, 138),
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     ));
//   }
// }
