import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmailFieldWidget extends StatefulWidget {
  const CustomEmailFieldWidget({Key key}) : super(key: key);

  @override
  _CustomEmailFieldWidgetState createState() => _CustomEmailFieldWidgetState();
}

class _CustomEmailFieldWidgetState extends State<CustomEmailFieldWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: textController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFF8B8B8B),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8B8B8B),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF8B8B8B),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
        ),
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Poppins',
          color: Color(0xFF8B8B8B),
        ),
        validator: (val) {
          if (val.isEmpty) {
            return 'Field is required';
          }

          return null;
        },
      ),
    );
  }
}
