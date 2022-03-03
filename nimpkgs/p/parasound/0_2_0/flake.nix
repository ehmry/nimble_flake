{
  description = ''A library for playing audio files'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-parasound-0_2_0.flake = false;
  inputs.src-parasound-0_2_0.type = "github";
  inputs.src-parasound-0_2_0.owner = "paranim";
  inputs.src-parasound-0_2_0.repo = "parasound";
  inputs.src-parasound-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-parasound-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-parasound-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-parasound-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-parasound-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}