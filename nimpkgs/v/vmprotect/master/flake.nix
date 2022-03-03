{
  description = ''Wrapper for VMProtect SDK'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-vmprotect-master.flake = false;
  inputs.src-vmprotect-master.type = "github";
  inputs.src-vmprotect-master.owner = "ba0f3";
  inputs.src-vmprotect-master.repo = "vmprotect.nim";
  inputs.src-vmprotect-master.ref = "refs/heads/master";
  inputs.src-vmprotect-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-vmprotect-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-vmprotect-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-vmprotect-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}