{
  description = ''Simple UI components for the terminal.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-termui-master.flake = false;
  inputs.src-termui-master.type = "github";
  inputs.src-termui-master.owner = "jjv360";
  inputs.src-termui-master.repo = "nim-termui";
  inputs.src-termui-master.ref = "refs/heads/master";
  
  
  inputs."classes".type = "github";
  inputs."classes".owner = "riinr";
  inputs."classes".repo = "flake-nimble";
  inputs."classes".ref = "flake-pinning";
  inputs."classes".dir = "nimpkgs/c/classes";

  
  inputs."elvis".type = "github";
  inputs."elvis".owner = "riinr";
  inputs."elvis".repo = "flake-nimble";
  inputs."elvis".ref = "flake-pinning";
  inputs."elvis".dir = "nimpkgs/e/elvis";

  outputs = { self, nixpkgs, flakeNimbleLib, src-termui-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-termui-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-termui-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}