## Using Widgets
```dart
import 'package:example/widgets/main/core/MainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:lenore_ui/lenore_ui.dart';
import 'package:provider/src/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: LenoreAppBar(
          titleText: 'Lenore',
        ),
        drawer: LenoreDrawer(
          header: Container(
            height: 100,
            alignment: Alignment.center,
            color: Theme.of(context).disabledColor,
          ),
          drawerItems: [
            LenoreDrawerItem(
              text: 'First Drawer Item Selected',
              icon: Icons.person,
              isSelected: true,
            ),
            LenoreDrawerItem(
              text: 'Second Drawer Item',
              icon: Icons.dashboard,
              isSelected: false,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Scrollbar(
            controller: context.read<MainViewModel>().scrollController,
            child: ListView(
              controller: context.read<MainViewModel>().scrollController,
              children: [
                // Responsive
                Text(
                  Responsive.isDesktop(context)
                      ? "Screen size is DESKTOP size!"
                      : Responsive.isMobile(context)
                          ? "Screen size is MOBILE size!"
                          : "Screen size is TABLET size!",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreButton
                Text(
                  'LenoreButton',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 8),
                LenoreButton(
                  caption: 'Change Dark Mode',
                  onPressed: () {
                    context.read<MainViewModel>().toggleDarkMode(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreDatePicker
                Text(
                  'LenoreDatePicker',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 8),
                LenoreDatePicker(
                  onPressed: () {
                    context.read<MainViewModel>().pickDate(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreDropDown
                Text(
                  'LenoreDropDown',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreDropDown(
                  items: context.read<MainViewModel>().genders,
                  value: context.watch<MainViewModel>().genderValue,
                  onChange: (newValue) =>
                      context.read<MainViewModel>().onGenderChange(newValue),
                  label: 'Gender',
                  icon: Icons.wc_rounded,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreFlatButton
                Text(
                  'LenoreFlatButton',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreFlatButton(
                  caption: 'A Flat Button',
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreLoading
                Text(
                  'LenoreLoading',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreLoading(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreTextFormField
                Text(
                  'LenoreTextFormField',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreTextFormField(
                  controller: TextEditingController(),
                  label: 'Enter Your Name',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreNoDataWidget
                Text(
                  'LenoreNoDataWidget',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreNoDataWidget(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreNoInternetWidget
                Text(
                  'LenoreNoInternetWidget',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreNoInternetWidget(
                  reloadFunction: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Refresh Page",
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 2),
                    ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Using Theme
```dart
MaterialApp(
      title: 'Lenore Demo',
      theme: LenoreAppTheme(isDark: context.watch<MainViewModel>().isDark)
          .themeData,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/MainView':
            return MaterialPageRoute(builder: (context) => const MainView());
          case '/':
            return MaterialPageRoute(builder: (context) => const MainView());
          default:
            return MaterialPageRoute(builder: (context) => const MainView());
        }
      },
    )
```