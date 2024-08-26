import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'zoo_data.dart';

class ZooAnimalWidget extends StatefulWidget {
  const ZooAnimalWidget({Key? key}) : super(key: key);

  @override
  State<ZooAnimalWidget> createState() => _ZooAnimalWidgetState();
}

class _ZooAnimalWidgetState extends State<ZooAnimalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สัตว์',style: TextStyle(fontFamily: 'ThaiLooped'),)),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: [
            _buildButton(ZooData.imagePaths[0], 0),
            _buildButton(ZooData.imagePaths[1], 1),
            _buildButton(ZooData.imagePaths[2], 2),
            _buildButton(ZooData.imagePaths[3], 3),
            _buildButton(ZooData.imagePaths[4], 4),
            _buildButton(ZooData.imagePaths[5], 5),
            _buildButton(ZooData.imagePaths[6], 6),
            _buildButton(ZooData.imagePaths[7], 7),
            _buildButton(ZooData.imagePaths[8], 8),
            _buildButton(ZooData.imagePaths[9], 9),
            _buildButton(ZooData.imagePaths[10], 10),
            _buildButton(ZooData.imagePaths[11], 11),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalIndexWidget(startIndex: index),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AnimalIndexWidget extends StatefulWidget {
  final int startIndex;

  const AnimalIndexWidget({Key? key, required this.startIndex})
      : super(key: key);

  @override
  State<AnimalIndexWidget> createState() => _AnimalIndexWidgetState();
}

class _AnimalIndexWidgetState extends State<AnimalIndexWidget> {
  late PageController _pageController;
  int _currentIndex = 0;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สัตว์',style: TextStyle(fontFamily: 'ThaiLooped'),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: ZooData.imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    ZooData.imagePaths[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousPage,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 148, 103, 253),),
                  child: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 235, 221, 255),),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: _playSound,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 171, 79, 187),),
                  child: Icon(Icons.volume_up,color: Color.fromARGB(255, 237, 255, 237),),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 148, 103, 253),),
                  child: Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 235, 221, 255),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    _currentIndex = widget.startIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _playSound() {
    player.play(AssetSource(ZooData.audioPaths[_currentIndex]));
  }

  void _nextPage() {
    if (_currentIndex < ZooData.imagePaths.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentIndex--;
        
      });
    }
  }
}
