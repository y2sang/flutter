import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/constants/app_icons.dart';
import 'package:shop_flutter/constants/colors.dart';
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
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
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
                      value: themeChange.isDarkTheme,
                      leading: Icon(Icons.nightlight_round),
                      onChanged: (bool value) {
                        setState(() {
                          themeChange.toggleDarkTheme(value);
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
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 0.5;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
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
