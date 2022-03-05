{
  description = ''Simple command line tool to make git more intuitive, along with useful GitHub addons.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-fugitive-master.flake = false;
  inputs.src-fugitive-master.type = "github";
  inputs.src-fugitive-master.owner = "haltcase";
  inputs.src-fugitive-master.repo = "fugitive";
  inputs.src-fugitive-master.ref = "refs/heads/master";
  inputs.src-fugitive-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."gara".type = "github";
  inputs."gara".owner = "riinr";
  inputs."gara".repo = "flake-nimble";
  inputs."gara".ref = "flake-pinning";
  inputs."gara".dir = "nimpkgs/g/gara";
  inputs."gara".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gara".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."tempfile".type = "github";
  inputs."tempfile".owner = "riinr";
  inputs."tempfile".repo = "flake-nimble";
  inputs."tempfile".ref = "flake-pinning";
  inputs."tempfile".dir = "nimpkgs/t/tempfile";
  inputs."tempfile".inputs.nixpkgs.follows = "nixpkgs";
  inputs."tempfile".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."unpack".type = "github";
  inputs."unpack".owner = "riinr";
  inputs."unpack".repo = "flake-nimble";
  inputs."unpack".ref = "flake-pinning";
  inputs."unpack".dir = "nimpkgs/u/unpack";
  inputs."unpack".inputs.nixpkgs.follows = "nixpkgs";
  inputs."unpack".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-fugitive-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fugitive-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-fugitive-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}