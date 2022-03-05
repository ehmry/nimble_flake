{
  description = ''Calendars, Timestamps and Timezones utilities.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-chrono-0_1_0.flake = false;
  inputs.src-chrono-0_1_0.type = "github";
  inputs.src-chrono-0_1_0.owner = "treeform";
  inputs.src-chrono-0_1_0.repo = "chrono";
  inputs.src-chrono-0_1_0.ref = "refs/tags/0.1.0";
  inputs.src-chrono-0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";
  inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-chrono-0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-chrono-0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-chrono-0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}