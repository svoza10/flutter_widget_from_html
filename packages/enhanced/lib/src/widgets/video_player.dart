import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A video player.
class VideoPlayer extends StatefulWidget {
  /// The source URL.
  final String url;

  /// The initial aspect ratio.
  final double aspectRatio;

  /// Controls whether to resize automatically.
  ///
  /// Default: `true`.
  final bool autoResize;

  /// Controls whether to play video automatically.
  ///
  /// Default: `false`.
  final bool autoplay;

  /// Controls whether to show video controls.
  ///
  /// Default: `false`.
  final bool controls;

  /// Controls whether to play video in loops.
  ///
  /// Default: `false`.
  final bool loop;

  /// The widget to be shown before video is loaded.
  final Widget poster;

  /// Creates a player.
  VideoPlayer(
    this.url, {
    @required this.aspectRatio,
    this.autoResize = true,
    this.autoplay = false,
    this.controls = false,
    Key key,
    this.loop = false,
    this.poster,
  })  : assert(url != null),
        assert(aspectRatio != null),
        super(key: key);

  @override
  State<VideoPlayer> createState() =>
      (!kIsWeb && Platform.environment.containsKey('FLUTTER_TEST'))
          ? _VideoPlayerPlaceholder()
          : Container();
}

class _VideoPlayerPlaceholder extends State<VideoPlayer> {
  @override
  Widget build(BuildContext _) => AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Container(
        child: Center(child: Text('VideoPlayer')),
        color: Color.fromRGBO(0, 0, 0, .5),
      ));
}
