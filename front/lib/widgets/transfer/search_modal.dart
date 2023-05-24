import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:skip/core/utils/color_contant.dart';
import 'package:skip/repos/contacts_utils.dart';
import 'package:skip/view_models/user_view_model.dart';

import '../../models/app_contact.dart';
import '../../repos/api_status.dart';
import '../../view_models/pay_view_model.dart';

class FriendContact {
  FriendContact(this.contact, this.isFriend);
  final Contact contact;
  bool isFriend;
}

class SearchModal extends StatefulWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
  String phone = "";
  List<FriendContact> contacts = [];
  List<FriendContact> filteredContacts = [];
  List<AppContact> friends = [];
  TextEditingController searchController = TextEditingController();
  bool loading = true;

  Future askContactsPermissionAndLoadContacts() async {
    final permission = await ContactsUtils.getContactPermission();
    switch (permission) {
      case PermissionStatus.granted:
        List<Contact> _contacts =
            await ContactsService.getContacts(withThumbnails: true);
        List<FriendContact> _friendContacts = [];
        for (var item in _contacts) {
          _friendContacts.add(FriendContact(item, false));
        }
        // if widged is mounted
        if (mounted) {
          setState(() {
            contacts = _friendContacts;
            loading = false;
          });
        }
        await getFriendsAndUpdateContacts(_contacts);
        break;
      default:
        break;
    }
  }

  Future getFriendsAndUpdateContacts(List<Contact> phoneContacts) async {
    if (mounted) {
      var userViewModel = context.read<UserViewModel>();
      var response = await userViewModel.sendAndLoadContacts(phoneContacts);
      var _friends = userViewModel.contacts;
      List<FriendContact> _friendContacts = [];
      _friendContacts.addAll(contacts);
      for (var i in _friendContacts) {
        var phones = i.contact.phones;
        for (var j in _friends) {
          if (phones != null &&
              phones.isNotEmpty &&
              phones.elementAt(0).value!.trim().replaceAll(" ", "") ==
                  j.phone) {
            i.isFriend = true;
          }
        }
      }
      if (mounted) {
        if (response is Success) {
          setState(() {
            friends = _friends;
            contacts = _friendContacts;
          });
        }
      }
    }
  }

  filterContacts() {
    List<FriendContact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((c) {
        var contactPhones = c.contact.phones;
        var contactName = c.contact.displayName?.toLowerCase() ?? "none";
        var contactPhone = (contactPhones != null && contactPhones.isNotEmpty)
            ? contactPhones.elementAt(0).value ?? "No Phone"
            : "No Phone";
        var searchTerm = searchController.text.toLowerCase();
        return contactName.contains(searchTerm) ||
            contactPhone.contains(searchTerm);
      });
      setState(() {
        filteredContacts = _contacts;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    askContactsPermissionAndLoadContacts();
    searchController.addListener(() => filterContacts());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userViewModel = context.read<UserViewModel>();
    var payViewModel = context.read<PayViewModel>();
    friends = userViewModel.contacts;
    var isSearching = searchController.text.isNotEmpty;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        children: [
          // SizedBox(height: 10,),
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
                labelText: 'search contacts',
                border: OutlineInputBorder(
                    // borderSide: BorderSide(color: ColorConstant.black)
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(Icons.search,
                    color: ColorConstant.darkBlueBackground)),
          ),
          const SizedBox(
            height: 5,
          ),
          loading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: isSearching
                          ? filteredContacts.length
                          : contacts.length,
                      itemBuilder: (context, idx) {
                        FriendContact friendContact =
                            isSearching ? filteredContacts[idx] : contacts[idx];
                        var avatar = friendContact.contact.avatar;
                        var phones = friendContact.contact.phones;
                        return ListTile(
                            title: Text(
                                friendContact.contact.displayName ?? "No Name"),
                            subtitle: Text((phones != null && phones.isNotEmpty)
                                ? phones.elementAt(0).value ?? "No Phone"
                                : "No Phone"),
                            leading: (avatar != null && avatar.isNotEmpty)
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(avatar),
                                  )
                                : CircleAvatar(
                                    child:
                                        Text(friendContact.contact.initials())),
                            // trailing: Text("not skip user", style: TextStyle(color: Colors.red)),
                            trailing: isSearching
                                ? (!filteredContacts[idx].isFriend
                                    ? const Text("not a skip user",
                                        style: TextStyle(color: Colors.red))
                                    // : const Text('')
                                    : TextButton(child: const Text('choose'), onPressed: () async {
                                          payViewModel.receiverName = friendContact.contact.displayName??"";
                                          payViewModel.receiverPhone = friendContact.contact.phones?.elementAt(0).value?.trim().replaceAll(" ", "")??"";
                                          await payViewModel.getReceiverData();
                                          Navigator.pop(context);
                                    }, )
                                    )
                                : (!contacts[idx].isFriend
                                    ? const Text("not skip user",
                                        style: TextStyle(color: Colors.red))
                                    : TextButton(child: const Text('choose'), onPressed: () async {
                                          payViewModel.receiverName = friendContact.contact.displayName??"";
                                          payViewModel.receiverPhone = friendContact.contact.phones?.elementAt(0).value?.trim().replaceAll(" ", "")??"";
                                          await payViewModel.getReceiverData();
                                          Navigator.pop(context);
                                    }, )));
                      }),
                ),
        ],
      ),
    );
  }
}
