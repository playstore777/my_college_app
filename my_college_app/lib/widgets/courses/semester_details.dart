// import 'package:flutter/material.dart';

// import '/constants.dart';

// class SemesterDetails extends StatelessWidget {
//   // final dataMap = Constants.bscDetails;

//   final mapKey;

//   SemesterDetails(this.mapKey);

//   Widget tile(padding, subjectName, details) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: padding * 0.02,
//         top: padding * 0.01,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: Text(
//               'English - I',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               '-',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var padding = size.width + size.height;
//     return Center(
//       child: Container(
//         width: size.width * 0.8,
//         height: size.height * 0.6,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Theme.of(context).primaryColor.withOpacity(0.8),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: size.height * 0.05,
//           ),
//           child: Container(
//             color: Colors.black.withOpacity(0.8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: padding * 0.02,
//                     top: padding * 0.01,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Expanded(
//                         child: Text(
//                           'Subject Name',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Details',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][0],
//                   dataMap[mapKey]['details'][0],
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][1],
//                   dataMap[mapKey]['details'][1],
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][2],
//                   dataMap[mapKey]['details'][2],
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][3],
//                   dataMap[mapKey]['details'][3],
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][4],
//                   dataMap[mapKey]['details'][4],
//                 ),
//                 tile(
//                   padding,
//                   dataMap[mapKey]['name'][5],
//                   dataMap[mapKey]['details'][5],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
