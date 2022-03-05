{
  description = ''OwO text convewtew fow Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-owo-master.flake = false;
  inputs.src-owo-master.type = "github";
  inputs.src-owo-master.owner = "lmariscal";
  inputs.src-owo-master.repo = "owo";
  inputs.src-owo-master.ref = "refs/heads/master";
  inputs.src-owo-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-owo-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-owo-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-owo-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}