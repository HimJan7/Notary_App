import 'package:flutter/material.dart';
import 'package:notary_app/constants.dart';
import 'package:notary_app/components/get_class.dart';
import 'package:provider/provider.dart';
import '../Models/SearchModel.dart';
import '../components/list_view.dart';

class data extends StatefulWidget {
  data({super.key, required this.newUser});
  UserController newUser;
  @override
  State<data> createState() => _dataState();
}

//demo@thenotary.app
class _dataState extends State<data> {
  late Future<bool> init;
  CurrentList firstInstance = CurrentList();
  List<String> updateList(String searchQuery, List<String> stringList) {
    List<String> matchedStrings = [];
    for (String string in stringList) {
      if (string.toLowerCase().contains(searchQuery.toLowerCase())) {
        matchedStrings.add(string);
      }
    }
    return matchedStrings;
  }

  UpdatingFunction(value) {
    if (value == "") {
      firstInstance.assign(widget.newUser.companiesNameList);
    } else {
      firstInstance.assign(updateList(value, widget.newUser.companiesNameList));
    }
  }

  @override
  void initState() {
    firstInstance.assign(widget.newUser.companiesNameList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: firstInstance,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Consumer<CurrentList>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text(
                      'Companies List',
                      style: TextStyle(color: Color(0xFF424242)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Text('${value.ItemList.length} companies Found',
                        style: TextStyle(color: Color(0xFF424242))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    SizedBox(
                      height: 30,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) async {
                          await UpdatingFunction(value);
                        },
                        decoration: kRoundInputDecoration,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemCount: value.ItemList.length,
                          itemBuilder: (context, index) {
                            return companiesListWidget(
                              companyName: value.ItemList[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
