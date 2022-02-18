{
  description = ''A simple wrapper providing a convenient reentrant interface for the bcrypt password hashing algorithm.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-easy_bcrypt-2_0_2.flake = false;
  inputs.src-easy_bcrypt-2_0_2.type = "github";
  inputs.src-easy_bcrypt-2_0_2.owner = "Akito13";
  inputs.src-easy_bcrypt-2_0_2.repo = "easy-bcrypt";
  inputs.src-easy_bcrypt-2_0_2.ref = "refs/tags/2.0.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-easy_bcrypt-2_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-easy_bcrypt-2_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-easy_bcrypt-2_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}