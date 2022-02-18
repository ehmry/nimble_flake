{
  description = ''soundex algorithm'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-soundex-master.flake = false;
  inputs.src-soundex-master.type = "github";
  inputs.src-soundex-master.owner = "Kashiwara0205";
  inputs.src-soundex-master.repo = "soundex";
  inputs.src-soundex-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-soundex-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-soundex-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-soundex-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}