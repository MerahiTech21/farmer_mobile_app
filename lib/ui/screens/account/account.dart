import 'package:coldroom_product_management/controller/auth.dart';
import 'package:coldroom_product_management/ui/screens/login/login.dart';
import 'package:coldroom_product_management/utils/constants.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  static const String routeName = '/account';
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController _phoneNoCtrl = TextEditingController();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? name;
  String? phoneNo;
  String? userId;
  bool _isLoading = false;
  String _error = "";
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    try {
      _isLoading = true;
      Map<String, dynamic> response = await fetchUserInfo();
      name = response[""];
      phoneNo = response[""];
      userId = response["id"];
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
    }
  }

  logoutUser() async {
    await logout();

    Navigator.of(context).pushNamedAndRemoveUntil(
        Login.routeName, (Route<dynamic> route) => false);
  }

  _showChangePasswordDialog() {
    // _phoneNo.text = auth.firstName;
    // _lastNameCtrl.text = auth.lastName;

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.all(kDefaultPadding * 0.5),
        child: Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            // color: isDark ? kDarkBlueColor : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Old Password'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _oldPassword,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Old password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('New Password'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _newPassword,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'New password is required';
                          } else if (value.length >= 6) {
                            return "Shouldn't be greater than 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Change"),
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _showPhoneNoDialog() {
    // _phoneNo.text = auth.firstName;
    // _lastNameCtrl.text = auth.lastName;

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.all(kDefaultPadding * 0.5),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            // color: isDark ? kDarkBlueColor : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('New Phone No'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _phoneNoCtrl,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone is required';
                          } else if (value.length > 10) {
                            return "Shouldn't be greater than 10";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                name = "Here wergo";
                              });
                            },
                            child: const Text("Change"),
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAboutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Tell about rensys engineering more '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: kPrimaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showContactDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Tell more about rensys address'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: kPrimaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: _isLoading
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * .05,
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: kPrimaryColor,
                      child: Text(
                        // auth.firstName?.substring(0, 1).toUpperCase() ?? '',
                        'B',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Betelot Temesgen',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildCard(
                        title: "Change Phone No", onPress: _showPhoneNoDialog),
                    buildCard(
                        title: "Change Password",
                        onPress: _showChangePasswordDialog),
                    buildCard(title: "About", onPress: _showAboutDialog),
                    buildCard(title: "Contact us", onPress: _showContactDialog),
                    buildCard(title: "Logout", onPress: logoutUser),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget buildCard({title, onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}