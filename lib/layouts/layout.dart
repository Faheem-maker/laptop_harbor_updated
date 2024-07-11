import 'package:flutter/material.dart';
import 'package:laptop_harbor/Common/Widgets/app_title.dart';
import 'package:laptop_harbor/Screens/Notifications/notifications.dart';
import 'package:laptop_harbor/Screens/Onboarding/onboarding.dart';
import 'package:laptop_harbor/Screens/Settings/settings.dart';
import 'package:laptop_harbor/Common/Widgets/custom_app_bar.dart';
import 'package:laptop_harbor/screens/Cart/cart.dart';
import 'package:laptop_harbor/utils/app_colors.dart';
import 'package:laptop_harbor/utils/font_styles.dart';

class DashboardLayout extends StatelessWidget {
  final Widget screen;
  const DashboardLayout(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>();

    return ScaffoldMessenger(child: Scaffold(

      key: scaffoldKey,
      appBar: _buildCustomAppBar(context, scaffoldKey),
      drawer: _buildDrawer(context),
      body: this.screen,
      resizeToAvoidBottomInset: false,
    ));
  }

  PreferredSize _buildCustomAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return PreferredSize(
      preferredSize:
          Size(double.infinity, MediaQuery.of(context).size.height * .20),
      child: CustomAppBar(
        isHome: true,
        enableSearchField: false,
        leadingIcon: Icons.menu,
        leadingOnTap: () {},
        trailingIcon: Icons.notifications_none_outlined,
        trailingOnTap: () {
          Navigator.of(context).pushNamed(NotificationScreen.routeName);
        },
        scaffoldKey: scaffoldKey,
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .60,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .20,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: AppTitle(
                      fontStyle: FontStyles.montserratExtraBold18(),
                      marginTop: 0.0,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primaryLight],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0, 1],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/products");
                    },
                    leading: const Icon(Icons.home,
                        color: AppColors.primaryLight),
                    title: Text(
                      'Home',
                      style: FontStyles.montserratRegular18(),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    leading: const Icon(Icons.shopping_cart,
                        color: AppColors.primaryLight),
                    title: Text(
                      'Cart',
                      style: FontStyles.montserratRegular18(),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Settings.routeName);
                    },
                    leading: const Icon(Icons.settings,
                        color: AppColors.primaryLight),
                    title: Text(
                      'Settings',
                      style: FontStyles.montserratRegular18(),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.pushNamed(context, Settings.routeName);
                    },
                    leading: const Icon(Icons.help_outline,
                        color: AppColors.primaryLight),
                    title: Text(
                      'Help',
                      style: FontStyles.montserratRegular18(),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, OnBoarding.routeName);
                    },
                    leading: const Icon(Icons.logout_outlined,
                        color: AppColors.primaryLight),
                    title: Text(
                      'Logout',
                      style: FontStyles.montserratRegular18(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
