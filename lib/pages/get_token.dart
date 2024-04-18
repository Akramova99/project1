import 'package:flutter/material.dart';
class VerificationPage extends StatelessWidget {
  static const String id  ="VerificationPage";
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: VerificationCodeInput()),
    );
  }
}




class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(5, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(8),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 4) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  _focusNodes[index].unfocus();
                }
              }
            },
            focusNode: _focusNodes[index],
          ),
        ),
      ),
    );
  }
}
