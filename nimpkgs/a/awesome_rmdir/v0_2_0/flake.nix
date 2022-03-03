{
  description = ''Command to remove acceptably empty directories.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-awesome_rmdir-v0_2_0.flake = false;
  inputs.src-awesome_rmdir-v0_2_0.type = "github";
  inputs.src-awesome_rmdir-v0_2_0.owner = "Araq";
  inputs.src-awesome_rmdir-v0_2_0.repo = "awesome_rmdir";
  inputs.src-awesome_rmdir-v0_2_0.ref = "refs/tags/v0.2.0";
  inputs.src-awesome_rmdir-v0_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-awesome_rmdir-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-awesome_rmdir-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-awesome_rmdir-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}