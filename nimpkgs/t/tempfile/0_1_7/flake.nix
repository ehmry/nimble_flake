{
  description = ''Temporary files and directories'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-tempfile-0_1_7.flake = false;
  inputs.src-tempfile-0_1_7.type = "github";
  inputs.src-tempfile-0_1_7.owner = "OpenSystemsLab";
  inputs.src-tempfile-0_1_7.repo = "tempfile.nim";
  inputs.src-tempfile-0_1_7.ref = "refs/tags/0.1.7";
  inputs.src-tempfile-0_1_7.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-tempfile-0_1_7, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-tempfile-0_1_7;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-tempfile-0_1_7"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}