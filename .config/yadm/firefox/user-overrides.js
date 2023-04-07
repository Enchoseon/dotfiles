/*
 * Arkenfox: Usability Tweaks
 ***/

/* Enable session restore, keep history ***/
user_pref("browser.startup.page", 3);
user_pref("browser.sessionstore.privacy_level", 0);

/* Don't clear cookies, cache, history, or sessions ***/
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.cache", false);
user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);
user_pref("privacy.cpd.history", false);

/* Enable search through location bar ***/
user_pref("keyword.enabled", true);

/* Enable suggestions ***/
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

/* .Less-strict cross-origin policy ***/
user_pref("network.http.referer.XOriginPolicy", 0);

/* Use disk cache ***/
user_pref("browser.cache.disk.enable", true);

/* Disable Letterboxing ***/
user_pref("privacy.resistFingerprinting.letterboxing", false);

/*
 * Arkenfox: Further Hardening
 ***/

/* Don't save passwords **/
user_pref("signon.rememberSignons", false);

/*
 * Non-Arkenfox
 ***/

/* Enable userchrome tweaks ***/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

/* Prefer Native KDE Dialogs ***/
user_pref("widget.use-xdg-desktop-portal", true);

/* Allow modification of SVGs ***/
user_pref("svg.context-properties.content.enabled", true);

/* Don't tell OS to play sounds when CTRL+F'ing (on default KDE this is a water splash effect) ***/
user_pref("accessibility.typeaheadfind.enablesound", false);

/* Use KDE (Dolphin) Filepicker over Nautilus (GNOME) ***/
user_pref("widget.use-xdg-desktop-portal", true);

/* Stop launching in different virtual desktops ***/
user_pref("widget.disable-workspace-management", true);
