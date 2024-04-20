import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ImageGridViewWidget extends ConsumerStatefulWidget {
  final String imgurl,label;
  const ImageGridViewWidget({super.key,required this.imgurl, required this.label});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImageGridViewWidgetState();
}

class _ImageGridViewWidgetState extends ConsumerState<ImageGridViewWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        boxShadow: boxShadow(),
        color: //ref.watch(themesProvider) == 
              ThemeMode ==  ThemeMode.dark ? const Color.fromARGB(255, 38, 42, 47) : const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: SvgPicture.asset(
              widget.imgurl,
              height: 100,
              width: 100,
              fit: BoxFit.contain,  
            )
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Container(
              alignment: Alignment.center, 
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontFamily: 'TextaAltMedium',
                  fontSize: 15,
                  fontWeight: FontWeight.w200
                ),  
              ),
            )
          )
        ],
      ),
    );
  }

  List<BoxShadow> boxShadow(){
    if (ThemeMode == ThemeMode.dark) {
      return [
        BoxShadow(
          color: Colors.white.withOpacity(0.14),
          offset: const Offset(-2.5, -2.5),
          blurRadius: 10.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.6),
          offset: const Offset(6.0, 6.0),
          blurRadius: 8.0,
        ),
      ];
    }
    else{
      return [
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          offset: Offset(-6.0, -6.0),
          blurRadius: 16.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(6.0, 6.0),
          blurRadius: 16.0,
        ),
      ];
    }
  }
}
