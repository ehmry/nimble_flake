{
  description = ''Argument parser'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nap-v3_0_0.flake = false;
  inputs.src-nap-v3_0_0.type = "github";
  inputs.src-nap-v3_0_0.owner = "madprops";
  inputs.src-nap-v3_0_0.repo = "nap";
  inputs.src-nap-v3_0_0.ref = "refs/tags/v3.0.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nap-v3_0_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nap-v3_0_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nap-v3_0_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}