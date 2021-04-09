with import <nixpkgs> { };
let
  pname = "readwise2directory";
  version = "0.0.1";
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "2.0.0";
  });

  customPython = mach-nix.mkPython {
    python = python38;
    requirements = ''
requests
 Django
 Unidecode
 pathvalidate
 pandas
 chromedriver
 selenium
          '';
  };
in mkShell {
  buildInputs = [ customPython];
}
