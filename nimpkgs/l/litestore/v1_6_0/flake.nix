{
  description = ''A lightweight, self-contained, RESTful, searchable, multi-format NoSQL document store'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-litestore-v1_6_0.flake = false;
  inputs.src-litestore-v1_6_0.type = "github";
  inputs.src-litestore-v1_6_0.owner = "h3rald";
  inputs.src-litestore-v1_6_0.repo = "litestore";
  inputs.src-litestore-v1_6_0.ref = "refs/tags/v1.6.0";
  inputs.src-litestore-v1_6_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-litestore-v1_6_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-litestore-v1_6_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-litestore-v1_6_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}