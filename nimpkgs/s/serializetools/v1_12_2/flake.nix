{
  description = ''Support for serialization of objects'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-serializetools-v1_12_2.flake = false;
  inputs.src-serializetools-v1_12_2.type = "github";
  inputs.src-serializetools-v1_12_2.owner = "JeffersonLab";
  inputs.src-serializetools-v1_12_2.repo = "serializetools";
  inputs.src-serializetools-v1_12_2.ref = "refs/tags/v1.12.2";
  inputs.src-serializetools-v1_12_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-serializetools-v1_12_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-serializetools-v1_12_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-serializetools-v1_12_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}