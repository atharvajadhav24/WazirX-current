import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCloseIconWidget extends StatefulWidget {
  const CustomCloseIconWidget({Key key}) : super(key: key);

  @override
  _CustomCloseIconWidgetState createState() => _CustomCloseIconWidgetState();
}

class _CustomCloseIconWidgetState extends State<CustomCloseIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
      child: Icon(
        Icons.close,
        color: Color(0xFFEAF4FE),
        size: 30,
      ),
    );
  }
}
