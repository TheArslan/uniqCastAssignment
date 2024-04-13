import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniqcastassignment/models/data_models/channel.dart';
import 'package:uniqcastassignment/models/data_models/packages.dart';

import 'package:uniqcastassignment/resources/repository.dart';
import 'package:uniqcastassignment/utils/globals.dart';

part 'channels_state.dart';

// cubit class for channels
class ChannelsCubit extends Cubit<ChannelsState> {
  ChannelsCubit() : super(ChannelsInitial());
  final List<Channel> channels = [];
  final Repository _repository = Repository();
// fetching funcion of packages
  Future<void> fetchPackages() async {
    try {
      emit(LoadingState());

      final apiResponse = await _repository.fetchPackages();
      if (isApiSuccess(apiResponse)) {
        // After succesfully fetching of packages channels will be fetched on behalf of packages ids
        fetchChannels(apiResponse.packages ?? []);
      } else {
        emit(ChannelsFailed(apiResponse.message));
      }
    } catch (e) {
      emit(ChannelsFailed(e.toString()));
    }
  }

//fetching function of channels
  Future<void> fetchChannels(List<Package> packages) async {
    try {
      final apiResponse = await _repository.fetchChannels(packages);

      if (isApiSuccess(apiResponse)) {
        channels.addAll(apiResponse.channels ?? []);
        emit(ChannelsSuccess());
      } else {
        emit(ChannelsFailed(apiResponse.message));
      }
    } catch (e) {
      emit(ChannelsFailed(e.toString()));
    }
  }

// decoding function base64 url String
  String decodeBase64StreamUrl(String base64EncodedString) {
    int padding = 4 - base64EncodedString.length % 4;
    String paddedString =
        base64EncodedString + List.filled(padding, '=').join('');
    final decodedBytes = base64Decode(paddedString);
    final streamUrl = utf8.decode(decodedBytes);
    return streamUrl;
  }
}
