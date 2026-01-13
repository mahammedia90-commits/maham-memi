import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../l10n/generated/app_localizations.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final List<bool> _expandedStates = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.privacyPolicy),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(context, l10n, isArabic),
            const SizedBox(height: AppDefaults.padding * 2),

            // Last Updated
            _buildLastUpdated(context, l10n, isArabic),
            const SizedBox(height: AppDefaults.padding),

            // Introduction
            _buildIntroduction(context, l10n, isArabic),
            const SizedBox(height: AppDefaults.padding),

            // Privacy Sections
            _buildExpandableSection(
              context: context,
              index: 0,
              title: isArabic ? 'البيانات التي نجمعها' : 'Data We Collect',
              icon: Icons.data_usage_rounded,
              content: _buildDataCollectionContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 1,
              title: isArabic ? 'كيف نستخدم بياناتك' : 'How We Use Your Data',
              icon: Icons.settings_applications_rounded,
              content: _buildDataUsageContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 2,
              title: isArabic ? 'مشاركة البيانات' : 'Data Sharing',
              icon: Icons.share_rounded,
              content: _buildDataSharingContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 3,
              title: isArabic ? 'حماية البيانات وأمنها' : 'Data Protection & Security',
              icon: Icons.security_rounded,
              content: _buildSecurityContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 4,
              title: isArabic ? 'حقوقك' : 'Your Rights',
              icon: Icons.verified_user_rounded,
              content: _buildRightsContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 5,
              title: isArabic ? 'ملفات تعريف الارتباط' : 'Cookies & Tracking',
              icon: Icons.cookie_rounded,
              content: _buildCookiesContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 6,
              title: isArabic ? 'الاحتفاظ بالبيانات' : 'Data Retention',
              icon: Icons.storage_rounded,
              content: _buildRetentionContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 7,
              title: isArabic ? 'خصوصية الأطفال' : 'Children\'s Privacy',
              icon: Icons.child_care_rounded,
              content: _buildChildrenContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 8,
              title: isArabic ? 'التحديثات والتعديلات' : 'Updates & Changes',
              icon: Icons.update_rounded,
              content: _buildUpdatesContent(isArabic),
            ),

            _buildExpandableSection(
              context: context,
              index: 9,
              title: isArabic ? 'اتصل بنا' : 'Contact Us',
              icon: Icons.contact_support_rounded,
              content: _buildContactContent(isArabic),
            ),

            const SizedBox(height: AppDefaults.padding * 2),

            // Compliance Badges
            _buildComplianceBadges(context, isArabic),

            const SizedBox(height: AppDefaults.padding * 2),

            // Footer
            _buildFooter(context, isArabic),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n, bool isArabic) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDefaults.radius),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.privacy_tip_rounded,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
          const SizedBox(width: AppDefaults.padding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.privacyPolicy,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  isArabic
                      ? 'نحن نحترم خصوصيتك ونلتزم بحماية بياناتك'
                      : 'We respect your privacy and are committed to protecting your data',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastUpdated(BuildContext context, AppLocalizations l10n, bool isArabic) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
        vertical: AppDefaults.padding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDefaults.radius / 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 16,
            color: Colors.blue[700],
          ),
          const SizedBox(width: 8),
          Text(
            isArabic
                ? 'آخر تحديث: يناير 2026'
                : 'Last Updated: January 2026',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroduction(BuildContext context, AppLocalizations l10n, bool isArabic) {
    return Text(
      isArabic
          ? '''مرحباً بك في تطبيق زاجلكم. نحن ملتزمون بحماية خصوصيتك وبياناتك الشخصية وفقاً لنظام حماية البيانات الشخصية السعودي (PDPL) واللائحة العامة لحماية البيانات (GDPR) وأفضل الممارسات العالمية.

تصف سياسة الخصوصية هذه كيفية جمعنا واستخدامنا وحمايتنا لمعلوماتك الشخصية عند استخدامك لتطبيقنا وخدماتنا.'''
          : '''Welcome to Zajalkom app. We are committed to protecting your privacy and personal data in accordance with the Saudi Personal Data Protection Law (PDPL), the General Data Protection Regulation (GDPR), and global best practices.

This Privacy Policy describes how we collect, use, and protect your personal information when you use our application and services.''',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
          ),
    );
  }

  Widget _buildExpandableSection({
    required BuildContext context,
    required int index,
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    final isExpanded = _expandedStates[index];
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDefaults.radius),
        border: Border.all(
          color: isExpanded
              ? theme.primaryColor.withOpacity(0.5)
              : Colors.grey.withOpacity(0.2),
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: theme.primaryColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDefaults.radius),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedStates[index] = expanded;
            });
          },
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppDefaults.padding,
            vertical: AppDefaults.padding / 2,
          ),
          childrenPadding: const EdgeInsets.only(
            left: AppDefaults.padding,
            right: AppDefaults.padding,
            bottom: AppDefaults.padding,
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: theme.primaryColor,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: theme.primaryColor,
            ),
          ),
          children: [content],
        ),
      ),
    );
  }

  Widget _buildDataCollectionContent(bool isArabic) {
    final items = isArabic
        ? [
            {'title': 'المعلومات الشخصية', 'desc': 'الاسم، رقم الهاتف، البريد الإلكتروني، العنوان'},
            {'title': 'معلومات الحساب', 'desc': 'بيانات تسجيل الدخول وتفضيلات الحساب'},
            {'title': 'معلومات الطلبات', 'desc': 'تاريخ الطلبات، المنتجات المفضلة، عناوين التوصيل'},
            {'title': 'معلومات الدفع', 'desc': 'تفاصيل البطاقة البنكية (مشفرة ومحمية)'},
            {'title': 'معلومات الجهاز', 'desc': 'نوع الجهاز، نظام التشغيل، المعرّف الفريد'},
            {'title': 'معلومات الموقع', 'desc': 'الموقع الجغرافي لتحديد عنوان التوصيل (بإذنك)'},
          ]
        : [
            {'title': 'Personal Information', 'desc': 'Name, phone number, email, address'},
            {'title': 'Account Information', 'desc': 'Login credentials and account preferences'},
            {'title': 'Order Information', 'desc': 'Order history, favorite products, delivery addresses'},
            {'title': 'Payment Information', 'desc': 'Bank card details (encrypted and protected)'},
            {'title': 'Device Information', 'desc': 'Device type, operating system, unique identifier'},
            {'title': 'Location Information', 'desc': 'Geographic location for delivery address (with your permission)'},
          ];

    return _buildBulletList(items);
  }

  Widget _buildDataUsageContent(bool isArabic) {
    final items = isArabic
        ? [
            {'title': 'معالجة الطلبات', 'desc': 'إتمام عمليات الشراء والتوصيل'},
            {'title': 'تحسين الخدمة', 'desc': 'تطوير تجربة المستخدم وتخصيص المحتوى'},
            {'title': 'التواصل', 'desc': 'إرسال تحديثات الطلبات والعروض الترويجية'},
            {'title': 'الأمان', 'desc': 'منع الاحتيال وحماية حسابك'},
            {'title': 'التحليلات', 'desc': 'فهم أنماط الاستخدام لتحسين خدماتنا'},
            {'title': 'الامتثال القانوني', 'desc': 'الالتزام بالمتطلبات التنظيمية السعودية'},
          ]
        : [
            {'title': 'Order Processing', 'desc': 'Complete purchases and deliveries'},
            {'title': 'Service Improvement', 'desc': 'Enhance user experience and personalize content'},
            {'title': 'Communication', 'desc': 'Send order updates and promotional offers'},
            {'title': 'Security', 'desc': 'Prevent fraud and protect your account'},
            {'title': 'Analytics', 'desc': 'Understand usage patterns to improve our services'},
            {'title': 'Legal Compliance', 'desc': 'Comply with Saudi regulatory requirements'},
          ];

    return _buildBulletList(items);
  }

  Widget _buildDataSharingContent(bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic
              ? 'لا نبيع بياناتك الشخصية أبداً. قد نشارك بياناتك فقط مع:'
              : 'We never sell your personal data. We may only share your data with:',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        _buildBulletList(isArabic
            ? [
                {'title': 'شركاء التوصيل', 'desc': 'لإيصال طلباتك بأمان'},
                {'title': 'مزودي خدمات الدفع', 'desc': 'لمعالجة المدفوعات بشكل آمن'},
                {'title': 'الجهات الحكومية', 'desc': 'عند الطلب القانوني فقط'},
              ]
            : [
                {'title': 'Delivery Partners', 'desc': 'To safely deliver your orders'},
                {'title': 'Payment Service Providers', 'desc': 'To process payments securely'},
                {'title': 'Government Authorities', 'desc': 'Only upon legal request'},
              ]),
      ],
    );
  }

  Widget _buildSecurityContent(bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSecurityBadge(
          icon: Icons.lock_rounded,
          title: isArabic ? 'تشفير SSL/TLS' : 'SSL/TLS Encryption',
          desc: isArabic
              ? 'جميع البيانات مشفرة أثناء النقل'
              : 'All data encrypted in transit',
        ),
        const SizedBox(height: 12),
        _buildSecurityBadge(
          icon: Icons.verified_rounded,
          title: isArabic ? 'معايير PCI DSS' : 'PCI DSS Standards',
          desc: isArabic
              ? 'حماية بيانات البطاقات البنكية'
              : 'Bank card data protection',
        ),
        const SizedBox(height: 12),
        _buildSecurityBadge(
          icon: Icons.shield_rounded,
          title: isArabic ? 'مراقبة على مدار الساعة' : '24/7 Monitoring',
          desc: isArabic
              ? 'مراقبة أمنية مستمرة للأنظمة'
              : 'Continuous security monitoring of systems',
        ),
        const SizedBox(height: 12),
        _buildSecurityBadge(
          icon: Icons.backup_rounded,
          title: isArabic ? 'نسخ احتياطي آمن' : 'Secure Backup',
          desc: isArabic
              ? 'نسخ احتياطية مشفرة ومحمية'
              : 'Encrypted and protected backups',
        ),
      ],
    );
  }

  Widget _buildSecurityBadge({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightsContent(bool isArabic) {
    final rights = isArabic
        ? [
            {'title': 'حق الوصول', 'desc': 'الاطلاع على بياناتك الشخصية المحفوظة لدينا'},
            {'title': 'حق التصحيح', 'desc': 'تعديل أي معلومات غير صحيحة'},
            {'title': 'حق الحذف', 'desc': 'طلب حذف بياناتك الشخصية'},
            {'title': 'حق النقل', 'desc': 'الحصول على نسخة من بياناتك'},
            {'title': 'حق الاعتراض', 'desc': 'الاعتراض على معالجة بعض البيانات'},
            {'title': 'حق سحب الموافقة', 'desc': 'سحب موافقتك في أي وقت'},
          ]
        : [
            {'title': 'Right to Access', 'desc': 'View your personal data stored with us'},
            {'title': 'Right to Rectification', 'desc': 'Correct any inaccurate information'},
            {'title': 'Right to Erasure', 'desc': 'Request deletion of your personal data'},
            {'title': 'Right to Portability', 'desc': 'Obtain a copy of your data'},
            {'title': 'Right to Object', 'desc': 'Object to processing of certain data'},
            {'title': 'Right to Withdraw Consent', 'desc': 'Withdraw your consent at any time'},
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic
              ? 'وفقاً لنظام حماية البيانات الشخصية السعودي، لديك الحقوق التالية:'
              : 'According to the Saudi Personal Data Protection Law, you have the following rights:',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        _buildBulletList(rights),
      ],
    );
  }

  Widget _buildCookiesContent(bool isArabic) {
    return Text(
      isArabic
          ? '''نستخدم ملفات تعريف الارتباط والتقنيات المشابهة لـ:

• تحسين أداء التطبيق
• تذكر تفضيلاتك
• تحليل استخدام التطبيق
• تخصيص المحتوى والإعلانات

يمكنك التحكم في هذه الإعدادات من خلال إعدادات التطبيق أو إعدادات جهازك.'''
          : '''We use cookies and similar technologies to:

• Improve app performance
• Remember your preferences
• Analyze app usage
• Personalize content and ads

You can control these settings through the app settings or your device settings.''',
      style: const TextStyle(height: 1.6),
    );
  }

  Widget _buildRetentionContent(bool isArabic) {
    return Text(
      isArabic
          ? '''نحتفظ ببياناتك الشخصية طالما كان حسابك نشطاً أو حسب الحاجة لتقديم خدماتنا.

• بيانات الحساب: طوال فترة نشاط الحساب
• سجل الطلبات: 5 سنوات للأغراض المحاسبية
• بيانات التحليلات: سنتان كحد أقصى
• بيانات التسويق: حتى إلغاء الاشتراك

بعد حذف حسابك، سنحذف أو نجعل بياناتك مجهولة الهوية خلال 30 يوماً، ما لم يكن الاحتفاظ مطلوباً قانونياً.'''
          : '''We retain your personal data as long as your account is active or as needed to provide our services.

• Account Data: Throughout account activity period
• Order History: 5 years for accounting purposes
• Analytics Data: Maximum 2 years
• Marketing Data: Until unsubscription

After deleting your account, we will delete or anonymize your data within 30 days, unless retention is legally required.''',
      style: const TextStyle(height: 1.6),
    );
  }

  Widget _buildChildrenContent(bool isArabic) {
    return Text(
      isArabic
          ? '''تطبيقنا غير موجه للأطفال دون سن 18 عاماً. لا نجمع عمداً معلومات شخصية من الأطفال.

إذا علمت أن طفلاً قدم لنا معلومات شخصية، يرجى التواصل معنا فوراً وسنتخذ الإجراءات اللازمة لحذف تلك المعلومات.'''
          : '''Our app is not directed to children under 18 years of age. We do not knowingly collect personal information from children.

If you become aware that a child has provided us with personal information, please contact us immediately and we will take steps to delete that information.''',
      style: const TextStyle(height: 1.6),
    );
  }

  Widget _buildUpdatesContent(bool isArabic) {
    return Text(
      isArabic
          ? '''قد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. سنُعلمك بأي تغييرات جوهرية عبر:

• إشعار داخل التطبيق
• بريد إلكتروني
• رسالة نصية

ننصحك بمراجعة هذه السياسة بشكل دوري. استمرارك في استخدام التطبيق بعد أي تعديلات يعني موافقتك على السياسة المحدثة.'''
          : '''We may update this Privacy Policy from time to time. We will notify you of any material changes via:

• In-app notification
• Email
• Text message

We recommend reviewing this policy periodically. Your continued use of the app after any modifications constitutes acceptance of the updated policy.''',
      style: const TextStyle(height: 1.6),
    );
  }

  Widget _buildContactContent(bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic
              ? 'إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية، يمكنك التواصل معنا:'
              : 'If you have any questions about this Privacy Policy, you can contact us:',
          style: const TextStyle(height: 1.6),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          icon: Icons.email_rounded,
          title: isArabic ? 'البريد الإلكتروني' : 'Email',
          value: 'privacy@zajalkom.sa',
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          icon: Icons.phone_rounded,
          title: isArabic ? 'الهاتف' : 'Phone',
          value: '+966 XX XXX XXXX',
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          icon: Icons.location_on_rounded,
          title: isArabic ? 'العنوان' : 'Address',
          value: isArabic
              ? 'المملكة العربية السعودية'
              : 'Kingdom of Saudi Arabia',
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.orange),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isArabic
                      ? 'سنرد على استفساراتك خلال 48 ساعة عمل'
                      : 'We will respond to your inquiries within 48 business hours',
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Text(
          '$title: ',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletList(List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      item['desc']!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildComplianceBadges(BuildContext context, bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic ? 'الامتثال والمعايير' : 'Compliance & Standards',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildBadge('PDPL', Colors.green, isArabic ? 'نظام حماية البيانات السعودي' : 'Saudi Data Protection'),
            _buildBadge('GDPR', Colors.blue, isArabic ? 'اللائحة الأوروبية' : 'EU Regulation'),
            _buildBadge('ISO 27001', Colors.purple, isArabic ? 'أمن المعلومات' : 'Information Security'),
            _buildBadge('PCI DSS', Colors.orange, isArabic ? 'أمان البطاقات' : 'Card Security'),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String label, Color color, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.verified_rounded, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, bool isArabic) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppDefaults.radius),
      ),
      child: Column(
        children: [
          Icon(
            Icons.shield_rounded,
            size: 40,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          Text(
            isArabic
                ? 'خصوصيتك أولويتنا'
                : 'Your Privacy is Our Priority',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            isArabic
                ? 'نلتزم بأعلى معايير حماية البيانات والخصوصية'
                : 'We adhere to the highest standards of data protection and privacy',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            '© 2026 Zajalkom - ${isArabic ? 'جميع الحقوق محفوظة' : 'All Rights Reserved'}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[500],
                  fontSize: 11,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
