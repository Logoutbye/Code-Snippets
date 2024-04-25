import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class AdManager {
  static void init() {
    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );
  }

  static void loadInterstitialAd({
    required String placementId,
    required Function(InterstitialAdResult, dynamic) listener,
  }) {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: placementId,
      listener: listener,
    );
  }

  static void showInterstitialAd() {
    FacebookInterstitialAd.showInterstitialAd();
  }

  static void loadRewardedVideoAd({
    required String placementId,
    required Function(RewardedVideoAdResult, dynamic) listener,
  }) {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: placementId,
      listener: listener,
    );
  }

  static void showRewardedVideoAd() {
    FacebookRewardedVideoAd.showRewardedVideoAd();
  }

  static Widget getBannerAd({required String placementId}) {
    return FacebookBannerAd(
      placementId: placementId,
      bannerSize: BannerSize.STANDARD,
      listener: (result, value) {
        print("::: Banner Ad: $result -->  $value");
      },
    );
  }

  static Widget getNativeBannerAd({required String placementId}) {
    return FacebookNativeAd(
      placementId: placementId,
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      keepExpandedWhileLoading: false,
      listener: (result, value) {
        print("::: Native Banner Ad: $result --> $value");
      },
    );
  }

  static Widget getNativeAd({required String placementId}) {
    return FacebookNativeAd(
      placementId: placementId,
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("::: Native Ad: $result --> $value");
      },
      keepExpandedWhileLoading: false,
      expandAnimationDuraion: 1000,
    );
  }

  static Widget getNativeAdHorizontal({required String placementId}) {
    return FacebookNativeAd(
      placementId: placementId,
      adType: NativeAdType.NATIVE_AD_HORIZONTAL,
      width: double.infinity,
      height: 250,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("::: Native Ad Horizontal: $result --> $value");
      },
      keepExpandedWhileLoading: false,
      expandAnimationDuraion: 1000,
    );
  }
}

  // <!-- For apps targeting Android 13 or higher & IMA SDK version 3.24.0 or lower -->
  // <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
    
// <<<<<<<<<<<<<<<<<To use these methods, you can call them as follows:>>>>>>>>>>>>>>>>>>

// AdManager.init(); // Initialize Facebook Audience Network

// // Load and show interstitial ad
// AdManager.loadInterstitialAd(
//   placementId: "YOUR_INTERSTITIAL_PLACEMENT_ID",
//   listener: (result, value) {
//     if (result == InterstitialAdResult.LOADED) {
//       AdManager.showInterstitialAd();
//     }
//   },
// );

// // Load and show rewarded video ad
// AdManager.loadRewardedVideoAd(
//   placementId: "YOUR_REWARDED_VIDEO_PLACEMENT_ID",
//   listener: (result, value) {
//     if (result == RewardedVideoAdResult.LOADED) {
//       AdManager.showRewardedVideoAd();
//     }
//   },
// );

// // Get banner ad widget
// Widget bannerAdWidget = AdManager.getBannerAd(
//   placementId: "YOUR_BANNER_PLACEMENT_ID",
// );

// // Get native banner ad widget
// Widget nativeBannerAdWidget = AdManager.getNativeBannerAd(
//   placementId: "YOUR_NATIVE_BANNER_PLACEMENT_ID",
// );

// // Get native ad widget
// Widget nativeAdWidget = AdManager.getNativeAd(
//   placementId: "YOUR_NATIVE_AD_PLACEMENT_ID",
// );

// // Get native ad horizontal widget
// Widget nativeAdHorizontalWidget = AdManager.getNativeAdHorizontal(
//   placementId: "YOUR_NATIVE_AD_HORIZONTAL_PLACEMENT_ID",
// );

// // Get native ad inline widget
// Widget nativeAdInlineWidget = AdManager.getNativeAdInline(
//   placementId: "YOUR_NATIVE_AD_INLINE_PLACEMENT_ID",
// );

// // Get native ad template widget
// Widget nativeAdTemplateWidget = AdManager.getNativeAdTemplate(
//   placementId: "YOUR_NATIVE_AD_TEMPLATE_PLACEMENT_ID",
// );
