part of '../articles_imports.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final ArticlesViewModel viewModel = ArticlesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel._restoreSecureData();
    viewModel._fetchArticles(context);
    viewModel.setupBackgroundTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BlocBuilder<GenericCubit<String>, GenericState<String>>(
          bloc: viewModel._userEmailCubit,
          builder: (context, state) {
            return CustomText(
              title:
                  'Welcome Back (${state is GenericUpdateState ? state.data : ''})',
              style: MyStyles.textStyle(
                fontSize: 17,
              ),
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () => viewModel._logoutButtonAction(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: const Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GenericCubit<List<ArticlesModel>>,
          GenericState<List<ArticlesModel>>>(
        bloc: viewModel._articlesCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return Scrollbar(
              child: CustomRefreshIndicator(
                refresh: () => viewModel._fetchArticles(context),
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return CustomAnimation(
                      index: index,
                      child: CustomArticleCard(
                        data: state.data[index],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return viewModel._alertService.showLoadingView(context);
          }
        },
      ),
    );
  }
}
