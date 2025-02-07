{
  description = "Flake shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        { pkgs, system, ... }:
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
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
              clang
              llvmPackages.bintools
            ];

            CC = "clang";
            HOSTCC = "clang";
            HOSTCXX = "clang++";
            LD = "ld.lld";
            NM = "llvm-nm";
            STRIP = "llvm-strip";
            OBJCOPY = "llvm-objcopy";
            OBJDUMP = "llvm-objdump";
            READELF = "llvm-readelf";
            LLVM_IAS = 1;
            HOSTLD = "ld.lld";
            HOSTAR = "llvm-ar";
          };
        };
    };
}
