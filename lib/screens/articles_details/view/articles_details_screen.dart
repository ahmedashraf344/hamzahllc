part of '../articles_details_imports.dart';

class ArticlesDetailsScreen extends StatefulWidget {
  const ArticlesDetailsScreen({super.key, required this.data});

  final ArticlesModel data;

  @override
  State<ArticlesDetailsScreen> createState() => _ArticlesDetailsScreenState();
}

class _ArticlesDetailsScreenState extends State<ArticlesDetailsScreen> {
  final ArticlesDetailsViewModel viewModel = ArticlesDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Article Details',
          style: MyStyles.textStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        children: [
          CustomArticleCard(
            data: widget.data,
            showDetails: false,
          ),
          CustomButton(
            onTap: () {
              viewModel._launchArticleDetails(
                url: widget.data.webUrl ?? "",
              );
            },
            title: 'Read More',
            marginHorizontal: 20,
          ),
        ],
      ),
    );
  }
}
