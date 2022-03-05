{
  description = ''Canonical JSON according to RFC8785'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-canonicaljson-1_0_2.flake = false;
  inputs.src-canonicaljson-1_0_2.type = "github";
  inputs.src-canonicaljson-1_0_2.owner = "jackhftang";
  inputs.src-canonicaljson-1_0_2.repo = "canonicaljson.nim";
  inputs.src-canonicaljson-1_0_2.ref = "refs/tags/1.0.2";
  inputs.src-canonicaljson-1_0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-canonicaljson-1_0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-canonicaljson-1_0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-canonicaljson-1_0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}