import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/core/widgets/bottom_sheet_appbar.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final List<String> sorts = const [
    'Our recommendations',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only',
    'Distance only'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.9,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            child: Column(
              children: [
                SizedBox(
                    height: constraints.maxHeight * 0.1,
                    child: const BottomSheetAppBar(title: 'Sort by')),
                Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Text(
                                        sorts[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      if (currentIndex == index)
                                        const FaIcon(
                                          FontAwesomeIcons.check,
                                          color: kmainColor,
                                          size: 20,
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, indext) => const Divider(
                              thickness: 1,
                              height: 2,
                            ),
                        itemCount: sorts.length))
              ],
            ),
          );
        }));
  }
}
