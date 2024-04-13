part of 'channels_cubit.dart';

//All he states of Channels Screen
@immutable
abstract class ChannelsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChannelsInitial extends ChannelsState {}

class LoadingState extends ChannelsState {}

class ChannelsSuccess extends ChannelsState {}

class ChannelsFailed extends ChannelsState {
  final String? message;

  ChannelsFailed(this.message);
}
