{
  description = "Flake shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        { pkgs, system, ... }:
        let
          buildPackages = with pkgs; [
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
            pkg-config
            ncurses
          ];
        in
        {
          devShells = {
            default =
              (pkgs.mkShell.override {
                stdenv = pkgs.pkgsLLVM.llvmPackages_18.stdenv;
              })
                {
                  nativeBuildInputs = buildPackages;

                  HOSTCC = "clang";
                  HOSTCXX = "clang++";
                  LLVM_IAS = 1;
                  LLVM = 1;
                  HOSTLD = "ld.lld";
                  HOSTAR = "llvm-ar";

                  ARCH = "arm64";
                };
            fhs =
              (pkgs.buildFHSEnv {
                name = "kernel-build-env";
                targetPkgs =
                  pkgs_:
                  (
                    with pkgs_;
                    [
                      pkgsCross.aarch64-android.llvmPackages_18.clangUseLLVM
                      pkgsCross.aarch64-multiplatform.gcc
                    ]
                    ++ buildPackages
                  );
                runScript = pkgs.writeShellScript "init" ''
                  # CC=clang
                  export LD=ld.lld NM=llvm-nm STRIP=llvm-strip OBJCOPY=llvm-objcopy
                  export OBJDUMP=llvm-objdump READELF=llvm-readelf LLVM_IAS=1 LLVM=1
                  export HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld HOSTAR=llvm-ar
                  export CLANG_TRIPLE="aarch64-linux-gnu-"
                  export CROSS_COMPILE="aarch64-linux-android-"
                  export CROSS_COMPILE_ARM32="arm-linux-androideabi-"
                  export PKG_CONFIG_PATH="${pkgs.ncurses.dev}/lib/pkgconfig:"
                  exec bash
                '';
              }).env;
          };
        };
    };
}
