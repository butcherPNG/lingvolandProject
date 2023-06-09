import 'package:flutter/material.dart';



class CoursesSlider extends StatefulWidget {
  final ScrollController scrollController;
  final List<Widget> cards;
  final double height;


  const CoursesSlider({Key? key, required this.scrollController, required this.cards, required this.height}) : super(key: key);

  @override
  _CoursesSliderState createState() => _CoursesSliderState();
}

class _CoursesSliderState extends State<CoursesSlider> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Вычисляем новую позицию прокрутки
          final newPosition = widget.scrollController.position.pixels - details.delta.dx;
          // Прокручиваем содержимое
          widget.scrollController.jumpTo(newPosition);
        },
        child: SingleChildScrollView(
          controller: widget.scrollController,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [
              for (var index = 0; index < widget.cards.length; index++)
                Padding(
                  padding: index == 0 ? EdgeInsets.only(left: (MediaQuery.of(context).size.width - 288) / 2) : EdgeInsets.only(left: 12),
                  child: widget.cards[index],
                ),
            ],
          ),
        ),
      ),
    );
  }
}