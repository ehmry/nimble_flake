{
  description = ''Linux Seccomp sandbox library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-seccomp-0_2_0.flake = false;
  inputs.src-seccomp-0_2_0.type = "github";
  inputs.src-seccomp-0_2_0.owner = "FedericoCeratto";
  inputs.src-seccomp-0_2_0.repo = "nim-seccomp";
  inputs.src-seccomp-0_2_0.ref = "refs/tags/0.2.0";
  inputs.src-seccomp-0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-seccomp-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-seccomp-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-seccomp-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}