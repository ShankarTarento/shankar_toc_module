import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igot_ui_components/utils/module_colors.dart';
import 'package:toc_module/toc/model/course_hierarchy_model.dart';
import 'package:toc_module/toc/model/navigation_model.dart';

import 'package:toc_module/toc/util/page_loader.dart';

class ContentFeedback extends StatefulWidget {
  final String surveyUrl;
  final String surveyName;
  final CourseHierarchyModel course;
  final String identifier;
  final String batchId;
  final updateContentProgress;
  final String parentCourseId;
  final ValueChanged<bool> playNextResource;
  final resourceNavigateItems;
  final bool isFeaturedCourse;
  final bool? isPreRequisite;
  final String language;
  ContentFeedback(this.surveyUrl, this.surveyName, this.course, this.identifier,
      this.batchId,
      {this.updateContentProgress,
      required this.parentCourseId,
      required this.playNextResource,
      this.resourceNavigateItems,
      required this.isFeaturedCourse,
      this.isPreRequisite = false,
      required this.language});

  @override
  _ContentFeedbackState createState() {
    return _ContentFeedbackState();
  }
}

class _ContentFeedbackState extends State<ContentFeedback> {
  final MicroSurveyService microSurveyService = MicroSurveyService();
  Map? _microSurvey;
  int i = 1;
  bool _isPageInitialized = false;
  Future<Map?>? _microSurveyFuture;

  @override
  void initState() {
    _microSurveyFuture = _getMicroSurveys();
    super.initState();
  }

  Future<NavigationModel?> fetchData() async {
    NavigationModel? resourceInfo = await TocHelper.getResourceInfo(
        context: context,
        resourceId: widget.identifier,
        isFeatured: widget.isFeaturedCourse,
        resourceNavigateItems: widget.resourceNavigateItems);
    return resourceInfo;
  }

  Future<Map?> _getMicroSurveys() async {
    if (!_isPageInitialized) {
      String id = '';
      if (widget.isPreRequisite == true) {
        final NavigationModel? resourceInfo = await fetchData();
        final artifactUrl = resourceInfo?.artifactUrl;
        if (artifactUrl != null && artifactUrl.isNotEmpty) {
          id = artifactUrl.split('/').last;
        }
      } else {
        id = widget.surveyUrl.split('/').last;
      }
      _microSurvey = await microSurveyService.getMicroSurveyDetails(id,
          isContentFeedback: true);

      setState(() {
        _isPageInitialized = true;
      });
    }
    return _microSurvey;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _microSurveyFuture,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data != null) {
            return snapshot.data!['clientVersion'].toString() == "1.1"
                ? SurveyPageV2(
                    playNextResource: widget.playNextResource,
                    course: widget.course,
                    microSurvey: snapshot.data!['raw'],
                    surveyName: widget.surveyName,
                    identifier: widget.identifier,
                    batchId: widget.batchId,
                    updateContentProgress: widget.updateContentProgress,
                    parentCourseId: widget.parentCourseId,
                    isPreRequisite: widget.isPreRequisite,
                    language: widget.language)
                : SurveyPage(_microSurvey, widget.surveyName, widget.course,
                    widget.identifier, widget.batchId,
                    updateContentProgress: widget.updateContentProgress,
                    parentCourseId: widget.parentCourseId,
                    playNextResource: widget.playNextResource,
                    isPreRequisite: widget.isPreRequisite,
                    language: widget.language);
          } else {
            return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: ModuleColors.greys87,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 0).r,
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                body: PageLoader());
          }
        });
  }
}
