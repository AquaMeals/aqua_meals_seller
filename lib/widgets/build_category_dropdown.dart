import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildCategoryDropdown extends StatelessWidget {
  final String? _value;
  final String? _collectionName;
  final void Function(String?)? _onchanged;
  const BuildCategoryDropdown({
    Key? key,
    String? value,
    String? collectionName,
    void Function(String?)? onchanged,
  })  : _value = value,
        _onchanged = onchanged,
        _collectionName = collectionName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("$_collectionName")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading.....");
          } else {
            List<DropdownMenuItem<String?>> categoryItems = [];
            for (int i = 0; i < snapshot.data.docs.length; i++) {
              DocumentSnapshot snap = snapshot.data.docs[i];
              categoryItems.add(
                DropdownMenuItem(
                  child: Text(
                    snap.id,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  value: snap.id,
                ),
              );
            }
            return InputDecorator(
              decoration: InputDecoration(
                enabledBorder: coloredOutlineInputBorder(context),
                border: coloredOutlineInputBorder(context),
                focusedBorder: coloredOutlineInputBorder(context),
                errorBorder: coloredErrorOutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(13),
                    horizontal: getProportionateScreenHeight(13)),
                filled: true,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
              ),
              isEmpty: _value == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String?>(
                  onChanged: _onchanged,
                  value: _value,
                  items: categoryItems,
                  isDense: true,
                  iconEnabledColor: Theme.of(context).primaryColor,
                  isExpanded: true,
                  hint: Text(
                    "$_collectionName",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            );
          }
        });
  }
}
