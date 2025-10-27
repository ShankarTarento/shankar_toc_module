import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toc_module/l10n/generated/toc_localizations.dart';

import 'package:toc_module/toc/constants/english_lang.dart';
import 'package:toc_module/toc/util/field_name_widget.dart';
import 'package:toc_module/toc/util/validations.dart';

class EditGroupDetails extends StatefulWidget {
  final ValueChanged<String> groupDetails;
  final bool isCadreProgram;

  const EditGroupDetails({
    Key? key,
    required this.groupDetails,
    required this.isCadreProgram,
  }) : super(key: key);

  @override
  State<EditGroupDetails> createState() => _EditGroupDetailsState();
}

class _EditGroupDetailsState extends State<EditGroupDetails> {
  String _groupKey = 'group';
  final TextEditingController _groupController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  @override
  void dispose() {
    super.dispose();
    _groupController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Group field
        FieldNameWidget(
          isMandatory: true,
          fieldName: TocLocalizations.of(context)!.mStaticGroup,
        ),
        SelectFromBottomSheet(
          fieldName: "Group",
          controller: _groupController,
          callBack: () {
            widget.groupDetails(_groupController.text);

            setState(() {});
          },
          parentContext: context,
          validator: (value) =>
              Validations.validateGroup(context: context, value: value ?? ''),
        ),
        widget.isCadreProgram
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0).r,
                child: Text(
                  TocLocalizations.of(context)!.mNoteForDoptBlendedProgramGroup,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  void _populateFields() async {
    // Fetching profile data and populating the fields
    Profile? profileDetails = Provider.of<ProfileRepository>(
      context,
      listen: false,
    ).profileDetails;
    List<dynamic> inReviewFields = Provider.of<ProfileRepository>(
      context,
      listen: false,
    ).inReview;

    dynamic inReviewGroup = inReviewFields.where(
      (element) => element.containsKey(_groupKey),
    );

    _groupController.text =
        (inReviewFields.isNotEmpty && inReviewGroup.isNotEmpty)
        ? inReviewGroup.first[_groupKey]
        : (profileDetails?.group ?? '');

    setState(() {});
  }
}
