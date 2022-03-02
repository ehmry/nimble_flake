{
  description = ''Protobuf implementation in pure Nim that leverages the power of the macro system to not depend on any external tools'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-protobuf-master.flake = false;
  inputs.src-protobuf-master.type = "github";
  inputs.src-protobuf-master.owner = "PMunch";
  inputs.src-protobuf-master.repo = "protobuf-nim";
  inputs.src-protobuf-master.ref = "refs/heads/master";
  
  
  inputs."combparser".type = "github";
  inputs."combparser".owner = "riinr";
  inputs."combparser".repo = "flake-nimble";
  inputs."combparser".ref = "flake-pinning";
  inputs."combparser".dir = "nimpkgs/c/combparser";

  outputs = { self, nixpkgs, flakeNimbleLib, src-protobuf-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-protobuf-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-protobuf-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}