import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_profile/data/side_menu_data.dart';
import 'package:my_profile/gen/fonts.gen.dart';
import 'package:my_profile/res/color.dart';
import 'package:my_profile/res/styles.dart';
import 'package:my_profile/utils/responsive.dart';

class SideMenuWidget extends StatefulWidget {
  final Function(int) onMenuTap;

  const SideMenuWidget({super.key, required this.onMenuTap});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      color: white,
      height: Responsive.IsDesktop(context) ? 80 : double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Responsive.IsDesktop(context) ? Axis.horizontal : Axis.vertical,
              itemCount: data.menu.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),
          ),
        ],
      ),
    );
  }

Widget buildMenuEntry(SideMenuData data, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    width: Responsive.IsDesktop(context) ? 150 : 100,
    // height: 50,
    child: ElevatedButton(
      style: ButtonStyles.sideMenuButtonStyle,
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onMenuTap(index);
      },
      child: Text(
        data.menu[index].title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  );


    // Container(
    //   decoration:
    //       const BoxDecoration(color: Colors.transparent),
    //   child: InkWell(
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Center(
    //             child: Text(
    //               data.menu[index].title,
    //               style: const TextStyle(
    //                   fontSize: 25,
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.w300,
    //                   fontFamily: FontFamily.pretendard),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
