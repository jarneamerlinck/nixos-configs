{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    # needed
    home.stateVersion = "23.05";
    #other
   # home.packages = [vscode ];
    programs.bash.enable = true;
    programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
        yzhang.markdown-all-in-one
  ];
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