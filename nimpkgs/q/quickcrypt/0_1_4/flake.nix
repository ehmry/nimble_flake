{
  description = ''A library for quickly and easily encrypting strings & files. User-friendly and highly compatible.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-quickcrypt-0_1_4.flake = false;
  inputs.src-quickcrypt-0_1_4.type = "github";
  inputs.src-quickcrypt-0_1_4.owner = "theAkito";
  inputs.src-quickcrypt-0_1_4.repo = "nim-quickcrypt";
  inputs.src-quickcrypt-0_1_4.ref = "refs/tags/0.1.4";
  inputs.src-quickcrypt-0_1_4.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."nimaes".type = "github";
  inputs."nimaes".owner = "riinr";
  inputs."nimaes".repo = "flake-nimble";
  inputs."nimaes".ref = "flake-pinning";
  inputs."nimaes".dir = "nimpkgs/n/nimaes";
  inputs."nimaes".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimaes".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."neoid".type = "github";
  inputs."neoid".owner = "riinr";
  inputs."neoid".repo = "flake-nimble";
  inputs."neoid".ref = "flake-pinning";
  inputs."neoid".dir = "nimpkgs/n/neoid";
  inputs."neoid".inputs.nixpkgs.follows = "nixpkgs";
  inputs."neoid".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-quickcrypt-0_1_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-quickcrypt-0_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-quickcrypt-0_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}