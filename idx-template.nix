{pkgs, branch ? "loic-sharma/decorators", repo ? "https://github.com/loic-sharma/flutter", ...}: {
    packages = [
        pkgs.curl
        pkgs.gnutar
        pkgs.xz
        pkgs.git
        pkgs.busybox
    ];
    bootstrap = ''
        mkdir "$out"
        cp -rf ${./.} "$WS_NAME"
        chmod -R +w "$WS_NAME"
        mv "$WS_NAME" "$out"
        mkdir -p "$out/flutter"
        git clone "${repo}" "$out/flutter/"
        mkdir "$out"/.idx
        cp ${./dev.nix} "$out"/.idx/dev.nix
        install --mode u+rw ${./dev.nix} "$out"/.idx/dev.nix
        chmod -R u+w "$out"
    '';
}