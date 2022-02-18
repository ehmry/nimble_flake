{
  description = ''apache arrow and parquet c api bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimarrow_glib-v0_1_1.flake = false;
  inputs.src-nimarrow_glib-v0_1_1.type = "github";
  inputs.src-nimarrow_glib-v0_1_1.owner = "emef";
  inputs.src-nimarrow_glib-v0_1_1.repo = "nimarrow_glib";
  inputs.src-nimarrow_glib-v0_1_1.ref = "refs/tags/v0.1.1";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimarrow_glib-v0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimarrow_glib-v0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimarrow_glib-v0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}