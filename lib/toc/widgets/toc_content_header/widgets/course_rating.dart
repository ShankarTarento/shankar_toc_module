import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:igot_ui_components/utils/fade_route.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/widgets/toc_content_header/widgets/course_rating_submitted.dart';

class CourseRating extends StatefulWidget {
  final String title;
  final String id;
  final String primaryType;
  final yourReview;
  final parentAction;
  final ValueChanged? onSubmitted;
  final bool isFromContentPlayer;
  CourseRating(
    this.title,
    this.id,
    this.primaryType,
    this.yourReview, {
    this.parentAction,
    this.isFromContentPlayer = false,
    this.onSubmitted,
  });
  @override
  _CourseRatingState createState() => _CourseRatingState();
}

class _CourseRatingState extends State<CourseRating> {
  final LearnService learnService = LearnService();
  final _textController = TextEditingController();
  double? _rating;
  double? _previousRating;
  String? _comment;
  bool _hasChanged = false;

  FocusNode? myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    _getYourRatingAndReview();
  }

  _getYourRatingAndReview() async {
    if (widget.yourReview != null) {
      setState(() {
        _rating = widget.yourReview.first['rating'];
        _previousRating = widget.yourReview.first['rating'];
        _comment = widget.yourReview.first['review'];
        _textController.text = widget.yourReview.first['review'] ?? '';
      });
    }
  }

  _saveRatingAndReview(id, type, rating, comment, context) async {
    Response response = await learnService.postCourseReview(
      id,
      type,
      rating,
      comment,
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        FadeRoute(
          page: CourseRatingSubmitted(
            title: widget.title,
            courseId: widget.id,
            primaryCategory: widget.primaryType,
          ),
        ),
      );
      widget.onSubmitted!(true);
      if (!widget.isFromContentPlayer) {
        //   widget.parentAction(true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(jsonDecode(response.body)['params']['errmsg']),
          backgroundColor: ModuleColors.negativeLight,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode?.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ModuleColors.appBarBackground,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.clear, color: ModuleColors.greys60),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.montserrat(
            color: ModuleColors.greys87,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        // centerTitle: true,
      ),

      // Tab controller
      body: SingleChildScrollView(
        child: Container(
          height: 1.sh,
          padding: const EdgeInsets.all(20).r,
          color: ModuleColors.lightBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20).r,
                child: Text(
                  TocLocalizations.of(context)!.mCommonrateReview,
                  style: GoogleFonts.lato(
                    color: ModuleColors.greys87,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10).r,
                child: Text(
                  TocLocalizations.of(
                    context,
                  )!.mCommonyourReviewFeedbackValuable,
                  style: GoogleFonts.lato(
                    color: ModuleColors.greys60,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30).r,
                child: Text(
                  '${TocLocalizations.of(context)!.mLearnRateThis} ${widget.primaryType.toLowerCase()}',
                  style: GoogleFonts.lato(
                    color: ModuleColors.greys87,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10).r,
                child: Column(
                  children: [
                    RatingBar.builder(
                      unratedColor: ModuleColors.grey16,
                      initialRating: _rating != null ? _rating! : 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 50,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0).r,
                      itemBuilder: (context, _) => Icon(
                        Icons.star_rounded,
                        color: ModuleColors.ratedColor,
                      ),
                      onRatingUpdate: (rating) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (rating != _previousRating) {
                            setState(() {
                              _hasChanged = true;
                              _rating = rating;
                            });
                          }
                          if (rating == _previousRating) {
                            setState(() {
                              _hasChanged = false;
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              _rating != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30).r,
                          child: Text(
                            TocLocalizations.of(context)!.mCommongiveReview,
                            style: GoogleFonts.lato(
                              color: ModuleColors.greys87,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          height: 150.w,
                          width: 1.sw,
                          margin: const EdgeInsets.only(top: 16).r,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ).r,
                          child: TextField(
                            // autofocus: true,
                            focusNode: myFocusNode,
                            // keyboardType: TextInputType.multiline,
                            controller: _textController,
                            maxLength: 200,
                            maxLines: 5,

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  '${TocLocalizations.of(context)!.mCommonaddReview} ${widget.primaryType.toLowerCase()} (${TocLocalizations.of(context)!.mCommonOptional})',
                            ),
                            onChanged: (value) {
                              if (_comment != _textController.text) {
                                setState(() {
                                  _hasChanged = true;
                                });
                              } else {
                                setState(() {
                                  _hasChanged = false;
                                });
                              }
                            },
                            // onTap: () {
                            // },
                          ),
                          decoration: BoxDecoration(
                            color: ModuleColors.appBarBackground,
                            border: Border.all(color: ModuleColors.grey16),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5),
                        //   child: Text(
                        //     '${_textController.text.length}/200',
                        //     style: GoogleFonts.lato(
                        //       color: ModuleColors.greys60,
                        //       fontSize: 12.0,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  : Center(),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10).r,
          decoration: BoxDecoration(
            color: ModuleColors.appBarBackground,
            boxShadow: [
              BoxShadow(
                color: ModuleColors.grey08,
                blurRadius: 6.0.r,
                spreadRadius: 0.r,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: ScaffoldMessenger(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: _hasChanged && _rating != null ? 1 : 0.35,
                  child: TextButton(
                    onPressed: _hasChanged && _rating != null
                        ? () {
                            _saveRatingAndReview(
                              widget.id,
                              widget.primaryType,
                              _rating,
                              _textController.text,
                              context,
                            );
                          }
                        : null,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15).r,
                      backgroundColor: ModuleColors.darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4).w,
                        side: BorderSide(color: ModuleColors.grey16),
                      ),
                    ),
                    child: Text(
                      TocLocalizations.of(context)!.mStaticSubmit,
                      style: GoogleFonts.lato(
                        color: ModuleColors.appBarBackground,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
