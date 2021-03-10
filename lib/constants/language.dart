import 'package:flutter/widgets.dart';

import 'strings.dart';
import '../core/configuration.dart';

class LanguageRegion {
  final String code;
  final String countryCode;
  final String name;
  final String country;
  final String translator;
  final String github;

  const LanguageRegion({
    this.code,
    this.countryCode,
    this.name,
    this.country,
    this.translator,
    this.github,
  });

  static const enUs = LanguageRegion(
    code: 'en',
    countryCode: 'US',
  );
  static const ruRu = LanguageRegion(
    code: 'ru',
    countryCode: 'RU',
  );
  static const slSi = LanguageRegion(
    code: 'sl',
    countryCode: 'SI',
  );
  static const ptBr = LanguageRegion(
    code: 'pt',
    countryCode: 'BR',
  );
  static const hiIn = LanguageRegion(
    code: 'hi',
    countryCode: 'IN',
  );
  static const deDe = LanguageRegion(
    code: 'de',
    countryCode: 'DE',
  );
  static const nlNl = LanguageRegion(
    code: 'nl',
    countryCode: 'NL',
  );

  static const values = <LanguageRegion>[
    enUs,
    ruRu,
    slSi,
    ptBr,
    hiIn,
    deDe,
    nlNl,
  ];

  int get index => values.indexOf(this);
}

class Language extends Strings with ChangeNotifier {
  LanguageRegion current;

  static Language get() => language;

  static Future<void> init({LanguageRegion languageRegion}) async {
    language = new Language();
    await language.set(languageRegion: languageRegion);
  }

