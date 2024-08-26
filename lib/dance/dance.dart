import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class DanceWidget extends StatefulWidget {
  const DanceWidget({super.key});

  @override
  State<DanceWidget> createState() => _DanceWidgetState();
}

class _DanceWidgetState extends State<DanceWidget> {
  ElevatedButton buildElevatedButton(
      BuildContext context, String text, Widget widget, Color color) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // ปรับความโค้งของปุ่ม
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
      // เพิ่มไอคอน
      label: Text(
        text,
        style: const TextStyle(
          fontFamily: 'ThaiLooped',
          fontSize: 30, // ปรับขนาดตัวอักษรให้พอดี
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เต้น',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 20.0, // ระยะห่างระหว่างปุ่มในแนวแกนหลัก
          padding: EdgeInsets.all(20.0),
          childAspectRatio: 5,
          children: [
            buildElevatedButton(
                context,
                'เพลง: หากพวกเรากำลังสบาย จงปรบมือพลัน 🎶',
                const MusicAWidget(),
                const Color(0xFF8470FF)),
            buildElevatedButton(context, 'เพลง: อะดิ่วดิวดิ๋ว 🎶',
                const MusicBWidget(), const Color(0xFFDA70D6)),
            buildElevatedButton(context, 'เพลง: โอ้ทะเลแสนงาม 🎶',
                const MusicCWidget(), const Color.fromARGB(255, 241, 51, 99)),
          ],
        ),
      ),
    );
  }
}

class MusicAWidget extends StatefulWidget {
  const MusicAWidget({Key? key}) : super(key: key);

  @override
  _MusicAWidgetState createState() => _MusicAWidgetState();
}

class _MusicAWidgetState extends State<MusicAWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/sound/dance/musicA.mp4');
    _initializeVideoPlayer = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เพลง: หากพวกเรากำลังสบาย จงปรบมือพลัน',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Youtube: MaMa TV Official',
                  style: TextStyle(
                    fontFamily: 'ThaiLooped',
                    fontSize: 12,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

        // ใช้ไอคอนแสดงสถานะของเสียง
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class MusicBWidget extends StatefulWidget {
  const MusicBWidget({Key? key}) : super(key: key);

  @override
  _MusicBWidgetState createState() => _MusicBWidgetState();
}

class _MusicBWidgetState extends State<MusicBWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/sound/dance/musicB.mp4');
    _initializeVideoPlayer = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เพลง: อะดิ่วดิวดิ๋ว',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Youtube: Kiddy Melody เพลงเด็กเจ้าตัวเล็ก',
                  style: TextStyle(
                    fontFamily: 'ThaiLooped',
                    fontSize: 12,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

        // ใช้ไอคอนแสดงสถานะของเสียง
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class MusicCWidget extends StatefulWidget {
  const MusicCWidget({Key? key}) : super(key: key);

  @override
  _MusicCWidgetState createState() => _MusicCWidgetState();
}

class _MusicCWidgetState extends State<MusicCWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;
  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/sound/dance/musicC.mp4');
    _initializeVideoPlayer = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เพลง: โอ้ทะเลแสนงาม',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Youtube: BalooMouse ช่องเพลงไทย-อังกฤษ สําหรับเด็กและครอบครัว',
                  style: TextStyle(
                    fontFamily: 'ThaiLooped',
                    fontSize: 12,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

        // ใช้ไอคอนแสดงสถานะของเสียง
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
