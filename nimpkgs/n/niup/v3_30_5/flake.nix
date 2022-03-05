{
  description = ''IUP FFI bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-niup-v3_30_5.flake = false;
  inputs.src-niup-v3_30_5.type = "github";
  inputs.src-niup-v3_30_5.owner = "dariolah";
  inputs.src-niup-v3_30_5.repo = "niup";
  inputs.src-niup-v3_30_5.ref = "refs/tags/v3.30.5";
  inputs.src-niup-v3_30_5.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-niup-v3_30_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-niup-v3_30_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-niup-v3_30_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}