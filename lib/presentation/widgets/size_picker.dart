import '../../../../my_app/lib/utilis/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChange,
    this.isRounded=true});

  final List<String> size;

  final Function(String) onChange;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.size.length,
          itemBuilder: (contex, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onChange(widget.size[index]);
                setState(() {});
              },
              child: Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 40,
                  width: widget.isRounded  ? 40 :null,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getSelectedBackgroundCOlor(
                        index == selectedIndex) ,
                      borderRadius: BorderRadius.circular(widget.isRounded  ?
                      100 :8),
                      border: Border.all(
                          color:_getSelectedCOlor( index == selectedIndex))),
                  child: FittedBox(
                      child: Text(
                    widget.size[index],
                    style: TextStyle(

                        color: _getSelectedCOlor(index == selectedIndex)),
                  ))),
            );
          }),
    );
  }

  Color _getSelectedCOlor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedBackgroundCOlor(bool isSelected) {
    return isSelected ? AppColores.primaryColor : Colors.transparent;
  }
}
