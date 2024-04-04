{
  virtualisation = {
    libvirtd.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
