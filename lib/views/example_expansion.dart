import 'package:flutter/material.dart';

class ExampleExpansionList extends StatefulWidget {
  const ExampleExpansionList({super.key});

  @override
  State<ExampleExpansionList> createState() => _ExampleExpansionListState();
}

class _ExampleExpansionListState extends State<ExampleExpansionList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => _buildList(dataList[index]),
    );
  }

  Widget _buildList(Menu list) {
    if (list.subMenu.isEmpty) {
      return Builder(builder: (context) => ListTile(title: Text(list.name)));
    }
    return ExpansionTile(
      leading: list.icon != null ? Icon(list.icon) : null,
      title: Text(
        list.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu.map(_buildList).toList(),
    );
  }
}

List dataList = [
  Menu(name: "Sales", icon: Icons.payment, subMenu: [Menu(name: "Orders"), Menu(name: "Invoices")]),
  Menu(name: "Marketing", icon: Icons.volume_up, subMenu: [
    Menu(name: "Promotions", subMenu: [Menu(name: "Catalog Price Rule"), Menu(name: "Cart Price Rules")]),
    Menu(name: "Communications", subMenu: [Menu(name: "Newsletter Subscribers")]),
    Menu(name: "SEO & Search", subMenu: [Menu(name: "Search Terms"), Menu(name: "Search Synonyms")]),
    Menu(name: "User Content", subMenu: [Menu(name: "All Reviews"), Menu(name: "Pending Reviews")])
  ])
];

class Menu {
  String name = '';
  IconData? icon;
  List<Menu> subMenu;

  Menu({required this.name, this.subMenu = const [], this.icon});
}
