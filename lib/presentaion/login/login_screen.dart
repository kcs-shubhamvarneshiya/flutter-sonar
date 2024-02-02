import 'dart:convert';

import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common_widgets/custom_header.dart';
import '../../common_widgets/custome_page.dart';
import '../../core/apis.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_event_data.dart';
import '../bloc/login_bloc/login_state.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var loadingPercentage = 0;
  bool pageLoading = true;
  String userToken = '';
  String refreshToken = '';
  WebViewController webViewController = WebViewController();
  bool? isInternet = false;
  Widget? loginScreenWidget;
  bool? isBuildUrlLoad = false;

  String getFormHtml() {
    String body =
        "<body onload=\"document.forms['submit_form'].submit()\"><form name=\"submit_form\" ngcontent-myn-c13="
        " ngnoform="
        " method=\"post\" action=\"${Apis.ssoURL}\"><input style='display:none;' ngcontent-myn-c13="
        " type=\"hidden\" name=\"client_id\" value=\"${Apis.clientID}\"><input style='display:none;' _ngcontent-myn-c13="
        " type=\"hidden\" name=\"client_key\" value=\"${Apis.secretKey}\"></form></body>";
    return body;
  }

  buildUrl() {
    String webUrl = Uri.dataFromString(getFormHtml(),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    webViewController.loadRequest(Uri.parse(webUrl));
  }

  Future<void> _parseTokens(Uri uri, BuildContext context) async {
    try {
      if (uri.hasQuery && uri.queryParameters[Apis.auth] != null) {
        var authQueryParams = jsonDecode(jsonEncode(uri.queryParameters[Apis.auth]!));
        userToken = jsonDecode(authQueryParams)[Apis.apptoken];
        refreshToken = jsonDecode(authQueryParams)[Apis.refreshToken];
        print("new access Token\n$userToken\n ${StackTrace.empty}");
        final preferences =  getIt<SharedPreferences>();
        preferences.setString(keySSOUserTokenPref, userToken);

        ///call the block to validate the api
        context.read<LoginBloc>().add(const LoginValidateEventData());
      }
    } catch (e) {
      print("error: ${e.toString()}");
      getIt<AppRouter>().pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var connectionStatus =
        context.watch<LoginBloc>().iConnectionStatus!.connect;
    return Scaffold(
        appBar: CustomHeader(
          title: signInSSO,
          redirectToHome: false,
        ),
        body: BlocProvider<LoginBloc>(
            create: (context) => getIt<LoginBloc>(),
            child: BlocConsumer<LoginBloc, LoginState>(
                bloc: context.read<LoginBloc>()
                  ..add(const LoginEventData.connectionEvent()),
                builder: (context, state) {
                  return Column(
                    children: [
                      //VerticalSpace(height: 1.h),
                      connectionStatus == true
                          ? Expanded(
                              child: Stack(
                                children: [
                                  WebViewWidget(
                                    controller: webViewController
                                      ..setJavaScriptMode(
                                          JavaScriptMode.unrestricted)
                                      ..setBackgroundColor(
                                          const Color(0x00000000))
                                      ..setNavigationDelegate(
                                        NavigationDelegate(
                                          onPageStarted: (url) {
                                            loadingPercentage = 0;
                                            context.read<LoginBloc>().add(
                                                LoginEventData.progressEvent(
                                                    loadingPercentage));
                                          },
                                          onProgress: (progress) {
                                            loadingPercentage = progress;
                                            context.read<LoginBloc>().add(
                                                LoginEventData.progressEvent(
                                                    loadingPercentage));
                                          },
                                          onPageFinished: (url) {
                                            loadingPercentage = 100;
                                          },
                                          onWebResourceError:
                                              (WebResourceError error) {
                                            print(
                                                "web error: \n${error.description}");
                                          },
                                          onNavigationRequest:
                                              (NavigationRequest request) {
                                            if (!request.url
                                                .startsWith('https:')) {
                                              return NavigationDecision
                                                  .navigate;
                                            } else {
                                              if (request.url ==
                                                      'https://sso.uat.na.bapsapps.org' ||
                                                  request.url ==
                                                      'https://sso.uat.na.bapsapps.org/') {
                                                return NavigationDecision
                                                    .navigate;
                                              } else {
                                                Uri uri =
                                                    Uri.parse(request.url);
                                                var queryParams = uri
                                                    .queryParameters[Apis.auth];
                                                final canBeDecoded =
                                                    queryParams != null &&
                                                        queryParams.contains(
                                                            'token') &&
                                                        queryParams.contains(
                                                            'refreshToken');
                                                _parseTokens(uri, context);
                                                return NavigationDecision
                                                    .prevent;
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                  ),
                                  if (loadingPercentage < 100)
                                    LinearProgressIndicator(
                                      value: loadingPercentage / 100.0,
                                    ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: CustomPage(
                                imageName: IconPaths.noInternetIcon,
                                btnTitle: tryAgainMessage,
                                description: noInternetMessage,
                                onTap: () {},
                              )),
                    ],
                  );
                },
                listener: (context, state) {
                  state.when(
                      progressUpdate: (progress) {
                        loadingPercentage = progress;
                      },
                      loading: () {
                      },
                      internetAvailable: (isInternet) {
                        connectionStatus = isInternet;
                        if (connectionStatus) {
                          if (!isBuildUrlLoad!) {
                            buildUrl();
                            isBuildUrlLoad = true;
                          }
                        }
                      },
                      loaded: (value) {},
                      error: (String error) {});
                })));
  }
}
