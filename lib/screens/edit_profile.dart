import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/custom_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageName: "Edit Profile"),
      body: Center(child: Text("Your are at the Edit Profile Page")),
    );
  }}