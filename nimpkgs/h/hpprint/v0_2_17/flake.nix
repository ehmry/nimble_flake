{
  description = ''Pretty-printer'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-hpprint-v0_2_17.flake = false;
  inputs.src-hpprint-v0_2_17.type = "github";
  inputs.src-hpprint-v0_2_17.owner = "haxscramper";
  inputs.src-hpprint-v0_2_17.repo = "hpprint";
  inputs.src-hpprint-v0_2_17.ref = "refs/tags/v0.2.17";
  inputs.src-hpprint-v0_2_17.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."hdrawing".type = "github";
  # inputs."hdrawing".owner = "riinr";
  # inputs."hdrawing".repo = "flake-nimble";
  # inputs."hdrawing".ref = "flake-pinning";
  # inputs."hdrawing".dir = "nimpkgs/h/hdrawing";
  # inputs."hdrawing".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."hdrawing".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."hnimast".type = "github";
  # inputs."hnimast".owner = "riinr";
  # inputs."hnimast".repo = "flake-nimble";
  # inputs."hnimast".ref = "flake-pinning";
  # inputs."hnimast".dir = "nimpkgs/h/hnimast";
  # inputs."hnimast".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."hnimast".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."hmisc".type = "github";
  # inputs."hmisc".owner = "riinr";
  # inputs."hmisc".repo = "flake-nimble";
  # inputs."hmisc".ref = "flake-pinning";
  # inputs."hmisc".dir = "nimpkgs/h/hmisc";
  # inputs."hmisc".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."hmisc".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-hpprint-v0_2_17, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hpprint-v0_2_17;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-hpprint-v0_2_17"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}