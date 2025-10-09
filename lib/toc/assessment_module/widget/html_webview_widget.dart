import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'package:toc_module/toc/assessment_module/widget/audio_video_webView.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:toc_module/toc/helper/toc_helper.dart';

class HtmlWebviewWidget extends StatefulWidget {
  final String htmlText;
  final TextStyle? textStyle;

  const HtmlWebviewWidget({super.key, required this.htmlText, this.textStyle});
  @override
  State<HtmlWebviewWidget> createState() => _HtmlWebviewWidgetState();
}

class _HtmlWebviewWidgetState extends State<HtmlWebviewWidget> {
  bool isHTMLVideo = false;
  List<Widget> contentWidgets = <Widget>[];
  bool isAudioOrVideo = false;
  bool isAudio = false, isVideo = false;

  @override
  void initState() {
    super.initState();
    isAudioOrVideo =
        TocHelper.isHtml(widget.htmlText) && iSAudioOrVideoContent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HtmlWebviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.htmlText != widget.htmlText) {
      setState(() {
        isAudioOrVideo = false;
        isAudioOrVideo =
            TocHelper.isHtml(widget.htmlText) && iSAudioOrVideoContent();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isAudioOrVideo
        ? AudioVideoWebView(
            htmlText: widget.htmlText, isAudio: isAudio, isVideo: isVideo)
        : HtmlWidget(
            TocHelper.decodeHtmlEntities(widget.htmlText),
            textStyle: widget.textStyle ??
                GoogleFonts.lato(
                    color: TocModuleColors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0.sp,
                    height: 1.5),
            customStylesBuilder: (element) {
              if (element.localName == 'strong') {
                return {'font-weight': 'bold'};
              }
              return null;
            },
          );
  }

  bool iSAudioOrVideoContent() {
    final document = html_parser.parse(widget.htmlText);
    bool isAudioOrVideo = false;

    void processNode(dom.Node node) {
      if (node is dom.Element) {
        print(node.localName);
        if (node.localName == 'video') {
          isVideo = true;
          isAudioOrVideo = true;
        } else if (node.localName == 'audio') {
          isAudio = true;
          isAudioOrVideo = true;
        } else {
          for (int i = 0; i < node.nodes.length; i++) {
            if (node.nodes[i] is dom.Element) {
              dom.Element element = node.nodes[i] as dom.Element;
              if (element.localName == 'video') {
                isVideo = true;
                isAudioOrVideo = true;
                break;
              } else if (element.localName == 'audio') {
                isAudio = true;
                isAudioOrVideo = true;
                break;
              } else {
                for (int index = 0; index < element.nodes.length; index++) {
                  processNode(element.nodes[index]);
                }
              }
            }
          }
        }
      }
    }

    document.body!.nodes.forEach(processNode);
    return isAudioOrVideo;
  }
}
