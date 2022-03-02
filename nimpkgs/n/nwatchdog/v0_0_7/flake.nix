{
  description = ''Simple watchdog (watch file changes modified, deleted, created) in nim lang.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nwatchdog-v0_0_7.flake = false;
  inputs.src-nwatchdog-v0_0_7.type = "github";
  inputs.src-nwatchdog-v0_0_7.owner = "zendbit";
  inputs.src-nwatchdog-v0_0_7.repo = "nim.nwatchdog";
  inputs.src-nwatchdog-v0_0_7.ref = "refs/tags/v0.0.7";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nwatchdog-v0_0_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nwatchdog-v0_0_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nwatchdog-v0_0_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}