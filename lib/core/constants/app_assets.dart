/// Centralized asset paths for the application
/// This class provides easy access to all asset paths in one location
class AppAssets {
  // Private constructor to prevent instantiation
  AppAssets._();

  // Base asset paths
  static const String _imagesPath = 'assets/images';
  static const String _iconsPath = 'assets/icons';
  static const String _svgsPath = 'assets/svgs';
  static const String _fontsPath = 'assets/fonts';

  // Image assets
  static const String logo = '$_imagesPath/logo.png';
  static const String placeholderImage = '$_imagesPath/placeholder.png';
  static const String profileDefault = '$_imagesPath/profile_default.png';
  static const String backgroundImage = '$_imagesPath/background.png';
  static const String onboarding1 = '$_imagesPath/onboarding_1.png';
  static const String onboarding2 = '$_imagesPath/onboarding_2.png';
  static const String onboarding3 = '$_imagesPath/onboarding_3.png';
  static const String emptyState = '$_imagesPath/empty_state.png';
  static const String errorState = '$_imagesPath/error_state.png';
  static const String successState = '$_imagesPath/success_state.png';

  // Icon assets
  static const String homeIcon = '$_iconsPath/home.png';
  static const String profileIcon = '$_iconsPath/profile.png';
  static const String settingsIcon = '$_iconsPath/settings.png';
  static const String notificationIcon = '$_iconsPath/notification.png';
  static const String searchIcon = '$_iconsPath/search.png';
  static const String addIcon = '$_iconsPath/add.png';
  static const String editIcon = '$_iconsPath/edit.png';
  static const String deleteIcon = '$_iconsPath/delete.png';
  static const String shareIcon = '$_iconsPath/share.png';
  static const String favoriteIcon = '$_iconsPath/favorite.png';
  static const String calendarIcon = '$_iconsPath/calendar.png';
  static const String locationIcon = '$_iconsPath/location.png';
  static const String phoneIcon = '$_iconsPath/phone.png';
  static const String emailIcon = '$_iconsPath/email.png';
  static const String lockIcon = '$_iconsPath/lock.png';
  static const String eyeIcon = '$_iconsPath/eye.png';
  static const String eyeOffIcon = '$_iconsPath/eye_off.png';
  static const String checkIcon = '$_iconsPath/check.png';
  static const String closeIcon = '$_iconsPath/close.png';
  static const String arrowBackIcon = '$_iconsPath/arrow_back.png';
  static const String arrowForwardIcon = '$_iconsPath/arrow_forward.png';
  static const String arrowUpIcon = '$_iconsPath/arrow_up.png';
  static const String arrowDownIcon = '$_iconsPath/arrow_down.png';
  static const String menuIcon = '$_iconsPath/menu.png';
  static const String filterIcon = '$_iconsPath/filter.png';
  static const String sortIcon = '$_iconsPath/sort.png';
  static const String downloadIcon = '$_iconsPath/download.png';
  static const String uploadIcon = '$_iconsPath/upload.png';
  static const String cameraIcon = '$_iconsPath/camera.png';
  static const String galleryIcon = '$_iconsPath/gallery.png';
  static const String documentIcon = '$_iconsPath/document.png';
  static const String folderIcon = '$_iconsPath/folder.png';

