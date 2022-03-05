{
  description = ''quickly generate cryptographically secure passwords and phrases'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimpass-master.flake = false;
  inputs.src-nimpass-master.type = "github";
  inputs.src-nimpass-master.owner = "xioren";
  inputs.src-nimpass-master.repo = "NimPass";
  inputs.src-nimpass-master.ref = "refs/heads/master";
  inputs.src-nimpass-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimpass-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimpass-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimpass-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}