{
  description = ''EDN and Clojure parser'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-edn-0_2_2.flake = false;
  inputs.src-edn-0_2_2.type = "github";
  inputs.src-edn-0_2_2.owner = "rosado";
  inputs.src-edn-0_2_2.repo = "edn.nim";
  inputs.src-edn-0_2_2.ref = "refs/tags/0.2.2";
  inputs.src-edn-0_2_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-edn-0_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-edn-0_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-edn-0_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}