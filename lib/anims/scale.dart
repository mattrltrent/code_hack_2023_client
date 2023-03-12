import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaleAnim extends StatefulWidget {
  const ScaleAnim({
    this.tappable = true,
    required this.child,
    required this.onTap,
    this.tooltip,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function onTap;
  final bool tappable;
  final String? tooltip;

  @override
  State<ScaleAnim> createState() => _ScaleAnimState();
}

class _ScaleAnimState extends State<ScaleAnim> with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation anim;

  @override
  void initState() {
    animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50), reverseDuration: const Duration(milliseconds: 200));
    anim = CurvedAnimation(parent: animController, curve: Curves.linear, reverseCurve: Curves.linear);
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  void executeTapType() {
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return widget.tappable
        ? GestureDetector(
            onTapDown: (_) {
              animController.forward();
              animController.addListener(() => setState(() {}));
            },
            onTapCancel: () {
              animController.reverse();
              animController.addListener(() => setState(() {}));
            },
            onTap: () {
              widget.onTap();
              executeTapType();
              animController.forward().then((_) => animController.reverse());
              animController.addListener(() => setState(() {}));
            },
            child: Opacity(
              opacity: -anim.value * 0.4 + 1,
              child: Transform.scale(
                scale: -anim.value * 0.065 + 1,
                child: widget.child,
              ),
            ),
          )
        : widget.child;
  }
}