  Future<void> set({LanguageRegion languageRegion}) async {
    switch (languageRegion) {
      case LanguageRegion.enUs:
        {
          this.STRING_INTERNET_ERROR = 'Check your internet connection.';
          this.STRING_SEARCH_HEADER = 'Search Music';
          this.STRING_SEARCH_MODE_SUBHEADER = 'What are you looking for?';
          this.STRING_COLLECTION = 'Collection';
          this.STRING_NOW_PLAYING = 'Now Playing';
          this.STRING_SETTING = 'Settings';
          this.STRING_OK = 'OKAY';
          this.STRING_YES = 'YES';
          this.STRING_NO = 'NO';
          this.STRING_ALBUM = 'Albums';
          this.STRING_TRACK = 'Tracks';
          this.STRING_TOP_TRACKS = 'TOP TRACKS';
          this.STRING_ARTIST = 'Artists';
          this.STRING_SAVED = 'Saved';
          this.STRING_THEME_MODE_LIGHT = 'Light';
          this.STRING_THEME_MODE_DARK = 'Dark';
          this.STRING_OPTIONS = 'Options';
          this.STRING_FOLLOWERS = 'followers';
          this.STRING_PLAYS = 'plays';
          this.STRING_EXPORT_TRACK = 'Export track';
          this.STRING_DELETE_TRACK = 'Delete track';
          this.STRING_SEARCH_MODE_SUBTITLE_ALBUM =
              'Search music from your favorite albums';
          this.STRING_SEARCH_MODE_SUBTITLE_TRACK =
              'Search for your favorite tracks';
          this.STRING_SEARCH_MODE_SUBTITLE_ARTIST =
              'Search music from your favorite artists';
          this.STRING_SEARCH_HISTORY_SUBHEADER = 'Your recent searches';
          this.STRING_SEARCH_RESULT_LOADER_LABEL = 'Getting your music...';
          this.STRING_SEARCH_RESULT_TOP_SUBHEADER_ALBUM =
              'Closest album from the result';
          this.STRING_SEARCH_RESULT_TOP_SUBHEADER_TRACK =
              'Closest track from the result';
          this.STRING_SEARCH_RESULT_TOP_SUBHEADER_ARTIST =
              'Closest artist from the result';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_0_ALBUM = 'SAVE ALBUM';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_0_TRACK = 'SAVE TRACK';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_0_ARTIST = 'SAVE ARTIST';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_1_ALBUM = 'SHOW ALBUM';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_1_TRACK = 'SHOW TRACK';
          this.STRING_SEARCH_RESULT_TOP_BUTTON_LABEL_1_ARTIST = 'SHOW ARTIST';
          this.STRING_SEARCH_RESULT_OTHER_SUBHEADER_ALBUM =
              'More albums from the result';
          this.STRING_SEARCH_RESULT_OTHER_SUBHEADER_TRACK =
              'More tracks from the result';
          this.STRING_SEARCH_RESULT_OTHER_SUBHEADER_ARTIST =
              'More similar artists';
          this.STRING_ALBUM_VIEW_DOWNLOAD_BACK_TITLE = 'You cannot go back';
          this.STRING_ALBUM_VIEW_DOWNLOAD_BACK_SUBTITLE =
              'One or more tracks are being saved offline. Please wait until all the tracks are saved.';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_NETWORK_TITLE =
              'The track could not be saved';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_NETWORK_SUBTITLE =
              'We strongly recommend you to check your internet connection & try again in a while.';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_RATE_TITLE =
              'We all have bad days';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_RATE_SUBTITLE =
              'We have encountered an error while saving your music. This generally means that our IP address is blocked due to large number of requests in a given time.\nYou can change server URL in settings and try if it works.\nAlthough, this can also mean that the dependencies of the server are not up to date. This error has nothing to do with you.\nYou can inform the owner of the project, by opening an issue on Github or on Twitter & expect a fix within an hour, if he lives in the same time zone as you.\nEnjoy your downloaded music in the mean time. Thanks a lot for your support.';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_SAVING_TITLE =
              'We could not save this track';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ERROR_SAVING_SUBTITLE =
              'This track specifically could not be saved. We are still trying to figure out, what causes this error. Please download some other music in the mean time. Thanks a lot for your kind support.';
          this.STRING_ALBUM_VIEW_DOWNLOAD_DOUBLE_TITLE = 'Wait';
          this.STRING_ALBUM_VIEW_DOWNLOAD_DOUBLE_SUBTITLE =
              'This track is already being downloaded.';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ALREADY_SAVED_TITLE =
              'This track is already saved';
          this.STRING_ALBUM_VIEW_DOWNLOAD_ALREADY_SAVED_SUBTITLE =
              'Do you want to download this track once again?';
          this.STRING_ALBUM_VIEW_LOADER_LABEL = 'Getting tracks...';
          this.STRING_ALBUM_VIEW_TRACKS_SUBHEADER =
              'Here are the tracks from this album';
          this.STRING_ALBUM_VIEW_INFO_SUBHEADER = 'Some insights of the album';
          this.STRING_LOCAL_TOP_BODY_ALBUM_EMPTY =
              'Search & save some music to see it here.\nSpin the refresh to see new stuff.';
          this.STRING_LOCAL_TOP_SUBHEADER_ALBUM = 'Latest album';
          this.STRING_LOCAL_OTHER_SUBHEADER_ALBUM = 'More albums';
          this.STRING_LOCAL_TOP_SUBHEADER_TRACK = 'Latest track';
          this.STRING_LOCAL_OTHER_SUBHEADER_TRACK = 'More tracks';
          this.STRING_LOCAL_TOP_SUBHEADER_ARTIST = 'Latest artist';
          this.STRING_LOCAL_OTHER_SUBHEADER_ARTIST = 'More artists';
          this.STRING_LOCAL_ALBUM_VIEW_TRACKS_SUBHEADER =
              'Tracks from the album';
          this.STRING_LOCAL_ALBUM_VIEW_INFO_SUBHEADER =
              'Some insights of the album';
          this.STRING_LOCAL_ALBUM_VIEW_ALBUM_DELETE_DIALOG_HEADER =
              'Are you sure?';
          this.STRING_LOCAL_ALBUM_VIEW_ALBUM_DELETE_DIALOG_BODY =
              'Do you want to remove this album saved on your device?';
          this.STRING_LOCAL_ALBUM_VIEW_TRACK_DELETE_DIALOG_HEADER =
              'Are you sure?';
          this.STRING_LOCAL_ALBUM_VIEW_TRACK_DELETE_DIALOG_BODY =
              'Do you want to remove this track saved on your device?';
          this.STRING_NOW_PLAYING_NEXT_TRACK = 'NEXT';
          this.STRING_NOW_PLAYING_PREVIOUS_TRACK = 'PREVIOUS';
          this.STRING_NOW_PLAYING_NOT_PLAYING_TITLE = 'Nothing is being played';
          this.STRING_NOW_PLAYING_NOT_PLAYING_SUBTITLE =
              'Play from your collection';
          this.STRING_NOW_PLAYING_NOT_PLAYING_HEADER = "We're all set...";
          this.STRING_SETTING_GITHUB = 'GITHUB';
          this.STRING_SETTING_STAR_GITHUB = 'STAR THE PROJECT';
          this.STRING_SETTING_STARGAZERS_TITLE = 'Project Stargazers';
          this.STRING_SETTING_STARGAZERS_SUBTITLE =
              'Thanks a lot for your support';
          this.STRING_SETTING_REPOSITORY_INFORMATION_ERROR =
              'We are unable to get latest info about us, you are most likely offline.';
          this.STRING_SETTING_STARGAZERS_INFORMATION_ERROR =
              'We could not retrieve the information about latest stargazers.';
          this.STRING_SETTING_LANGUAGE_TITLE = 'Language';
          this.STRING_SETTING_LANGUAGE_SUBTITLE =
              'Change the language of the app';
          this.STRING_SETTING_LANGUAGE_RESTART_DIALOG_TITLE =
              'App restart required';
          this.STRING_SETTING_LANGUAGE_RESTART_DIALOG_SUBTITLE =
              'Do you want to restart the app now?';
          this.STRING_ABOUT_TITLE = 'About';
          this.STRING_ABOUT_SUBTITLE =
              'Information about the app & its developers';
          this.STRING_SETTING_SERVER_CHANGE_TITLE = 'Server';
          this.STRING_SETTING_SERVER_CHANGE_SUBTITLE =
              'Change where the app requests for its content';
          this.STRING_SETTING_SERVER_CHANGE_SERVER_HINT = 'Enter a server URL';
          this.STRING_SETTING_SERVER_CHANGE_SERVER_LABEL = 'Server URL';
          this.STRING_SETTING_SERVER_CHANGE_ERROR_INVALID =
              'It is not a valid server URL for the app.';
          this.STRING_SETTING_SERVER_CHANGE_ERROR_NETWORK =
              'Please check your internet connection.';
          this.STRING_SETTING_SERVER_CHANGE_DONE =
              'Server changed successfully.';
          this.STRING_SETTING_SERVER_CHANGE_CHANGING =
              'Changing server for the app...';
          this.STRING_SETTING_LANGUAGE_PROVIDERS_TITLE =
              'Translation Providers';
          this.STRING_SETTING_LANGUAGE_PROVIDERS_SUBTITLE =
              'Thanks a lot for your support to the app.';
          this.STRING_SETTING_ACCENT_COLOR_TITLE = 'Accent';
          this.STRING_SETTING_ACCENT_COLOR_SUBTITLE =
              'Change the accent coloring of the app';
          this.STRING_SETTING_THEME_TITLE = 'Theme';
          this.STRING_SETTING_THEME_SUBTITLE =
              'Change the app to light or dark mode';
          this.STRING_NO_DOWNLOAD_UPDATE = 'Your app is already updated';
          this.STRING_DOWNLOAD_UPDATE = 'DOWNLOAD UPDATE';
          this.STRING_SETTING_APP_VERSION_TITLE = 'Version';
          this.STRING_SETTING_APP_VERSION_SUBTITLE =
              'Information about current version of the app';
          this.STRING_SETTING_APP_VERSION_INSTALLED = 'Installed Version';
          this.STRING_SETTING_APP_VERSION_LATEST = 'Latest Version';
          this.STRING_MENU = 'Menu';
          this.STRING_SEARCH_COLLECTION = 'Search Collection';
          this.STRING_SWITCH_THEME = 'Switch Theme';
          this.STRING_DISCOVER = 'Discover';
          this.STRING_PLAY = 'Play';
          this.STRING_PAUSE = 'Pause';
          this.STRING_DELETE = 'Delete';
          this.STRING_SHARE = 'Share';
          this.STRING_ADD_TO_PLAYLIST = 'Add to playlist';
          this.STRING_SAVE_TO_DOWNLOADS = 'Save to downloads';
          this.STRING_LOCAL_SEARCH_ALBUM_SUBHEADER = 'Albums';
          this.STRING_LOCAL_SEARCH_TRACK_SUBHEADER = 'Tracks';
          this.STRING_LOCAL_SEARCH_WELCOME =
              'Enter something to search in your collection';
          this.STRING_LOCAL_SEARCH_NO_RESULTS =
              'Nothing like that could be found in your collection';
          this.STRING_PLAYLIST = 'Playlist';
          this.STRING_PLAYLISTS = 'Playlists';
          this.STRING_PLAYLISTS_SUBHEADER = 'Your playlists';
          this.STRING_PLAYLISTS_CREATE = 'Create a new playlist';
          this.STRING_PLAYLISTS_TEXT_FIELD_LABEL = 'Playlist Name';
          this.STRING_PLAYLISTS_TEXT_FIELD_HINT = 'Name for your new playlist';
          this.STRING_LOCAL_ALBUM_VIEW_PLAYLIST_DELETE_DIALOG_HEADER =
              'Are you sure?';
          this.STRING_LOCAL_ALBUM_VIEW_PLAYLIST_DELETE_DIALOG_BODY =
              'Do you want to delete this playlist?';
          this.STRING_CANCEL = 'CANCEL';
          this.STRING_PLAYLIST_ADD_DIALOG_TITLE = 'Add to playlist';
          this.STRING_PLAYLIST_ADD_DIALOG_BODY =
              'Select a playlist to add this track';
          this.STRING_PLAYLIST_TRACKS_SUBHEADER =
              'Here are the tracks in this playlist';
          this.STRING_TRANSFERS = 'Transfers';
          this.STRING_THEME_MODE_SYSTEM = 'Follow system theme';
          this.STRING_SETTING_INDEXING_TITLE = 'Indexing';
          this.STRING_SETTING_INDEXING_SUBTITLE =
              'Reindex your music collection';
          this.STRING_SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR =
              'Indexed NUMBER_STRING of TOTAL_STRING tracks...';
          this.STRING_SETTING_INDEXING_DONE =
              'Your music collection is indexed';
          this.STRING_SETTING_INDEXING_WARNING =
              'Do not interrupt the process.';
          this.STRING_REFRESH = 'REFRESH';
          this.STRING_SEARCH_NO_RECENT_SEARCHES =
              'Your recent searches will show here';
          this.STRING_NO_INTERNET_TITLE = 'No Internet';
          this.STRING_NO_INTERNET_SUBTITLE = 'Check your connection.';
          this.STRING_NO_COLLECTION_TITLE = 'Empty Collection';
          this.STRING_NO_COLLECTION_SUBTITLE = 'No music found.';
          this.STRING_DOWNLOAD_COMPLETED = 'Download Completed.';
          this.STRING_DOWNLOAD_FAILED = 'Download Failed.';
          this.STRING_DISCORD = 'DISCORD SERVER';
          this.STRING_EXIT_TITLE = 'Exit';
          this.STRING_EXIT_SUBTITLE = 'Do you want to exit Spoder?';
          this.STRING_A_TO_Z = 'A to Z';
          this.STRING_DATE_ADDED = 'Date Added';
          this.STRING_SETTING_ACCENT_COLOR_AUTOMATIC = 'Automatic Accent';
          this.STRING_SETTING_MISCELLANEOUS_TITLE = 'Miscellaneous';
          this.STRING_SETTING_MISCELLANEOUS_SUBTITLE =
              'Other settings in the app';
          this.STRING_SETTING_MISCELLANEOUS_ENABLE_IOS_TITLE =
              'Enable iOS mechanics';
          this.STRING_SETTING_MISCELLANEOUS_ENABLE_IOS_SUBTITLE =
              'Set platform to TargetPlatform.iOS';
        }
        break;
    }
    configuration.save(languageRegion: languageRegion);
    this.current = languageRegion;
    this.notifyListeners();
  }
}

Language language;
