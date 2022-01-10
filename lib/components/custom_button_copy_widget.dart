import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonCopyWidget extends StatefulWidget {
  const CustomButtonCopyWidget({Key key}) : super(key: key);

  @override
  _CustomButtonCopyWidgetState createState() => _CustomButtonCopyWidgetState();
}

class _CustomButtonCopyWidgetState extends State<CustomButtonCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'RESET PASSWORD',
      options: FFButtonOptions(
        width: 300,
        height: 40,
        color: Color(0xFF425365),
        textStyle: FlutterFlowTheme.subtitle2.override(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 14,
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: 5,
      ),
    );
  }
}
