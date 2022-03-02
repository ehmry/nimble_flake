{
  description = ''Indie assembler/linker for Android's Dalvik VM .dex & .apk files'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-dali-v0_2_1.flake = false;
  inputs.src-dali-v0_2_1.type = "github";
  inputs.src-dali-v0_2_1.owner = "akavel";
  inputs.src-dali-v0_2_1.repo = "dali";
  inputs.src-dali-v0_2_1.ref = "refs/tags/v0.2.1";
  inputs.src-dali-v0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."patty".type = "github";
  # inputs."patty".owner = "riinr";
  # inputs."patty".repo = "flake-nimble";
  # inputs."patty".ref = "flake-pinning";
  # inputs."patty".dir = "nimpkgs/p/patty";
  # inputs."patty".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."patty".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-dali-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dali-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dali-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}