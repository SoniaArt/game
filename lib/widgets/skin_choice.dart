import 'package:flutter/material.dart';

class SkinSelector extends StatelessWidget {
  final Function(String) onSkinSelected;
  final VoidCallback onClose;

  const SkinSelector({
    super.key,
    required this.onSkinSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final skins = ['1', '2', '3', '4', '5', '6'];

    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ),

          Center(
            child: Container(
              width: 400,  
              height: 400, 
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 250,
                    child: GridView.count(
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(4),
                      children: List.generate(skins.length, (index) {
                        return GestureDetector(
                          onTap: () => onSkinSelected(skins[index]),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0), 
                            child: Image.asset(
                              'assets/images/catIsSitting${skins[index]}.png',
                              width: 80,  
                              height: 80,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}