{
  description = ''xam'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-xam-1_6_0.flake = false;
  inputs.src-xam-1_6_0.type = "github";
  inputs.src-xam-1_6_0.owner = "j-a-s-d";
  inputs.src-xam-1_6_0.repo = "xam";
  inputs.src-xam-1_6_0.ref = "refs/tags/1.6.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-xam-1_6_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-xam-1_6_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-xam-1_6_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}