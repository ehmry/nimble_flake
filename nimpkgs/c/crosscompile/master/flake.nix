{
  description = ''Crosscompile Nim source code into multiple targets on Linux with this proc.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-crosscompile-master.flake = false;
  inputs.src-crosscompile-master.type = "github";
  inputs.src-crosscompile-master.owner = "juancarlospaco";
  inputs.src-crosscompile-master.repo = "nim-crosscompile";
  inputs.src-crosscompile-master.ref = "refs/heads/master";
  
  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";

  outputs = { self, nixpkgs, flakeNimbleLib, src-crosscompile-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-crosscompile-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-crosscompile-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}