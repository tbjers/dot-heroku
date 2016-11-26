#!/usr/bin/env bash

pkg.install() {
  case $(os.platform) in
    linux)
      if utils.cmd_exists apt-get; then
        utils.run_installer https://toolbelt.heroku.com/install-ubuntu.sh
        heroku --version
      else
        utils.run_installer https://toolbelt.heroku.com/install.sh
        heroku --version
      fi
      ;;
  esac
}

pkg.uninstall() {
  case $(os.platform) in
    linux)
      if utils.cmd_exists apt-get; then
        sudo apt-get remove heroku-toolbelt \
          && rm /etc/apt/sources.list.d/heroku.list
      else
        sudo rm -rf /usr/local/heroku \
          && rm -rf ~/.heroku ~/.local/share/heroku \
                    ~/.config/heroku ~/.cache/heroku
      fi
      ;;
  esac
}

