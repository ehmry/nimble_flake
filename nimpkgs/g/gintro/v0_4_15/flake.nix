{
  description = ''High level GObject-Introspection based GTK3 bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-gintro-v0_4_15.flake = false;
  inputs.src-gintro-v0_4_15.type = "github";
  inputs.src-gintro-v0_4_15.owner = "stefansalewski";
  inputs.src-gintro-v0_4_15.repo = "gintro";
  inputs.src-gintro-v0_4_15.ref = "refs/tags/v0.4.15";
  inputs.src-gintro-v0_4_15.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-gintro-v0_4_15, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-gintro-v0_4_15;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-gintro-v0_4_15"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}