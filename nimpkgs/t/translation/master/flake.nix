{
  description = ''Text string translation from free online crowdsourced API. Tinyslation a tiny translation.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-translation-master.flake = false;
  inputs.src-translation-master.type = "github";
  inputs.src-translation-master.owner = "juancarlospaco";
  inputs.src-translation-master.repo = "nim-tinyslation";
  inputs.src-translation-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-translation-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-translation-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-translation-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}