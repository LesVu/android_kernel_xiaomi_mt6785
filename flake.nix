{
  description = "Flake shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      perSystem = { pkgs, system, ... }: {
        devShells.default = (pkgs.mkShell.override {
          stdenv = pkgs.pkgsLLVM.llvmPackages_18.stdenv;
        }) {
          packages = with pkgs; [
            nil
            nixfmt-classic
            git
            gnumake
            bc
            bison
            curl
            zip
            kmod
            cpio
            flex
            libelf
            openssl
            libtommath
            wget
            dtc
            cacert
            python3
            xz
          ];

          HOSTCC = "clang";
          HOSTCXX = "clang++";
          LLVM_IAS = 1;
          HOSTLD = "ld.lld";
          HOSTAR = "llvm-ar";
       };
      };
    };
}
