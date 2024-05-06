part of "../widgets_imports.dart";

class CustomArticleCard extends StatelessWidget {
  const CustomArticleCard({
    super.key,
    required this.data,
    this.showDetails = true,
  });

  final bool showDetails;
  final ArticlesModel data;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (data.multimedia != null && data.multimedia!.isNotEmpty) {
      imageUrl = data.multimedia![0].url ?? '';
    }
    final String heroTag =
        'article-hero-${data.id}'; // Assuming 'id' is a property of ArticlesModel

    return Padding(
      padding: const EdgeInsets.all(10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!showDetails)
            ClipRRect(
              borderRadius: MyStyles.borderRadius(radius: 5),
              child: Hero(
                tag: heroTag,
                child: FlexibleNetworkImage(
                  url: AppUtils.fullImageUrl(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Hero(
              tag: heroTag,
              child: CustomNetworkImage(
                url: AppUtils.fullImageUrl(imageUrl),
                fit: BoxFit.cover,
                height: 180.h,
                borderRadius: MyStyles.borderRadius(radius: 5),
              ),
            ),
          10.verticalSpace,
          CustomText(
            title: data.headline?.main ?? "",
            style: MyStyles.textStyle(
              color: Colors.black,
            ),
          ),
          10.verticalSpace,
          CustomText(
            title: data.abstract ?? "",
            style: MyStyles.textStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            maxLines: showDetails ? 1 : null,
          ),
          15.verticalSpace,
          Visibility(
            visible: showDetails,
            replacement: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      title: data.byline?.original ?? "",
                      style: MyStyles.textStyle(
                        color: Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      title: AppUtils.formatDate(data.pubDate ?? ""),
                      style: MyStyles.textStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                locator<NavigationService>().push(
                  context,
                  path: MyRoutes.articlesDetails,
                  queryParameters:
                      MyRoutesQuery.articlesDetailsQuery(data: data),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ).r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: MyStyles.borderRadius(
                        radius: 5,
                      ),
                    ),
                    child: CustomText(
                      title: 'Show Details',
                      style: MyStyles.textStyle(
                        fontSize: 11,
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
          const Divider(),
        ],
      ),
    );
  }
}
