{
  description = ''Perlin noise and Simplex noise generation'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-perlin-0_4_0.flake = false;
  inputs.src-perlin-0_4_0.type = "github";
  inputs.src-perlin-0_4_0.owner = "Nycto";
  inputs.src-perlin-0_4_0.repo = "PerlinNim";
  inputs.src-perlin-0_4_0.ref = "refs/tags/0.4.0";
  
  
  inputs."random".type = "github";
  inputs."random".owner = "riinr";
  inputs."random".repo = "flake-nimble";
  inputs."random".ref = "flake-pinning";
  inputs."random".dir = "nimpkgs/r/random";

  outputs = { self, nixpkgs, flakeNimbleLib, src-perlin-0_4_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-perlin-0_4_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-perlin-0_4_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}