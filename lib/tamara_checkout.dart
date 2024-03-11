library tamara_checkout;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TamaraCheckout extends StatefulWidget {
  final String checkoutUrl;
  final String successUrl;
  final String failUrl;
  final String cancelUrl;


  const TamaraCheckout(this.checkoutUrl, this.successUrl, this.failUrl, this.cancelUrl, {Key? key,
    this.onPaymentSuccess, this.onPaymentFailed, this.onPaymentCanceled}) : super(key: key);

  final void Function()? onPaymentSuccess;
  final void Function()? onPaymentFailed;
  final void Function()? onPaymentCanceled;
  // final TamaraInAppBrowser browser = TamaraInAppBrowser();

  @override
  _TamaraCheckoutState createState() => _TamaraCheckoutState();
}

class _TamaraCheckoutState extends State<TamaraCheckout> {

  // late InAppWebViewController _webViewController;
  WebViewController? _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller!..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            String url = request.url;
            if (url.startsWith(widget.successUrl)) {
              if (widget.onPaymentSuccess != null) {
                widget.onPaymentSuccess!();
                return NavigationDecision.prevent;
              }
            } else if (url.startsWith(widget.failUrl)) {
              if (widget.onPaymentFailed != null) {
                widget.onPaymentFailed!();
                return NavigationDecision.prevent;
              }
            } else if (url.startsWith(widget.cancelUrl)) {
              if (widget.onPaymentCanceled != null) {
                widget.onPaymentCanceled!();
                return NavigationDecision.prevent;
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return WebViewWidget(controller: _controller!);
    });
  }

}