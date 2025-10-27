import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/model/course_model.dart';
import 'package:toc_module/toc/model/review_rating.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/repository/review_rating_repository.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/review_card.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/review_card_skeleton.dart';
import 'package:toc_module/toc/pages/about_tab/widgets/review_rating/widgets/review_filter.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

class ViewAllReviews extends StatefulWidget {
  final Course course;

  const ViewAllReviews({Key? key, required this.course}) : super(key: key);

  @override
  State<ViewAllReviews> createState() => _ViewAllReviewsState();
}

class _ViewAllReviewsState extends State<ViewAllReviews> {
  final ReviewRatingRepository reviewRatingRepository =
      ReviewRatingRepository();
  int dropdownValue = 1;
  int limit = 30;

  List<TopReview> topReviews = [];
  List<TopReview> filteredTopReviews = [];
  OverallRating? overallRating;
  List<Review> latestReviews = [];
  List<Review> filteredLatestReviews = [];
  final ScrollController scrollController = ScrollController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    getReviews();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        limit += 30;
      });
      _loadMoreReviews();
    }
  }

  Future<void> _loadMoreReviews() async {
    if (dropdownValue == 0) {
      final response = await reviewRatingRepository.getCourseReview(
        courseId: widget.course.id,
        primaryCategory: widget.course.courseCategory,
        limit: limit,
      );
      setState(() {
        topReviews = response;
        filteredTopReviews = topReviews;
      });
    }
  }

  void _filterLatestReviews(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLatestReviews = latestReviews;
      } else {
        filteredLatestReviews = latestReviews
            .where(
              (review) =>
                  review.review != null &&
                  review.review!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _filterTopReviews(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTopReviews = topReviews;
      } else {
        filteredTopReviews = topReviews
            .where(
              (review) =>
                  review.review != null &&
                  review.review!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  Future<void> getReviews() async {
    isLoading.value = true;
    if (dropdownValue == 0) {
      final response = await reviewRatingRepository.getCourseReview(
        courseId: widget.course.id,
        primaryCategory: widget.course.courseCategory,
        limit: limit,
      );
      setState(() {
        topReviews = response;
        filteredTopReviews = topReviews;
      });
    } else if (dropdownValue == 1) {
      final summary = await reviewRatingRepository.getCourseReviewSummary(
        courseId: widget.course.id,
        primaryCategory: widget.course.courseCategory,
      );
      setState(() {
        overallRating = summary;
        latestReviews = summary.reviews ?? [];
        filteredLatestReviews = latestReviews;
      });
    }
    isLoading.value = false;
  }

  void _showReviewFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ReviewFilter(
          selectedIndex: dropdownValue,
          onChanged: (index) {
            setState(() {
              dropdownValue = index;
              limit = 30;
            });
            getReviews();
          },
        );
      },
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: Container(
        color: TocModuleColors.appBarBackground,
        margin: EdgeInsets.only(top: 16).r,
        height: 48.w,
        child: TextFormField(
          onChanged: (value) {
            if (dropdownValue == 0) {
              _filterTopReviews(value);
            } else {
              _filterLatestReviews(value);
            }
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: GoogleFonts.lato(fontSize: 14.0.sp),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 10.0).r,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0).r,
              borderSide: BorderSide(
                color: TocModuleColors.grey16,
                width: 1.0.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.0).r,
              borderSide: BorderSide(color: TocModuleColors.primaryThree),
            ),
            hintText: TocLocalizations.of(context)!.mStaticSearch,
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            counterStyle: TextStyle(height: double.minPositive.w),
            counterText: '',
          ),
        ),
      ),
    );
  }

  Widget _buildReviewList() {
    final isTopReview = dropdownValue == 0;
    final noReviews = isTopReview
        ? filteredTopReviews.isEmpty
        : filteredLatestReviews.isEmpty;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: noReviews
          ? 1
          : isTopReview
          ? filteredTopReviews.length
          : filteredLatestReviews.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 10.w, color: TocModuleColors.grey16, thickness: 1.w),
      itemBuilder: (BuildContext context, int index) {
        if (noReviews) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0).r,
            child: Center(
              child: Text(
                TocLocalizations.of(context)!.mStaticNoReviewsToShow,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isTopReview ? TocModuleColors.grey84 : null,
                ),
              ),
            ),
          );
        }
        if (isTopReview) {
          final review = filteredTopReviews[index];
          return ReviewCard(
            name: review.firstName ?? '',
            rating: review.rating ?? '',
            review: review.review ?? '',
            time: review.updatedOn ?? '',
          );
        } else {
          final review = filteredLatestReviews[index];
          return ReviewCard(
            review: review.review ?? '',
            time: review.date.toString(),
            rating: review.rating.toString(),
            name: review.firstName ?? '',
          );
        }
      },
    );
  }

  Widget _buildSkeletonList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 10.w, color: TocModuleColors.grey16, thickness: 1.w),
      itemBuilder: (BuildContext context, int index) {
        return ReviewCardSkeleton();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.chevron_left),
        ),
        iconTheme: IconThemeData(color: TocModuleColors.greys60),
        shadowColor: TocModuleColors.appBarBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dropdownValue == 0
                        ? TocLocalizations.of(context)!.mStaticLatestReviews
                        : TocLocalizations.of(context)!.mStaticTopReviews,
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      _buildSearchField(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0).r,
                        child: IconButton(
                          onPressed: _showReviewFilterBottomSheet,
                          icon: Icon(
                            Icons.filter_list,
                            color: TocModuleColors.greys60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (context, loading, child) {
                if (loading) {
                  return _buildSkeletonList();
                } else {
                  return _buildReviewList();
                }
              },
            ),
            SizedBox(height: 30.w),
          ],
        ),
      ),
    );
  }
}
