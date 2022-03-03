{
  description = ''Bindings to libopusenc'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-opusenc-v0_2_0.flake = false;
  inputs.src-opusenc-v0_2_0.type = "other";
  inputs.src-opusenc-v0_2_0.owner = "~ehmry";
  inputs.src-opusenc-v0_2_0.repo = "nim_opusenc";
  inputs.src-opusenc-v0_2_0.ref = "refs/tags/v0.2.0";
  inputs.src-opusenc-v0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-opusenc-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-opusenc-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-opusenc-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}