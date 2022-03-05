{
  description = ''Low-level multisync bindings to the ListenBrainz web API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-listenbrainz-0_1_2.flake = false;
  inputs.src-listenbrainz-0_1_2.type = "gitlab";
  inputs.src-listenbrainz-0_1_2.owner = "tandy1000";
  inputs.src-listenbrainz-0_1_2.repo = "listenbrainz-nim";
  inputs.src-listenbrainz-0_1_2.ref = "refs/tags/0.1.2";
  inputs.src-listenbrainz-0_1_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-listenbrainz-0_1_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-listenbrainz-0_1_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-listenbrainz-0_1_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}