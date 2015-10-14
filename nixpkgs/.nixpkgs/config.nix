{
  packageOverrides = pkgs : with pkgs; {
    urbitEnv = pkgs.myEnvFun {
      name = "urbit";
      buildInputs = [stdenv gmp libsigsegv openssl automake autoconf libtool];
    };
  };
}
