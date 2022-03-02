{
  description = ''HTTP Cookies for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-cookiejar-v0_3_0.flake = false;
  inputs.src-cookiejar-v0_3_0.type = "github";
  inputs.src-cookiejar-v0_3_0.owner = "planety";
  inputs.src-cookiejar-v0_3_0.repo = "cookiejar";
  inputs.src-cookiejar-v0_3_0.ref = "refs/tags/v0.3.0";
  inputs.src-cookiejar-v0_3_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-cookiejar-v0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-cookiejar-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-cookiejar-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}