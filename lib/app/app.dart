import 'package:flutter_list_pagination/services/comments/comments_service.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [],
  dependencies: [
    Singleton(classType: CommentsService),
  ],
  logger: StackedLogger(),
)
class AppRouter {}
