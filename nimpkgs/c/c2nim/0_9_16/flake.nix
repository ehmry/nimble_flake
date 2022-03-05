{
  description = ''c2nim is a tool to translate Ansi C code to Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-c2nim-0_9_16.flake = false;
  inputs.src-c2nim-0_9_16.type = "github";
  inputs.src-c2nim-0_9_16.owner = "nim-lang";
  inputs.src-c2nim-0_9_16.repo = "c2nim";
  inputs.src-c2nim-0_9_16.ref = "refs/tags/0.9.16";
  inputs.src-c2nim-0_9_16.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-c2nim-0_9_16, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-c2nim-0_9_16;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-c2nim-0_9_16"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}