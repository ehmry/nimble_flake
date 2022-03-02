{
  description = ''IUP FFI bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-niup-3_27_4.flake = false;
  inputs.src-niup-3_27_4.type = "github";
  inputs.src-niup-3_27_4.owner = "dariolah";
  inputs.src-niup-3_27_4.repo = "niup";
  inputs.src-niup-3_27_4.ref = "refs/tags/3.27.4";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-niup-3_27_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-niup-3_27_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-niup-3_27_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}