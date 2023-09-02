// import 'package:flutter/material.dart';

// import 'const.dart';
// import 'game_manger.dart';

// class TheMainPage extends StatefulWidget {
//   const TheMainPage({super.key});

//   @override
//   State<TheMainPage> createState() => TheMainPageState();
// }

// class TheMainPageState extends State<TheMainPage> {
//   @override
//   void initState() {
//     GameManger.startGame();
//     super.initState();
//   }

//   void addValues() async {
//     await GameManger.addValue();
//     update();
//   }

//   void update() {
//     setState(() {
//       // values;
//     });
//   }

//   void up() {
//     GameManger.isChanged(Move.up);
//     update();
//   }

//   void left() {
//     GameManger.isChanged(Move.left);
//     update();
//   }

//   void right() {
//     GameManger.isChanged(Move.right);
//     update();
//   }

//   void down() {
//     GameManger.isChanged(Move.down);
//     update();
//   }

// //flutter run
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: GestureDetector(
//                 onVerticalDragEnd: (dragDetail) {
//                   if (dragDetail.velocity.pixelsPerSecond.dy < -2) {
//                     up();
//                   } else if (dragDetail.velocity.pixelsPerSecond.dy > 2) {
//                     down();
//                   }
//                 },
//                 onHorizontalDragEnd: (dragDetail) {
//                   if (dragDetail.velocity.pixelsPerSecond.dx < -2) {
//                     right();
//                   } else if (dragDetail.velocity.pixelsPerSecond.dx > 2) {
//                     left();
//                   }
//                 },
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       const InformationUi(),
//                       const SizedBox(height: 16),
//                       Container(
//                           decoration: const BoxDecoration(color: constOutlineColor, borderRadius: BorderRadius.all(Radius.circular(12))),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.width,
//                           // child: MyGrid(values: values))
//                           child: MyGrid(values: ))
//                     ])))));
//   }
// }

// class InformationUi extends StatefulWidget {
//   const InformationUi({
//     super.key,
//   });

//   @override
//   State<InformationUi> createState() => _InformationUiState();
// }

// class _InformationUiState extends State<InformationUi> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //المعلومات
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Container(
//               decoration: const BoxDecoration(color: Color(0xffD9D9D9), borderRadius: BorderRadius.all(Radius.circular(8))),
//               padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//               child: Text("2048", style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold))),
//           Row(children: [
//             Column(
//               children: [
//                 Container(
//                     decoration: const BoxDecoration(color: Color(0xffD9D9D9), borderRadius: BorderRadius.all(Radius.circular(8))),
//                     padding: const EdgeInsets.all(8),
//                     child: SizedBox(
//                         width: 64,
//                         child: Column(
//                           children: [
//                             const FittedBox(fit: BoxFit.contain, child: Text("أعلى قيمة", style: TextStyle(color: Colors.black))),
//                             const SizedBox(height: 16),
//                             Text("2048", style: Theme.of(context).textTheme.titleLarge)
//                           ],
//                         ))),
//               ],
//             ),
//             const SizedBox(width: 16),
//             Column(children: [
//               Container(
//                   decoration: const BoxDecoration(color: Color(0xffD9D9D9), borderRadius: BorderRadius.all(Radius.circular(8))),
//                   padding: const EdgeInsets.all(8),
//                   child: SizedBox(
//                       width: 64,
//                       child: Column(children: [
//                         const FittedBox(fit: BoxFit.contain, child: Text("القيمة الحالية", style: TextStyle(color: Colors.black))),
//                         const SizedBox(height: 16),
//                         Text("2048", style: Theme.of(context).textTheme.titleLarge)
//                       ])))
//             ])
//           ])
//         ]),
//         const SizedBox(height: 16),
//         // الأيقونات
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(width: 90),
//             Row(children: [
//               SizedBox(
//                 width: 90,
//                 child: IconButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () {
//                       print('object');
//                       setState(() {
//                         GameManger.startGame();
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.replay,
//                       color: Colors.black,
//                       size: 64,
//                     )),
//               ),
//               SizedBox(
//                 width: 90,
//                 child: IconButton(
//                     padding: EdgeInsets.zero, //عشان تكون في النص
//                     onPressed: () {
//                       setState(() {
//                         GameManger.reDo();
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.undo,
//                       color: Colors.black,
//                       size: 64,
//                     )),
//               )
//             ]),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class MyGrid extends StatelessWidget {
//   final List<List<int>> values;

//   const MyGrid({super.key, required this.values});
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GridView.builder(
//             itemCount: values.length * values.length,
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.all(10.0),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1, crossAxisSpacing: 8, mainAxisSpacing: 8),
//             itemBuilder: (BuildContext context, int index) {
//               int row, column = 0;
//               row = (index / values.length).floor();
//               column = (index % values.length);
//               return MyWidget(value: values[row][column]);
//             }),
//         if (isGameEnd) const GameOverUi()
//       ],
//     );
//   }
// }

// class GameOverUi extends StatefulWidget {
//   const GameOverUi({super.key});

//   @override
//   State<GameOverUi> createState() => _GameOverUiState();
// }

// class _GameOverUiState extends State<GameOverUi> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("لقد خسرت"),
//       content: const Text("نتيجتك "), //TODO:Add Score
//       actions: [
//         TextButton(
//             onPressed: () {
//               setState(() {
//                 GameManger.startGame();
//               });
//             },
//             child: const Text("إعادة اللعبة"))
//       ],
//     );
//   }
// }
