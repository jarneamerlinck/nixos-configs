{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    # needed
    home.stateVersion = "23.05";
    #other
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;
    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
    };
    gtk = {
        enable = true;
        font.name = "Victor Mono SemiBold 12";
        theme = {
            name = "Pop-Dark";
            package = pkgs.pop-gtk-theme;
        };
};
}