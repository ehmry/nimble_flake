{
  description = ''Master Password command line utility'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mpwc-v0_1_0.flake = false;
  inputs.src-mpwc-v0_1_0.type = "github";
  inputs.src-mpwc-v0_1_0.owner = "SolitudeSF";
  inputs.src-mpwc-v0_1_0.repo = "mpwc";
  inputs.src-mpwc-v0_1_0.ref = "refs/tags/v0.1.0";
  
  
  inputs."masterpassword".type = "github";
  inputs."masterpassword".owner = "riinr";
  inputs."masterpassword".repo = "flake-nimble";
  inputs."masterpassword".ref = "flake-pinning";
  inputs."masterpassword".dir = "nimpkgs/m/masterpassword";

  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mpwc-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mpwc-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mpwc-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}