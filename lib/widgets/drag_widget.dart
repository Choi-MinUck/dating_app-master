import 'package:dating_app/main.dart';
import 'package:dating_app/model/profile.dart';
import 'package:dating_app/widgets/profile_card.dart';
import 'package:dating_app/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.card,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final MyCard card;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: widget.swipeNotifier.value != Swipe.none
                    ? widget.swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    CardDeckButton4(card: widget.card),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.left;
          }
          if (dragUpdateDetails.delta.dy > 0 &&
              dragUpdateDetails.globalPosition.dy >
                  MediaQuery.of(context).size.height / 2) {
            widget.swipeNotifier.value = Swipe.top;
          }
          if (dragUpdateDetails.delta.dy < 0 &&
              dragUpdateDetails.globalPosition.dy <
                  MediaQuery.of(context).size.height / 2) {
            widget.swipeNotifier.value = Swipe.bottom;
          }
        },
        onDragEnd: (drag) {
          widget.swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        //This will be visible when we press action button
        child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (BuildContext context, Swipe swipe, Widget? child) {
              return Stack(
                children: [
                  CardDeckButton4(card: widget.card),
                ],
              );
            }),
      ),
    );
  }
}
