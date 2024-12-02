let
pkgs = import <nixpkgs> {};

libraries = with pkgs;[
    #webkitgtk
    #webkitgtk_4_1
    #gtk3
    #cairo
    #gdk-pixbuf
    #glib
    #dbus
    #openssl_3
    openssl
    #libayatana-appindicator
    #librsvg
];

packages = with pkgs; [
  cargo
  rustc
  #rustup

  rust-analyzer
  rustfmt

  openssl
];

in
pkgs.mkShell {
  buildInputs = packages;

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH
  '';
}
