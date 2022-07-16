import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class MyEditTextFiled extends StatelessWidget {
  MyEditTextFiled({Key? key,required this.hintText,required this.password,this.controller,this.onTap,this.isDateAble}) : super(key: key);
  String hintText;
  bool password = false;
  Callback? onTap;
  bool? isDateAble = false;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09,right: MediaQuery.of(context).size.width * 0.09),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: editTextBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: editTextStrok,width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextField(
              enabled: isDateAble == true ? false : true,
              controller: controller,
              obscureText: password,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.cairo(
                  color: Colors.grey,
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                ),
                labelStyle: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // suffixIcon: password ? GestureDetector(
                //   onTap: (){},
                //     child: Icon(Icons.visibility,color: Colors.grey,)
                // ) :
                // SizedBox()
              ),
            ),
          ),
        ),
      ),
    );
  }
}
