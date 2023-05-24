import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_page/search_page.dart';

class SearchPageButton extends StatelessWidget {
  SearchPageButton({Key? key}) : super(key: key);
  List<Contact> contacts = [];

  getAllContacts() async{
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    contacts = _contacts;
  }

  @override
  Widget build(BuildContext context) {
    getAllContacts();
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Contact>(
            onQueryUpdate: (s) => print(s),
            items: contacts,
            searchLabel: 'Search people',
            suggestion: Center(
              child: Text('Filter people by name'),
            ),
            failure: Center(
              child: Text('No person found :( ' + contacts.length.toString()),
            ),
            filter: (contact) => [
              contact.displayName,
            ],
            builder: (contact) => ListTile(
              title: Text(contact.displayName ?? "unavailable name"),
              subtitle: Text(contact.initials()),
            ),
          ),
        ),
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
          size: 25,
        ));
  }
}




