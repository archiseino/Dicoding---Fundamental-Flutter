import 'package:cupertino_app/search_page.dart';
import 'package:cupertino_app/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // There are two kind of Scaffold here
    // CupertinoPageScaffold, like regular Scaffold in MaterialApp
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FeedsPage();
            case 1:
              return SearchPage();
            case 2:
              return SettingsPage();
            default:
              return const Center(
                child: Text('Page not found!'),
              );

          }
        }
    );
  }
}

class FeedsPage extends StatelessWidget{

  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Feeds Page"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Feeds Page", style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
            const SizedBox(height: 8.0,),
            CupertinoButton.filled(
                child: Text("Select Category"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text('Select Categories'),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CategoryPage(
                                        selectedCategory: 'Technology'),
                                  ),
                                );
                              },
                              child: Text('Technology'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => CategoryPage(
                                        selectedCategory: 'Business'),
                                  ),
                                );
                              },
                              child: Text('Business'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        CategoryPage(selectedCategory: 'Sport'),
                                  ),
                                );
                              },
                              child: Text('Sport'),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        );
                      });

                }
            )
          ],
        )
      )
    );
  }

}

class CategoryPage extends StatelessWidget {
  final String selectedCategory;
  
  const CategoryPage({super.key, required this.selectedCategory});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$selectedCategory Page"),
      ),
      child: Center(
        child: Text(
          "$selectedCategory Page",
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}

