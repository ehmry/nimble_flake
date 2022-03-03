{
  description = ''Unicode Character Database (UCD) access for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-unicodedb-v0_2_1.flake = false;
  inputs.src-unicodedb-v0_2_1.type = "github";
  inputs.src-unicodedb-v0_2_1.owner = "nitely";
  inputs.src-unicodedb-v0_2_1.repo = "nim-unicodedb";
  inputs.src-unicodedb-v0_2_1.ref = "refs/tags/v0.2.1";
  inputs.src-unicodedb-v0_2_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-unicodedb-v0_2_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-unicodedb-v0_2_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-unicodedb-v0_2_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}