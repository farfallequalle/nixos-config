{ ... }:
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 51.0;
    longitude = 10.0;
    temperature = {
      day = 6500;
      night = 4500;
    };
    settings = {
      general = {
        adjustment-method = "wayland";
      };
    };
  };
}
