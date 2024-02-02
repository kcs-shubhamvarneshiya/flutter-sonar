
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webView_event.freezed.dart';

@freezed
class WebViewEvent  with _$WebViewEvent{
  const factory WebViewEvent.webViewClickEvent(bool isError,String code) = WebViewClickEvent;
}

