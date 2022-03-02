{
  description = ''A Nim IDE.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-aporia-master.flake = false;
  inputs.src-aporia-master.type = "github";
  inputs.src-aporia-master.owner = "nim-lang";
  inputs.src-aporia-master.repo = "Aporia";
  inputs.src-aporia-master.ref = "refs/heads/master";
  inputs.src-aporia-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."gtk2".type = "github";
  # inputs."gtk2".owner = "riinr";
  # inputs."gtk2".repo = "flake-nimble";
  # inputs."gtk2".ref = "flake-pinning";
  # inputs."gtk2".dir = "nimpkgs/g/gtk2";
  # inputs."gtk2".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."gtk2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."dialogs".type = "github";
  # inputs."dialogs".owner = "riinr";
  # inputs."dialogs".repo = "flake-nimble";
  # inputs."dialogs".ref = "flake-pinning";
  # inputs."dialogs".dir = "nimpkgs/d/dialogs";
  # inputs."dialogs".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."dialogs".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-aporia-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-aporia-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-aporia-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}