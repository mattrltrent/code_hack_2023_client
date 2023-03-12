import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/typography.dart';

class TextfieldLayout extends StatefulWidget {
  const TextfieldLayout(
      {required this.topText,
      required this.controller,
      this.icon = CupertinoIcons.search,
      this.bottomPadding = 0.0,
      this.topPadding = 0.0,
      this.horizontalPadding = 0.0,
      this.password = false,
      this.autoCorrect = false,
      this.showTopText = true,
      this.hintText,
      this.onFocusChange,
      this.hasRightButton = false,
      this.rightButtonOnTap,
      this.rightButtonText,
      Key? key})
      : super(key: key);

  final Function(bool)? onFocusChange;
  final String? hintText;
  final bool showTopText;
  final bool autoCorrect;
  final bool password;
  final IconData icon;
  final double bottomPadding;
  final String topText;
  final double topPadding;
  final double horizontalPadding;
  final TextEditingController controller;
  final bool hasRightButton;
  final VoidCallback? rightButtonOnTap;
  final String? rightButtonText;

  @override
  State<TextfieldLayout> createState() => _TextfieldLayoutState();
}

class _TextfieldLayoutState extends State<TextfieldLayout> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // widget.controller.clear();
    focusNode.addListener(() {
      if (widget.onFocusChange == null) return;
      if (focusNode.hasFocus) {
        widget.onFocusChange!(true);
      } else {
        widget.onFocusChange!(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.horizontalPadding,
          right: widget.horizontalPadding,
          top: widget.topPadding,
          bottom: widget.bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.showTopText
              ? Column(
                  children: [
                    Text(
                      widget.topText,
                      style: kBody.copyWith(color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                  ],
                )
              : Container(),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => focusNode.requestFocus(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: .5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 17.5, bottom: 17.5, left: 17.5),
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: widget.autoCorrect,
                              obscureText: widget.password,
                              focusNode: focusNode,
                              controller: widget.controller,
                              style: kBody.copyWith(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration.collapsed(
                                hintText: widget.hintText ?? "...",
                                hintStyle: kBody.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => widget.controller.clear(),
                          child: Container(
                            // Transparent hitbox trick.
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(17.5),
                            child: Icon(
                              CupertinoIcons.xmark,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.rightButtonOnTap != null) {
                    widget.rightButtonOnTap!();
                  }
                },
                child: Container(
                  // Transparent hitbox trick.
                  height: 48,
                  color: Colors.transparent,
                  child: AnimatedSize(
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 175),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.only(left: widget.hasRightButton ? 15 : 0),
                      child: Center(
                        child: Text(
                          widget.hasRightButton
                              ? widget.rightButtonText != null
                                  ? widget.rightButtonText!
                                  : throw "Please enter right button text."
                              : "",
                          style: kTitle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
