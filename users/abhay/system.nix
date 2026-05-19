{
  users.users.abhay = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video" "linger" "libvirtd"];
  };

  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults pwfeedback
      Defaults insults
    '';
  };
}
