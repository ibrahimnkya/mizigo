import 'package:flutter/material.dart';

enum MaterialPinShape { outlined, box }

enum MaterialPinAnimation { fade, scale }

class MaterialPinTheme {
  final MaterialPinShape shape;
  final BorderRadius borderRadius;
  final Size cellSize;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final MaterialPinAnimation entryAnimation;

  const MaterialPinTheme({
    this.shape = MaterialPinShape.outlined,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.cellSize = const Size(50, 60),
    this.fillColor = Colors.transparent,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.borderWidth = 1.0,
    this.entryAnimation = MaterialPinAnimation.fade,
  });
}

class PinInputController extends TextEditingController {}

class MaterialPinField extends StatefulWidget {
  final int length;
  final PinInputController pinController;
  final TextInputType keyboardType;
  final MaterialPinTheme theme;
  final ValueChanged<String>? onChanged;

  const MaterialPinField({
    super.key,
    required this.length,
    required this.pinController,
    this.keyboardType = TextInputType.number,
    this.theme = const MaterialPinTheme(),
    this.onChanged,
  });

  @override
  State<MaterialPinField> createState() => _MaterialPinFieldState();
}

class _MaterialPinFieldState extends State<MaterialPinField> {
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    widget.pinController.addListener(_onControllerUpdate);
  }

  void _onControllerUpdate() {
    if (widget.pinController.text.isEmpty) {
      _focusNodes[0].requestFocus();
    }
    setState(() {});
  }

  @override
  void dispose() {
    widget.pinController.removeListener(_onControllerUpdate);
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        final isFocused = _focusNodes[index].hasFocus;
        final hasValue = widget.pinController.text.length > index;

        return Container(
          width: widget.theme.cellSize.width,
          height: widget.theme.cellSize.height,
          decoration: BoxDecoration(
            color: widget.theme.fillColor,
            borderRadius: widget.theme.borderRadius,
            border: Border.all(
              color: isFocused
                  ? widget.theme.focusedBorderColor
                  : widget.theme.borderColor,
              width: widget.theme.borderWidth,
            ),
          ),
          child: Center(
            child: TextField(
              focusNode: _focusNodes[index],
              controller: TextEditingController(
                text: hasValue ? widget.pinController.text[index] : '',
              ),
              showCursor: false,
              textAlign: TextAlign.center,
              keyboardType: widget.keyboardType,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  var currentText = widget.pinController.text;
                  if (currentText.length > index) {
                    currentText = currentText.replaceRange(index, index + 1, value);
                  } else {
                    currentText += value;
                  }
                  widget.pinController.text = currentText;
                  
                  if (index < widget.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  }
                } else {
                  var currentText = widget.pinController.text;
                  if (currentText.isNotEmpty) {
                    currentText = currentText.replaceRange(index, index + 1, '');
                    widget.pinController.text = currentText;
                  }
                  if (index > 0) {
                    _focusNodes[index - 1].requestFocus();
                  }
                }
                widget.onChanged?.call(widget.pinController.text);
              },
            ),
          ),
        );
      }),
    );
  }
}
