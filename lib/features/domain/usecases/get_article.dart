import 'package:journal/core/resources/data_state.dart';
import 'package:journal/core/usecases/usecase.dart';
import 'package:journal/features/domain/entities/aticle.dart';
import 'package:journal/features/domain/repos/article_repo.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  GetArticleUseCase({required this.articleRepo});

  final ArticleRepo articleRepo;

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepo.getNewsArticles();
  }
}
