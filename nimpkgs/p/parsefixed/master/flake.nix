{
  description = ''Parse fixed-width fields within lines of text (complementary to parsecsv)'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-parsefixed-master.flake = false;
  inputs.src-parsefixed-master.type = "github";
  inputs.src-parsefixed-master.owner = "jlp765";
  inputs.src-parsefixed-master.repo = "parsefixed";
  inputs.src-parsefixed-master.ref = "refs/heads/master";
  inputs.src-parsefixed-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-parseFixed-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-parseFixed-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-parseFixed-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}