{
  description = ''a couchDB client written in Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-mycouch-0_2.flake = false;
  inputs.src-mycouch-0_2.type = "github";
  inputs.src-mycouch-0_2.owner = "hamidb80";
  inputs.src-mycouch-0_2.repo = "mycouch";
  inputs.src-mycouch-0_2.ref = "refs/tags/0.2";
  inputs.src-mycouch-0_2.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."macroutils".type = "github";
  inputs."macroutils".owner = "riinr";
  inputs."macroutils".repo = "flake-nimble";
  inputs."macroutils".ref = "flake-pinning";
  inputs."macroutils".dir = "nimpkgs/m/macroutils";
  inputs."macroutils".inputs.nixpkgs.follows = "nixpkgs";
  inputs."macroutils".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."macroplus".type = "github";
  inputs."macroplus".owner = "riinr";
  inputs."macroplus".repo = "flake-nimble";
  inputs."macroplus".ref = "flake-pinning";
  inputs."macroplus".dir = "nimpkgs/m/macroplus";
  inputs."macroplus".inputs.nixpkgs.follows = "nixpkgs";
  inputs."macroplus".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."https://github.com/hamidb80/coverage".type = "github";
  inputs."https://github.com/hamidb80/coverage".owner = "riinr";
  inputs."https://github.com/hamidb80/coverage".repo = "flake-nimble";
  inputs."https://github.com/hamidb80/coverage".ref = "flake-pinning";
  inputs."https://github.com/hamidb80/coverage".dir = "nimpkgs/h/https://github.com/hamidb80/coverage";
  inputs."https://github.com/hamidb80/coverage".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/hamidb80/coverage".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mycouch-0_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mycouch-0_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mycouch-0_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}