{
  description = ''Simple web to share books, Calibre, Jester, Spectre CSS, No JavaScript, WebP & ZIP to reduce bandwidth'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-biblioteca_guarrilla-master.flake = false;
  inputs.src-biblioteca_guarrilla-master.type = "github";
  inputs.src-biblioteca_guarrilla-master.owner = "juancarlospaco";
  inputs.src-biblioteca_guarrilla-master.repo = "biblioteca-guarrilla";
  inputs.src-biblioteca_guarrilla-master.ref = "refs/heads/master";
  inputs.src-biblioteca_guarrilla-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."jester".type = "github";
  # inputs."jester".owner = "riinr";
  # inputs."jester".repo = "flake-nimble";
  # inputs."jester".ref = "flake-pinning";
  # inputs."jester".dir = "nimpkgs/j/jester";
  # inputs."jester".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."jester".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."webp".type = "github";
  # inputs."webp".owner = "riinr";
  # inputs."webp".repo = "flake-nimble";
  # inputs."webp".ref = "flake-pinning";
  # inputs."webp".dir = "nimpkgs/w/webp";
  # inputs."webp".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."webp".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."zip".type = "github";
  # inputs."zip".owner = "riinr";
  # inputs."zip".repo = "flake-nimble";
  # inputs."zip".ref = "flake-pinning";
  # inputs."zip".dir = "nimpkgs/z/zip";
  # inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-biblioteca_guarrilla-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-biblioteca_guarrilla-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-biblioteca_guarrilla-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}