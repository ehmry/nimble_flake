{
  description = ''A simple task runner. Run tasks and watch file changes with custom paths.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-monit-v1_2_2.flake = false;
  inputs.src-monit-v1_2_2.type = "github";
  inputs.src-monit-v1_2_2.owner = "jiro4989";
  inputs.src-monit-v1_2_2.repo = "monit";
  inputs.src-monit-v1_2_2.ref = "refs/tags/v1.2.2";
  
  
  inputs."yaml".type = "github";
  inputs."yaml".owner = "riinr";
  inputs."yaml".repo = "flake-nimble";
  inputs."yaml".ref = "flake-pinning";
  inputs."yaml".dir = "nimpkgs/y/yaml";

  
  inputs."cligen".type = "github";
  inputs."cligen".owner = "riinr";
  inputs."cligen".repo = "flake-nimble";
  inputs."cligen".ref = "flake-pinning";
  inputs."cligen".dir = "nimpkgs/c/cligen";

  outputs = { self, nixpkgs, flakeNimbleLib, src-monit-v1_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-monit-v1_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-monit-v1_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}