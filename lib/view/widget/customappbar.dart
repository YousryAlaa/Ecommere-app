import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String hinttext;
  final TextEditingController? searchcontroller;
  final void Function() onPressedIcon;
  final void Function() onPressedMyFavorie;
  final void Function(String) onMyChanged;

  const CustomAppBar(
      {super.key,
      required this.onPressedIcon,
      required this.hinttext,
      required this.onPressedMyFavorie,
      this.searchcontroller,
      required this.onMyChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextFormField(
              onChanged: onMyChanged,
              controller: searchcontroller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: IconButton(
                      onPressed: onPressedIcon,
                      icon: Icon(
                        Icons.search_outlined,
                        size: 25,
                      )),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: hinttext,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 40,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
          child: IconButton(
              onPressed: onPressedMyFavorie,
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 25,
              )),
        )
      ],
    );
  }
}
