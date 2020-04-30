sh <(curl https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install)

mkdir -m 0755 -p /nix/var/nix/{profiles,gcroots}/per-user/$USER

nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
