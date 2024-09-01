// import 'dart:io';
// import 'dart:developer';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import '../storage/storage.dart';
// import 'package:flutter/material.dart';
// import 'package:sinnts/core/resources/enum.dart';
// import 'package:sinnts/core/storage/database.dart';
// import 'package:sinnts/core/resources/strings.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:sinnts/core/widgets/app_loading_view.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class CachedMediaThumbnail extends StatelessWidget {
//   final String url;
//   final MediaType type;

//   /// Download and cache media files for offline
//   /// access and smooth operation
//   const CachedMediaThumbnail({
//     super.key,
//     required this.url,
//     this.type = MediaType.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final files = Directory(cacheThumbDirPath).listSync();
//     List<String> fileNames = files.map((e) => e.path.split('/').last).toList();

//     if (fileNames.contains(fileName)) {
//       return SizedBox.expand(
//         child: Image.memory(
//           File('$cacheThumbDirPath/$fileName').readAsBytesSync(),
//           gaplessPlayback: true,
//           fit: BoxFit.cover,
//         ),
//       );
//     } else {
//       return FutureBuilder(
//         future: processMedia(url),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return SizedBox(
//               child: Text('${snapshot.error}'),
//             );
//           }

//           if (snapshot.hasData) {
//             Uint8List? data;

//             try {
//               data = File('$cacheThumbDirPath/$fileName').readAsBytesSync();
//             } catch (e) {
//               processMedia(url);
//             }

//             if (data != null) {
//               return SizedBox.expand(
//                 child: Image.memory(
//                   data,
//                   errorBuilder: (context, error, stackTrace) {
//                     return SizedBox.expand(
//                       child: CachedNetworkImage(
//                         imageUrl: url,
//                         fit: BoxFit.cover,
//                         placeholderFadeInDuration: 400.microseconds,
//                         fadeInDuration: 300.ms,
//                       ),
//                     );
//                   },
//                   gaplessPlayback: true,
//                   fit: BoxFit.cover,
//                 ),
//               );
//             } else {}
//           }

//           return const Center(
//             child: SizedBox.square(
//               dimension: 160,
//               child: LoadingView(
//                 size: 80,
//               ),
//             ),
//           );
//         },
//       );
//     }
//   }

//   String get fileName {
//     // Get file name from url
//     final fileName = url.split('/').last;
//     return '${fileName.substring(0, fileName.length - 4)}.jpg';
//   }

//   Future<String?> processMedia(String url) async {
//     if (type == MediaType.image) {
//       await downloadCacheImageThumb(url);
//       return '$cacheThumbDirPath/$fileName';
//     } else if (type == MediaType.video) {
//       await downloadCacheVideoThumb(url);
//       return '$cacheThumbDirPath/$fileName';
//     }
//     return null;
//   }

//   Future<String?> downloadCacheImageThumb(String url) async {
//     try {
//       // Get file name from url
//       final fileName = url.split('/').last;
//       final path =
//           '$cacheThumbDirPath/${fileName.substring(0, fileName.length - 4)}.jpg';
//       //Initialize the dio package
//       final Dio dio = Dio();
//       // Download file using the dio package
//       await dio.download(url, path);

//       setStorage(key: DB.CACHE, value: path);
//       return path;
//     } catch (e) {
//       log('$e');

//       //Nothing to throw
//       return null;
//     }
//   }

//   Future<String?> downloadCacheVideoThumb(String url) async {
//     try {
//       // Get file name from url
//       final fileName = url.split('/').last;
//       final path =
//           '$cacheThumbDirPath/${fileName.substring(0, fileName.length - 4)}.jpg';
//       // Get thumbnail of video file
//       final videoPath = await VideoThumbnail.thumbnailFile(
//         video: url,
//         thumbnailPath: path,
//         imageFormat: ImageFormat.JPEG,
//         quality: 50,
//       );

//       setStorage(key: DB.CACHE, value: videoPath);
//       return videoPath;
//     } catch (e) {
//       // pp(e);
//       return null;
//     }
//   }
// }
