import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/presentation/widgets/custom_divider_widget.dart';
import 'package:flutter_maps/presentation/widgets/drawer_header_widget.dart';
import 'package:flutter_maps/presentation/widgets/drawer_list_item.dart';
import 'package:flutter_maps/presentation/widgets/social_media_icons_widget.dart';
import 'package:gap/gap.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .30,
            decoration: BoxDecoration(
              color: Colors.blue[100],
            ),
            padding: const EdgeInsets.all(15),
            child: CustomDrawerHeader(phoneAuthCubit: phoneAuthCubit),
          ),
          const DrawerListItem(
            leadingIcon: Icons.person,
            title: 'My Profile',
            trailingIcon:
                Icon(Icons.navigate_next_outlined, color: Colors.blue),
          ),
          const CustomDivider(),
          const DrawerListItem(
            leadingIcon: Icons.history,
            title: 'Places History',
            trailingIcon:
                Icon(Icons.navigate_next_outlined, color: Colors.blue),
          ),
          const CustomDivider(),
          const DrawerListItem(
            leadingIcon: Icons.settings,
            title: 'Settings',
            trailingIcon:
                Icon(Icons.navigate_next_outlined, color: Colors.blue),
          ),
          const CustomDivider(),
          const DrawerListItem(
            leadingIcon: Icons.help,
            title: 'Help',
            trailingIcon:
                Icon(Icons.navigate_next_outlined, color: Colors.blue),
          ),
          const CustomDivider(),
          buildLogoutBlocProvider(context),
          Gap(MediaQuery.of(context).size.height * .28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  bottom: 16,
                ),
                child: Text(
                  'Follow us',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const BuildSocialMediaIcons(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLogoutBlocProvider(context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: DrawerListItem(
          leadingIcon: Icons.logout,
          title: 'Logout',
          onPressed: () async {
            await phoneAuthCubit.userLogOut();
            Navigator.of(context).pushReplacementNamed(AppRouter.loginPage);
          },
          leadingIconColor: Colors.red,
          trailingIcon: const SizedBox(),
        ),
      ),
    );
  }
}
