{
  description = ''.NET-inspired lightweight terminal library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-conio-master.flake = false;
  inputs.src-conio-master.type = "github";
  inputs.src-conio-master.owner = "guevara-chan";
  inputs.src-conio-master.repo = "conio";
  inputs.src-conio-master.ref = "refs/heads/master";
  inputs.src-conio-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-conio-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-conio-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-conio-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}