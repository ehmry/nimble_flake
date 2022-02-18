{
  description = ''functions to tracks for genomics data files'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-genoiser-master.flake = false;
  inputs.src-genoiser-master.type = "github";
  inputs.src-genoiser-master.owner = "brentp";
  inputs.src-genoiser-master.repo = "genoiser";
  inputs.src-genoiser-master.ref = "refs/heads/master";
  
  
  inputs."hts".type = "github";
  inputs."hts".owner = "riinr";
  inputs."hts".repo = "flake-nimble";
  inputs."hts".ref = "flake-pinning";
  inputs."hts".dir = "nimpkgs/h/hts";

  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  
  inputs."kexpr".type = "github";
  inputs."kexpr".owner = "riinr";
  inputs."kexpr".repo = "flake-nimble";
  inputs."kexpr".ref = "flake-pinning";
  inputs."kexpr".dir = "nimpkgs/k/kexpr";

  outputs = { self, nixpkgs, flakeNimbleLib, src-genoiser-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-genoiser-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-genoiser-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}