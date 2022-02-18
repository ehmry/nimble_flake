{
  description = ''A tensor (multidimensional array) library for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-arraymancer-master.flake = false;
  inputs.src-arraymancer-master.type = "github";
  inputs.src-arraymancer-master.owner = "mratsim";
  inputs.src-arraymancer-master.repo = "Arraymancer";
  inputs.src-arraymancer-master.ref = "refs/heads/master";
  
  
  inputs."nimblas".type = "github";
  inputs."nimblas".owner = "riinr";
  inputs."nimblas".repo = "flake-nimble";
  inputs."nimblas".ref = "flake-pinning";
  inputs."nimblas".dir = "nimpkgs/n/nimblas";

  
  inputs."nimlapack".type = "github";
  inputs."nimlapack".owner = "riinr";
  inputs."nimlapack".repo = "flake-nimble";
  inputs."nimlapack".ref = "flake-pinning";
  inputs."nimlapack".dir = "nimpkgs/n/nimlapack";

  
  inputs."nimcuda".type = "github";
  inputs."nimcuda".owner = "riinr";
  inputs."nimcuda".repo = "flake-nimble";
  inputs."nimcuda".ref = "flake-pinning";
  inputs."nimcuda".dir = "nimpkgs/n/nimcuda";

  
  inputs."nimcl".type = "github";
  inputs."nimcl".owner = "riinr";
  inputs."nimcl".repo = "flake-nimble";
  inputs."nimcl".ref = "flake-pinning";
  inputs."nimcl".dir = "nimpkgs/n/nimcl";

  
  inputs."clblast".type = "github";
  inputs."clblast".owner = "riinr";
  inputs."clblast".repo = "flake-nimble";
  inputs."clblast".ref = "flake-pinning";
  inputs."clblast".dir = "nimpkgs/c/clblast";

  
  inputs."stb_image".type = "github";
  inputs."stb_image".owner = "riinr";
  inputs."stb_image".repo = "flake-nimble";
  inputs."stb_image".ref = "flake-pinning";
  inputs."stb_image".dir = "nimpkgs/s/stb_image";

  
  inputs."zip".type = "github";
  inputs."zip".owner = "riinr";
  inputs."zip".repo = "flake-nimble";
  inputs."zip".ref = "flake-pinning";
  inputs."zip".dir = "nimpkgs/z/zip";

  
  inputs."untar".type = "github";
  inputs."untar".owner = "riinr";
  inputs."untar".repo = "flake-nimble";
  inputs."untar".ref = "flake-pinning";
  inputs."untar".dir = "nimpkgs/u/untar";

  outputs = { self, nixpkgs, flakeNimbleLib, src-arraymancer-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arraymancer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-arraymancer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}