  // SVG assets
  static const String logoSvg = '$_svgsPath/logo.svg';
  static const String homeSvg = '$_svgsPath/home.svg';
  static const String profileSvg = '$_svgsPath/profile.svg';
  static const String settingsSvg = '$_svgsPath/settings.svg';
  static const String notificationSvg = '$_svgsPath/notification.svg';
  static const String searchSvg = '$_svgsPath/search.svg';
  static const String addSvg = '$_svgsPath/add.svg';
  static const String editSvg = '$_svgsPath/edit.svg';
  static const String deleteSvg = '$_svgsPath/delete.svg';
  static const String shareSvg = '$_svgsPath/share.svg';
  static const String favoriteSvg = '$_svgsPath/favorite.svg';
  static const String calendarSvg = '$_svgsPath/calendar.svg';
  static const String locationSvg = '$_svgsPath/location.svg';
  static const String phoneSvg = '$_svgsPath/phone.svg';
  static const String emailSvg = '$_svgsPath/email.svg';
  static const String lockSvg = '$_svgsPath/lock.svg';
  static const String eyeSvg = '$_svgsPath/eye.svg';
  static const String eyeOffSvg = '$_svgsPath/eye_off.svg';
  static const String checkSvg = '$_svgsPath/check.svg';
  static const String closeSvg = '$_svgsPath/close.svg';
  static const String arrowBackSvg = '$_svgsPath/arrow_back.svg';
  static const String arrowForwardSvg = '$_svgsPath/arrow_forward.svg';
  static const String arrowUpSvg = '$_svgsPath/arrow_up.svg';
  static const String arrowDownSvg = '$_svgsPath/arrow_down.svg';
  static const String menuSvg = '$_svgsPath/menu.svg';
  static const String filterSvg = '$_svgsPath/filter.svg';
  static const String sortSvg = '$_svgsPath/sort.svg';
  static const String downloadSvg = '$_svgsPath/download.svg';
  static const String uploadSvg = '$_svgsPath/upload.svg';
  static const String cameraSvg = '$_svgsPath/camera.svg';
  static const String gallerySvg = '$_svgsPath/gallery.svg';
  static const String documentSvg = '$_svgsPath/document.svg';
  static const String folderSvg = '$_svgsPath/folder.svg';

  // Font assets
  static const String poppinsRegular = '$_fontsPath/Poppins-Regular.ttf';
  static const String poppinsMedium = '$_fontsPath/Poppins-Medium.ttf';
  static const String poppinsSemiBold = '$_fontsPath/Poppins-SemiBold.ttf';
  static const String poppinsBold = '$_fontsPath/Poppins-Bold.ttf';

  // Helper methods to get asset paths
  static String getImagePath(String imageName) => '$_imagesPath/$imageName';
  static String getIconPath(String iconName) => '$_iconsPath/$iconName';
  static String getSvgPath(String svgName) => '$_svgsPath/$svgName';
  static String getFontPath(String fontName) => '$_fontsPath/$fontName';

  // Get all asset paths as a list (useful for pubspec.yaml validation)
  static List<String> getAllAssetPaths() {
    return [
      _imagesPath,
      _iconsPath,
      _svgsPath,
    ];
  }

  // Get all image paths
  static List<String> getAllImagePaths() {
    return [
      logo,
      placeholderImage,
      profileDefault,
      backgroundImage,
      onboarding1,
      onboarding2,
      onboarding3,
      emptyState,
      errorState,
      successState,
    ];
  }

  // Get all icon paths
  static List<String> getAllIconPaths() {
    return [
      homeIcon,
      profileIcon,
      settingsIcon,
      notificationIcon,
      searchIcon,
      addIcon,
      editIcon,
      deleteIcon,
      shareIcon,
      favoriteIcon,
      calendarIcon,
      locationIcon,
      phoneIcon,
      emailIcon,
      lockIcon,
      eyeIcon,
      eyeOffIcon,
      checkIcon,
      closeIcon,
      arrowBackIcon,
      arrowForwardIcon,
      arrowUpIcon,
      arrowDownIcon,
      menuIcon,
      filterIcon,
      sortIcon,
      downloadIcon,
      uploadIcon,
      cameraIcon,
      galleryIcon,
      documentIcon,
      folderIcon,
    ];
  }

  // Get all SVG paths
  static List<String> getAllSvgPaths() {
    return [
      logoSvg,
      homeSvg,
      profileSvg,
      settingsSvg,
      notificationSvg,
      searchSvg,
      addSvg,
      editSvg,
      deleteSvg,
      shareSvg,
      favoriteSvg,
      calendarSvg,
      locationSvg,
      phoneSvg,
      emailSvg,
      lockSvg,
      eyeSvg,
      eyeOffSvg,
      checkSvg,
      closeSvg,
      arrowBackSvg,
      arrowForwardSvg,
      arrowUpSvg,
      arrowDownSvg,
      menuSvg,
      filterSvg,
      sortSvg,
      downloadSvg,
      uploadSvg,
      cameraSvg,
      gallerySvg,
      documentSvg,
      folderSvg,
    ];
  }

  // Get all font paths
  static List<String> getAllFontPaths() {
    return [
      poppinsRegular,
      poppinsMedium,
      poppinsSemiBold,
      poppinsBold,
    ];
  }
}
