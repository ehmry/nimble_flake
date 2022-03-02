{
  description = ''Bindings to the high-level Argon2 C API'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-argon2_bind-v0_1_0.flake = false;
  inputs.src-argon2_bind-v0_1_0.type = "github";
  inputs.src-argon2_bind-v0_1_0.owner = "D-Nice";
  inputs.src-argon2_bind-v0_1_0.repo = "argon2_bind";
  inputs.src-argon2_bind-v0_1_0.ref = "refs/tags/v0.1.0";
  inputs.src-argon2_bind-v0_1_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-argon2_bind-v0_1_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argon2_bind-v0_1_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-argon2_bind-v0_1_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}