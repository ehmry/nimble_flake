{
  description = ''IPC interface to sway (or i3) compositors'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-swayipc-3_1_4.flake = false;
  inputs.src-swayipc-3_1_4.type = "github";
  inputs.src-swayipc-3_1_4.owner = "disruptek";
  inputs.src-swayipc-3_1_4.repo = "swayipc";
  inputs.src-swayipc-3_1_4.ref = "refs/tags/3.1.4";
  
  
  inputs."nesm".type = "github";
  inputs."nesm".owner = "riinr";
  inputs."nesm".repo = "flake-nimble";
  inputs."nesm".ref = "flake-pinning";
  inputs."nesm".dir = "nimpkgs/n/nesm";

  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, flakeNimbleLib, src-swayipc-3_1_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-swayipc-3_1_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-swayipc-3_1_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}