{
  description = ''quickly generate cryptographically secure passwords and phrases'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimpass-v0_1_0.flake = false;
  inputs.src-nimpass-v0_1_0.type = "github";
  inputs.src-nimpass-v0_1_0.owner = "xioren";
  inputs.src-nimpass-v0_1_0.repo = "NimPass";
  inputs.src-nimpass-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-nimpass-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimpass-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimpass-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimpass-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}