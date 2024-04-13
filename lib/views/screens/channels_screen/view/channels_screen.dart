import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniqcastassignment/utils/constants/api_constants.dart';

import 'package:uniqcastassignment/utils/app_messages.dart';
import 'package:uniqcastassignment/utils/constants/app_constants.dart';
import 'package:uniqcastassignment/utils/extension.dart';
import 'package:uniqcastassignment/utils/globals.dart';
import 'package:uniqcastassignment/views/screens/channels_screen/cubit/channels_cubit.dart';
import 'package:uniqcastassignment/views/screens/video_player_screen/video_player_widget.dart';

import 'package:uniqcastassignment/views/widgets/loading_screen_view.dart';
import 'package:uniqcastassignment/views/widgets/network_image_view.dart';

class ChannelsScreen extends StatelessWidget {
  const ChannelsScreen({super.key});
// Open Video Player Screen
  void _openVideoPlayerScreen(BuildContext context, String videoUrl) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoPlayerWidget(
                  videoUrl: videoUrl,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: hideKeyBoard,
        child: BlocProvider(
          create: (context) => ChannelsCubit()..fetchPackages(),
          child: BlocConsumer<ChannelsCubit, ChannelsState>(
            listener: (context, state) {
              if (state is ChannelsFailed) {
                AppMessages.showErrorSnackBar(state.message);
              }
            },
            builder: (context, state) {
              final ChannelsCubit channelsCubit =
                  BlocProvider.of<ChannelsCubit>(context);
              return LoadingScreenView(
                isLoading: state is LoadingState,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          20.height,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppConstants.channels,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: channelsCubit.channels.length,
                              itemBuilder: (context, index) {
                                final channel = channelsCubit.channels[index];

                                return GestureDetector(
                                  onTap: () {
                                    var url =
                                        channelsCubit.decodeBase64StreamUrl(
                                            AppConstants.base64UrlStrings);
                                    _openVideoPlayerScreen(context, url);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        border: Border.all(
                                            color:
                                                Colors.purpleAccent.shade100),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: screenSize.width * .2,
                                          height: screenSize.width * .2,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: NetworkImageView(
                                              ApiConstants.fetchImageUrl(
                                                  channel.id.toString())),
                                        ),
                                        10.width,
                                        Expanded(
                                            child: Text(
                                                channel.name?.toUpperCase() ??
                                                    "")),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
