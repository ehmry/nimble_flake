{
  description = ''TIC-80 bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tic80-master.flake = false;
  inputs.src-tic80-master.type = "github";
  inputs.src-tic80-master.owner = "thisago";
  inputs.src-tic80-master.repo = "tic80";
  inputs.src-tic80-master.ref = "refs/heads/master";
  inputs.src-tic80-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-tic80-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tic80-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tic80-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}