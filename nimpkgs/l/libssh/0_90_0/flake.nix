{
  description = ''libssh FFI bindings'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-libssh-0_90_0.flake = false;
  inputs.src-libssh-0_90_0.type = "github";
  inputs.src-libssh-0_90_0.owner = "dariolah";
  inputs.src-libssh-0_90_0.repo = "libssh-nim";
  inputs.src-libssh-0_90_0.ref = "refs/tags/0.90.0";
  inputs.src-libssh-0_90_0.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-libssh-0_90_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-libssh-0_90_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-libssh-0_90_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}