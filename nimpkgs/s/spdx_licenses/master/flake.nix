{
  description = ''A library to retrieve the list of commonly used licenses from the SPDX License List.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-spdx_licenses-master.flake = false;
  inputs.src-spdx_licenses-master.type = "github";
  inputs.src-spdx_licenses-master.owner = "euantorano";
  inputs.src-spdx_licenses-master.repo = "spdx_licenses.nim";
  inputs.src-spdx_licenses-master.ref = "refs/heads/master";
  inputs.src-spdx_licenses-master.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-spdx_licenses-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-spdx_licenses-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-spdx_licenses-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}