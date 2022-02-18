{
  description = ''NWSync Repository Management utilities'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nwsync-0_2_0.flake = false;
  inputs.src-nwsync-0_2_0.type = "github";
  inputs.src-nwsync-0_2_0.owner = "Beamdog";
  inputs.src-nwsync-0_2_0.repo = "nwsync";
  inputs.src-nwsync-0_2_0.ref = "refs/tags/0.2.0";
  
  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";

  
  inputs."neverwinter".type = "github";
  inputs."neverwinter".owner = "riinr";
  inputs."neverwinter".repo = "flake-nimble";
  inputs."neverwinter".ref = "flake-pinning";
  inputs."neverwinter".dir = "nimpkgs/n/neverwinter";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nwsync-0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nwsync-0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nwsync-0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}