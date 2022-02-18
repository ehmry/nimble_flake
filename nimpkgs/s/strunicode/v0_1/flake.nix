{
  description = ''Swift-like unicode string handling'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-strunicode-v0_1.flake = false;
  inputs.src-strunicode-v0_1.type = "github";
  inputs.src-strunicode-v0_1.owner = "nitely";
  inputs.src-strunicode-v0_1.repo = "nim-strunicode";
  inputs.src-strunicode-v0_1.ref = "refs/tags/v0.1";
  
  
  inputs."normalize".type = "github";
  inputs."normalize".owner = "riinr";
  inputs."normalize".repo = "flake-nimble";
  inputs."normalize".ref = "flake-pinning";
  inputs."normalize".dir = "nimpkgs/n/normalize";

  
  inputs."graphemes".type = "github";
  inputs."graphemes".owner = "riinr";
  inputs."graphemes".repo = "flake-nimble";
  inputs."graphemes".ref = "flake-pinning";
  inputs."graphemes".dir = "nimpkgs/g/graphemes";

  outputs = { self, nixpkgs, flakeNimbleLib, src-strunicode-v0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-strunicode-v0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-strunicode-v0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}