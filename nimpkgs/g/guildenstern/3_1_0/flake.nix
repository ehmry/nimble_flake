{
  description = ''Modular multithreading Linux HTTP server'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-guildenstern-3_1_0.flake = false;
  inputs.src-guildenstern-3_1_0.type = "github";
  inputs.src-guildenstern-3_1_0.owner = "olliNiinivaara";
  inputs.src-guildenstern-3_1_0.repo = "GuildenStern";
  inputs.src-guildenstern-3_1_0.ref = "refs/tags/3.1.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-guildenstern-3_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-guildenstern-3_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-guildenstern-3_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}