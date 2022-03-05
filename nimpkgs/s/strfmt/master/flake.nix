{
  description = ''A string formatting library inspired by Python's `format`.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-strfmt-master.flake = false;
  inputs.src-strfmt-master.type = "github";
  inputs.src-strfmt-master.owner = "bio-nim";
  inputs.src-strfmt-master.repo = "nim-strfmt";
  inputs.src-strfmt-master.ref = "refs/heads/master";
  inputs.src-strfmt-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-strfmt-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-strfmt-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-strfmt-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}