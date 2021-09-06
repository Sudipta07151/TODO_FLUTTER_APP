import 'package:flutter/material.dart';

class AppBarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('CLICKED');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 10),
        child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pyxis.nymag.com/v1/imgs/2f5/fed/f4621d5cd45f59389ab8becfe8b51e5491-02-awkwafina.rhorizontal.w700.jpg')),
      ),
    );
  }
}
