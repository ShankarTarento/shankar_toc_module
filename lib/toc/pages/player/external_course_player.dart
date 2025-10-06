import 'package:flutter/material.dart';
import 'package:toc_module/toc/constants/color_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExternalCoursePlayer extends StatefulWidget {
  final String url;
  final BuildContext? parentContext;
  const ExternalCoursePlayer({Key? key, required this.url, this.parentContext})
      : super(key: key);

  @override
  State<ExternalCoursePlayer> createState() => _ExternalCoursePlayerState();
}

class _ExternalCoursePlayerState extends State<ExternalCoursePlayer> {
  bool cookiesSet = false;
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {},
          onPageFinished: (String url) {
            double imageWidth = MediaQuery.of(context).size.width * 2;
            _webViewController.runJavaScript('''
              const svg = document.querySelector("svg");
              if (svg) {
                svg.setAttribute("width", "$imageWidth");
                svg.setAttribute("height", "500px");
              }
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: TocModuleColors.greys87,
        backgroundColor: TocModuleColors.appBarBackground,
        leading: InkWell(
          onTap: () => Navigator.of(widget.parentContext ?? context).pop(),
          child: const BackButton(color: TocModuleColors.greys60),
        ),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
