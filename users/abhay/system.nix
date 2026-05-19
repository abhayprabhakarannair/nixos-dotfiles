{pkgs, ...}: {
  users.users.abhay = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video" "linger" "libvirtd"];
  };
}
