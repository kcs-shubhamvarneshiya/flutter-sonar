import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import '../../common_widgets/custom_header.dart';
import '../../common_widgets/custome_page.dart';
import '../../utils/iconpath.dart';
import '../bloc/webView/webPageErrorBloc.dart';
import '../bloc/webView/webView_event.dart';
import '../bloc/webView/webView_state.dart';

@RoutePage()
class MoreDetails extends StatefulWidget {
  const MoreDetails({
    Key? key,
    required this.url,
    required this.pageName,
  }) : super(key: key);
  final String url;
  final String pageName;

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  Widget? displayWidget;
  String? getPageURL;
  bool isLoading = true;
  late WebViewErrorBloc webViewErrorBloc;
  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    webViewErrorBloc = GetIt.I<WebViewErrorBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      webViewErrorBloc.add(const WebViewClickEvent(false,""));
    });
  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus = context.watch<WebViewErrorBloc>().iConnectionStatus;
    return Scaffold(
      appBar:CustomHeader(
        title: widget.pageName,
        redirectToHome: false,
      ),
      body: Column(
        children: [
          //const Divider(color: ColorPath.redColor, height: 1, thickness: 1),
          Expanded(
            child:connectionStatus!.connect ?
             BlocBuilder<WebViewErrorBloc, WebViewState>(
                  bloc:webViewErrorBloc, builder: (context, state){
                  state.when(
                    webViewInitialState: () {
                      displayWidget = const Center(
                          child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: ColorPath.primaryColor,
                        ),
                      )
                      );
                    },
                    webViewClickState: (isError,errorCode){
                      print("State value: ${isError}");
                      if (isError){
                        errorCode == "-2" ? displayWidget = Center(
                          child: CustomPage(
                            imageName: IconPaths.noInternetIcon,
                            btnTitle: tryAgainMessage,
                            description: noInternetMessage,
                            onTap: () {
                              webViewErrorBloc.add(const WebViewClickEvent(false,""));
                            },
                          ),
                        ) :displayWidget =Center(
                          child: CustomPage(
                            imageName: IconPaths.siteNotReachIcon,
                            btnTitle: tryAgainMessage,
                            description: siteNotReachMessage,
                            onTap: () {
                              webViewErrorBloc.add(const WebViewClickEvent(false,""));
                            },
                          ),
                        );
                      } else {
                        displayWidget = Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              widget.url.isNotEmpty
                                  ? InAppWebView(
                                      initialUrlRequest: URLRequest(
                                          url: Uri.parse(
                                              widget.url.toString())),
                                      initialOptions:
                                          InAppWebViewGroupOptions(
                                        crossPlatform: InAppWebViewOptions(
                                            useShouldOverrideUrlLoading:
                                                true),
                                      ),
                                      onWebViewCreated:
                                          (InAppWebViewController
                                              controller) {
                                        _webViewController = controller;
                                      },
                                      onLoadStop: (controller, url) {
                                        isLoading = false;
                                        setState(() {});
                                      },
                                      onLoadError:(controller, url, code, message) {
                                        print("code ${code}: ${url}:${message}");
                                        webViewErrorBloc.add(WebViewClickEvent(true,code.toString()));
                                      },
                                      onLoadHttpError: (controller, url, statusCode, description) {
                                        isLoading = false;
                                      },
                                    )
                                  : Container(),
                                isLoading ? const Center(
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(
                                          color: ColorPath.primaryColor,
                                        ),
                                      ),
                                    )
                                  : Stack(),
                            ],
                          ),
                        );
                      }
                    },
                    webViewInternetState: () {
                      //displayWidget = Text(msg);
                      displayWidget = Center(
                        child: CustomPage(
                          imageName: IconPaths.noInternetIcon,
                          btnTitle: tryAgainMessage,
                          description: noInternetMessage,
                          onTap: () {
                            webViewErrorBloc.add(const WebViewClickEvent(false,""));
                          },
                        ),
                      );
                    },
                  );
                  return displayWidget == null
                      ? const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: ColorPath.primaryColor,
                            ),
                          ),
                        )
                      : displayWidget!;
                }):Center(
                  child: CustomPage(
                      imageName: IconPaths.noInternetIcon,
                      btnTitle: tryAgainMessage,
                      description: noInternetMessage,
                      onTap: () async {
                      },
                    ),
                ),
          ),
        ],
      ),
    );
  }
}
