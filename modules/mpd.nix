{ pkgs, ... }:

{
  programs.mpd = {
    enable = true;
    musicDirectory = "/home/kevinhan0/Music";
    playlistDirectory = "/home/kevinhan0/Music/playlists/";
    extraConfig = ''
      audio_output = {
        type		"httpd"
        name		"HTTP"
        encoder		"lame"
        port		"6601"
        bitrate		"128"
        format		"44100:16:2"
        max_clients	"0"
      }
    '';
  };
}
