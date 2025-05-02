{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  config = {
    # Styling options
    stylix.targets.firefox = {
			enable = false;
      profileNames = ["default"];

			# Enable when new release of stylix/NixOS comes out (currently not available in 24.11 but option added in https://github.com/danth/stylix/commit/3a686a20b8f4dc026e561c1c5a85671c8cfeeb4f)
      # colorTheme.enable = true;
    };

    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          isDefault = true;

          userChrome = builtins.readFile ./userChrome.css + builtins.readFile ./sidebar.css;

          # extensions = {
          #   packages = with pkgs.nur.repos.rycee.firefox-addons; [
          #     ublock-origin
          #     sponsorblock
          #     sidebery
          #     betterttv
          #   ];

          # 	settings."sidebery".settings = builtins.readFile ./extensions/sidebery-settings.json;
          # };

          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            sidebery
            betterttv
          ];

          search = {
            force = true;
            default = "DuckDuckGo";
          };

          settings = {
            "browser.startup.homepage" = "about:home";

            # Enable custom stylesheets
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            # Auto enable extensions
            "extensions.autoDisableScopes" = 0;
            # Disable bookmark bar
            "browser.toolbars.bookmarks.visibility" = "never";

            # Disable irritating first-run stuff
            "browser.disableResetPrompt" = true;
            "browser.download.panel.shown" = true;
            "browser.feeds.showFirstRunUI" = false;
            "browser.messaging-system.whatsNewPanel.enabled" = false;
            "browser.rights.3.shown" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.shell.defaultBrowserCheckCount" = 1;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.uitour.enabled" = false;
            "startup.homepage_override_url" = "";
            "trailhead.firstrun.didSeeAboutWelcome" = true;
            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.bookmarks.addedImportButton" = true;

            # Don't ask for download dir
            "browser.download.useDownloadDir" = false;

            # Disable crappy home activity stream page
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
            "browser.newtabpage.blocked" = lib.genAttrs [
              # Youtube
              "26UbzFJ7qT9/4DhodHKA1Q=="
              # Facebook
              "4gPpjkxgZzXPVtuEoAL9Ig=="
              # Wikipedia
              "eV8/WsSLxHadrTL1gAxhug=="
              # Reddit
              "gLv0ja2RYVgxKdp0I5qwvA=="
              # Amazon
              "K00ILysCaEq8+bEqV/3nuw=="
              # Twitter
              "T9nJot5PurhJSy8n038xGA=="
            ] (_: 1);

            # Disable some telemetry
            "app.shield.optoutstudies.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "datareporting.healthreport.service.enabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.sessions.current.clean" = true;
            "devtools.onboarding.telemetry.logged" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.prompted" = 2;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.unifiedIsOptIn" = false;
            "toolkit.telemetry.updatePing.enabled" = false;

            # Disable fx accounts
            "identity.fxaccounts.enabled" = false;
            # Disable "save password" prompt
            "signon.rememberSignons" = false;
            # Harden
            "privacy.trackingprotection.enabled" = true;
            "dom.security.https_only_mode" = true;
          };
        };
      };
    };
  };
}
