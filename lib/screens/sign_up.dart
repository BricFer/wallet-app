import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/layout/custom_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: CustomHeader(title: 'Create an\naccount,'));
  }
}
