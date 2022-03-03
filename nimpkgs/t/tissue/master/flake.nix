{
  description = ''Test failing snippets from Nim's issues'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tissue-master.flake = false;
  inputs.src-tissue-master.type = "github";
  inputs.src-tissue-master.owner = "genotrance";
  inputs.src-tissue-master.repo = "tissue";
  inputs.src-tissue-master.ref = "refs/heads/master";
  inputs.src-tissue-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-tissue-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tissue-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tissue-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}