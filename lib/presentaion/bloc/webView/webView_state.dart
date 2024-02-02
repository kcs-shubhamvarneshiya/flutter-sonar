
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webView_state.freezed.dart';

@freezed
class WebViewState with _$WebViewState {
  const factory WebViewState.webViewInitialState() = _WebViewInitialState;
  const factory WebViewState.webViewClickState(bool isError,String errorCode) = _WebViewClickState;
  const factory WebViewState.webViewInternetState() = _WebViewInternetState;
}

