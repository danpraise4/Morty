// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:sinnts/features/post/data/models/post.dart';
// import 'package:sinnts/features/scene/app/utils/utils.dart';
// import 'package:sinnts/core/widgets/app_loading_view.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'package:sinnts/core/helpers/helpers.dart';
// import 'package:sinnts/core/resources/enum.dart';
// import 'package:provider/provider.dart';
// import '../helpers/response_state.dart';
// import 'package:flutter/material.dart';
// import '../resources/strings.dart';
// import 'package:dio/dio.dart';
// import 'dart:io';

// class ImageView extends StatefulWidget {
//   const ImageView({super.key, required this.post});

//   final Post post;

//   @override
//   State<ImageView> createState() => _ImageViewState();
// }

// class _ImageViewState extends State<ImageView> {
//   final VideoImageThumbnailProvider _provider = VideoImageThumbnailProvider();

//   @override
//   void initState() {
//     super.initState();
//     getThumbnail();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final thumbnail = getPostThumnbailUrl(widget.post);
//     if (thumbnail.isNotEmpty && !thumbnail.endsWith('mp4')) {
//       return CachedNetworkImage(
//         imageUrl: thumbnail,
//         fit: BoxFit.cover,
//         placeholder: (context, url) => const Center(
//           child: LoadingView(
//             size: 50,
//           ),
//         ),
//         errorWidget: (context, url, error) {
//           return Center(
//             child: GestureDetector(
//               onTap: () => setState(() {}),
//               child: const Icon(
//                 Icons.refresh,
//                 size: 20,
//               ),
//             ),
//           );
//         },
//       );
//     }
//     return ChangeNotifierProvider(
//       create: (_) => _provider,
//       child: Consumer<VideoImageThumbnailProvider>(
//           builder: (context, provider, child) {
//         final thumbnail = provider._thumbnailData;
//         final error = provider.errorData;

//         if (error != null) {
//           return Center(
//             child: IconButton(
//               onPressed: () => getThumbnail(forced: true),
//               icon: const Icon(
//                 Icons.warning_amber_rounded,
//               ),
//             ),
//           );
//         }

//         if (thumbnail != null) {
//           return SizedBox(
//             child: Image.file(
//               File(thumbnail),
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Center(
//                   child: IconButton(
//                     onPressed: () => getThumbnail(forced: true),
//                     icon: const Icon(
//                       Icons.warning_amber_rounded,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }

//         return const Center(
//           child: LoadingView(
//             size: 60,
//           ),
//         );
//       }),
//     );
//   }

//   Future<void> getThumbnail({bool forced = false}) async {
//     try {
//       // loading = true;
//       // Fetch video thumbnail
//       final url = getPostUrl(widget.post);
//       if (url != null) {
//         if (getPostMediaType(widget.post) == MediaType.video) {
//           final fileName = url.split('/').last;
//           final downloadPath =
//               '$cacheThumbDirPath/${fileName.substring(0, fileName.length - 4)}.jpg';

//           if (!videoFile(url).existsSync() || forced) {
//             final path = await VideoThumbnail.thumbnailFile(
//               thumbnailPath: downloadPath,
//               video: url,
//               imageFormat: ImageFormat.JPEG,
//             );

//             // Notify provider of this update
//             _provider.setThumbnailData(path);
//           } else {
//             _provider.setThumbnailData(downloadPath);
//           }
//         }

//         // Download Image
//         else if (getPostMediaType(widget.post) == MediaType.image) {
//           // final url = getPostUrl(widget.post);

//           final fileName = url.split('/').last;
//           final path =
//               '$cacheThumbDirPath/${fileName.substring(0, fileName.length - 4)}.jpg';

//           if (!thumbnailFile(url).existsSync() || forced) {
//             final res = await Dio().download(url, path);

//             if (responseState(res.statusCode)) {
//               // Notify provider of this update
//               _provider.setThumbnailData(path);
//             } else {
//               // Notify provider of this error
//               _provider.setErrorData('Could not download image');
//             }
//           } else {
//             _provider.setThumbnailData(path);
//           }
//         }
//       }

//       // loading = false;
//     } catch (e) {
//       // Notify provider of this error
//       _provider.setErrorData('Error getting thumbnail');

//       pp(e);
//     }
//   }
// }

// class VideoImageThumbnailProvider extends ChangeNotifier {
//   String? _thumbnailData;
//   String? _errorMessage;

//   String? get thumbnailData => _thumbnailData;
//   String? get errorData => _errorMessage;

//   void setThumbnailData(String? data) {
//     _thumbnailData = data;
//     _errorMessage = null;
//     notifyListeners();
//   }

//   void setErrorData(String? error) {
//     _thumbnailData = null;
//     _errorMessage = error;
//     notifyListeners();
//   }
// }
