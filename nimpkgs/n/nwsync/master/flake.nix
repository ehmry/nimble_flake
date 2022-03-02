{
  description = ''NWSync Repository Management utilities'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nwsync-master.flake = false;
  inputs.src-nwsync-master.type = "github";
  inputs.src-nwsync-master.owner = "Beamdog";
  inputs.src-nwsync-master.repo = "nwsync";
  inputs.src-nwsync-master.ref = "refs/heads/master";
  
  
  inputs."neverwinter".type = "github";
  inputs."neverwinter".owner = "riinr";
  inputs."neverwinter".repo = "flake-nimble";
  inputs."neverwinter".ref = "flake-pinning";
  inputs."neverwinter".dir = "nimpkgs/n/neverwinter";

  
  inputs."docopt".type = "github";
  inputs."docopt".owner = "riinr";
  inputs."docopt".repo = "flake-nimble";
  inputs."docopt".ref = "flake-pinning";
  inputs."docopt".dir = "nimpkgs/d/docopt";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nwsync-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nwsync-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nwsync-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}