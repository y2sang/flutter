import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/constants/app_icons.dart';
import 'package:shop_flutter/provider/dark_theme.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  // bool _value = false;
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: userTitle(title: 'User Information'),
          ),
          Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
          UserListTileWidget(
            icon: AppIcons.email,
            subTitle: 'bozzang@gmail.com',
            title: 'Email',
          ),
          UserListTileWidget(
            icon: AppIcons.phone,
            subTitle: '+82-10-5055-0001',
            title: 'Phone Number',
          ),
          UserListTileWidget(
            icon: AppIcons.local_shipping,
            subTitle: 'Seoul Korea',
            title: 'Shipping Address',
          ),
          UserListTileWidget(
            icon: AppIcons.calendar_today_outlined,
            subTitle: '',
            title: 'Joined Date',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: userTitle(title: 'User Settings'),
          ),
          Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
          ListTileSwitch(
            value: themeChange.darkTheme,
            leading: Icon(Icons.nightlight_round),
            onChanged: (value) {
              setState(() {
                themeChange.darkTheme = value;
              });
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.indigo,
            title: Text('Dark Theme'),
          ),
          UserListTileWidget(
            icon: AppIcons.exit_to_app_rounded,
            subTitle: '',
            title: 'Logout',
          ),
        ],
      ),
    );
  }

  Text userTitle({String? title}) {
    return Text(
      title ?? '',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    );
  }
}

class UserListTileWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData icon;

  const UserListTileWidget({
    Key? key,
    required this.title,
    this.subTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(
            title,
            //style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          subtitle: Text(subTitle ?? ''),
          leading: Icon(icon),
          onTap: () {
            print('ontap');
          },
        ),
      ),
    );
  }
}
//
// class UserListTileWidget extends StatelessWidget {
//   const UserListTileWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     Material userListTile(String title, String subTitle, IconData icon, BuildContext context) {
//       return
//     }
//
//     return Container();
//   }
// }
