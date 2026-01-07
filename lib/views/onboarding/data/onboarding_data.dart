import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/constants/app_images.dart';
import 'onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> getItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      OnboardingModel(
        imageUrl: AppImages.onboarding1,
        headline: l10n.onboardingTitle1,
        description: l10n.onboardingDesc1,
      ),
      OnboardingModel(
        imageUrl: AppImages.onboarding2,
        headline: l10n.onboardingTitle2,
        description: l10n.onboardingDesc2,
      ),
      OnboardingModel(
        imageUrl: AppImages.onboarding3,
        headline: l10n.onboardingTitle3,
        description: l10n.onboardingDesc3,
      ),
    ];
  }
}
