import 'package:eureka/components/CustomButton.dart';
import 'package:eureka/components/CustomTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class Anonymeview extends StatefulWidget {
  const Anonymeview({super.key});

  @override
  State<Anonymeview> createState() => _Anonymeview();
}

class _Anonymeview extends State<Anonymeview> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.darkGrey,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 55, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Titre du sondage',
                    style: TextStyle(color: Utils.white),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: '< Retour',
                    textColor: Utils.orange,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'Rester anonyme pour ce sondage',
                  style: TextStyle(color: Utils.white, fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: RadioListTile(
                    title: Text(
                      'Oui, rester anonyme',
                      style: TextStyle(color: Utils.white),
                    ),
                    value: false,
                    groupValue: false,
                    activeColor: Utils.orange,
                    onChanged: (value) {
                      setState(() {
                        value = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: RadioListTile(
                    title: Text(
                      'Non, réveler mon identité',
                      style: TextStyle(color: Utils.white),
                    ),
                    value: false,
                    groupValue: true,
                    onChanged: (value) {
                      setState(() {
                        value = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Suivant',
            backgroundColor: Utils.white,
            textColor: Utils.darkGrey,
          ),
        ],
      ),
    );
  }
}
