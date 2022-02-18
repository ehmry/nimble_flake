{
  description = ''NWSync Repository Management utilities'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nwsync-0_4_1.flake = false;
  inputs.src-nwsync-0_4_1.type = "github";
  inputs.src-nwsync-0_4_1.owner = "Beamdog";
  inputs.src-nwsync-0_4_1.repo = "nwsync";
  inputs.src-nwsync-0_4_1.ref = "refs/tags/0.4.1";
  
  
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

  outputs = { self, nixpkgs, flakeNimbleLib, src-nwsync-0_4_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nwsync-0_4_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nwsync-0_4_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}