{
  description = ''A nice and icy ZSH prompt in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nicy-v2_4_2.flake = false;
  inputs.src-nicy-v2_4_2.type = "github";
  inputs.src-nicy-v2_4_2.owner = "icyphox";
  inputs.src-nicy-v2_4_2.repo = "nicy";
  inputs.src-nicy-v2_4_2.ref = "refs/tags/v2.4.2";
  inputs.src-nicy-v2_4_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nicy-v2_4_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nicy-v2_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nicy-v2_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}