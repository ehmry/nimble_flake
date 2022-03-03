{
  description = ''IUP FFI bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-niup-3_30_2.flake = false;
  inputs.src-niup-3_30_2.type = "github";
  inputs.src-niup-3_30_2.owner = "dariolah";
  inputs.src-niup-3_30_2.repo = "niup";
  inputs.src-niup-3_30_2.ref = "refs/tags/3.30.2";
  inputs.src-niup-3_30_2.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-niup-3_30_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-niup-3_30_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-niup-3_30_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}