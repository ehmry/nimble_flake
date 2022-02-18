{
  description = ''Windows resource file generator'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-winres-v0_1_0.flake = false;
  inputs.src-winres-v0_1_0.type = "github";
  inputs.src-winres-v0_1_0.owner = "codehz";
  inputs.src-winres-v0_1_0.repo = "nim-winres";
  inputs.src-winres-v0_1_0.ref = "refs/tags/v0.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-winres-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-winres-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-winres-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}