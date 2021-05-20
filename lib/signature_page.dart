import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'signature_canvas.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  Uint8List _signatureBytes;

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  void _clearSignature() => _signatureController.clear();

  void _sendSignature() async {
    if (_signatureController.isNotEmpty) {
      _signatureBytes = await _signatureController.toPngBytes();
      // String _signatuteBase64 = base64Encode(_signatureBytes);
      // Clipboard.setData(ClipboardData(text: _signatuteBase64));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignatureCanvas(signatureController: _signatureController),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _clearSignature,
                child: Text('Clear'),
              ),
              TextButton(
                onPressed: _sendSignature,
                child: Text('Submit'),
              ),
            ],
          ),
          _signatureBytes != null ? Image.memory(_signatureBytes) : Container()
        ],
      ),
    );
  }
}
