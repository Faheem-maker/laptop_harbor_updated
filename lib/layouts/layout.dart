import 'package:flutter/material.dart';
import 'package:laptop_harbor/widgets/bottom_bar.dart';
import 'package:laptop_harbor/widgets/notched_rectangle.dart';

class DashboardLayout extends StatelessWidget {
  final Widget screen;
  const DashboardLayout(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> scaffoldKey =
        GlobalKey<ScaffoldMessengerState>();

    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Laptop Harbor"),
          ),
        ),
        body: this.screen,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Align(
          alignment: Alignment(0.00, 1.15),
          child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Color.fromARGB(255, 211, 12, 12),
          hoverColor: const Color.fromARGB(255, 207, 125, 119),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, "/dashboard");
          },
          child: Icon(Icons.home_filled),
        ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          items: [
            FABBottomAppBarItem(iconData: Icons.account_box, text: "Account"),
            FABBottomAppBarItem(iconData: Icons.shopping_cart, text: "Cart"),
          ],
          centerItemText: "Home",
          backgroundColor: Colors.white,
          color: Colors.redAccent,
          selectedColor: Colors.red,
          notchedShape: CircularOuterNotchedRectangle(),
          onTabSelected: (i) => {
            if (i == 0)
              {Navigator.pushNamed(context, "/account")}
            else if (i == 1)
              {Navigator.pushNamed(context, "/cart")}
          },
        ),
      ),
    );
  }
}
