{
  description = ''Bindings for zstd'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-zstd-v0_3.flake = false;
  inputs.src-zstd-v0_3.type = "github";
  inputs.src-zstd-v0_3.owner = "wltsmrz";
  inputs.src-zstd-v0_3.repo = "nim_zstd";
  inputs.src-zstd-v0_3.ref = "refs/tags/v0.3";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-zstd-v0_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zstd-v0_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zstd-v0_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}