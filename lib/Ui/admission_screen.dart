import 'package:eductrl/Common/CommonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdmissionScreen extends StatefulWidget {
  @override
  _AdmissionScreenState createState() => _AdmissionScreenState();
}

class _AdmissionScreenState extends State<AdmissionScreen> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize the WebViewController only once
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enables JavaScript
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });

            _controller.runJavaScript(
              """
              (function() {
                const hideElements = () => {
                  const topBar = document.querySelector('.elementor'); // Replace with the actual class of the top bar
                  const bottomBar = document.querySelector('.elementor-element-98c0f02'); // Replace with the actual class of the bottom bar
                  const bottomBarNew = document.querySelector('.tp-footer-5-bottom'); // Replace with the actual class of the bottom bar
                  if (topBar) topBar.style.display = 'none';
                  if (bottomBar) bottomBar.style.display = 'none';
                  if (bottomBarNew) bottomBarNew.style.display = 'none';
                };
                hideElements();
              })();
              """,
            );
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://www.trencher.ai/gradai'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          await _controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Admission",
          showBackButton: true,
          actions: [],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: _controller),
              if (isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
