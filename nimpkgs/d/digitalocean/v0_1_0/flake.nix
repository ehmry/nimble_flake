{
  description = ''Wrapper for DigitalOcean HTTP API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-digitalocean-v0_1_0.flake = false;
  inputs.src-digitalocean-v0_1_0.type = "github";
  inputs.src-digitalocean-v0_1_0.owner = "treeform";
  inputs.src-digitalocean-v0_1_0.repo = "digitalocean";
  inputs.src-digitalocean-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-digitalocean-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-digitalocean-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-digitalocean-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-digitalocean-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}