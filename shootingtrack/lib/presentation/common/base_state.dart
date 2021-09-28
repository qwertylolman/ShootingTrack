abstract class BaseState {}

abstract class ErrorState extends BaseState {
  Object get error;
}

abstract class LoadingState extends BaseState {}

abstract class EmptyState extends BaseState {}

abstract class SuccessFeedState extends BaseState {
  int get itemsCount;

  List<Object> get items;
}
