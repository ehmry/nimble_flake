{
  description = ''Wrapper around libopus'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-opussum-0_4_2.flake = false;
  inputs.src-opussum-0_4_2.type = "github";
  inputs.src-opussum-0_4_2.owner = "ire4ever1190";
  inputs.src-opussum-0_4_2.repo = "opussum";
  inputs.src-opussum-0_4_2.ref = "refs/tags/0.4.2";
  inputs.src-opussum-0_4_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-opussum-0_4_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-opussum-0_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-opussum-0_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}