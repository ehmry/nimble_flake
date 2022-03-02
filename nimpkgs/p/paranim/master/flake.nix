{
  description = ''A game library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-paranim-master.flake = false;
  inputs.src-paranim-master.type = "github";
  inputs.src-paranim-master.owner = "paranim";
  inputs.src-paranim-master.repo = "paranim";
  inputs.src-paranim-master.ref = "refs/heads/master";
  
  
  inputs."nimgl".type = "github";
  inputs."nimgl".owner = "riinr";
  inputs."nimgl".repo = "flake-nimble";
  inputs."nimgl".ref = "flake-pinning";
  inputs."nimgl".dir = "nimpkgs/n/nimgl";

  
  inputs."glm".type = "github";
  inputs."glm".owner = "riinr";
  inputs."glm".repo = "flake-nimble";
  inputs."glm".ref = "flake-pinning";
  inputs."glm".dir = "nimpkgs/g/glm";

  outputs = { self, nixpkgs, flakeNimbleLib, src-paranim-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-paranim-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-paranim-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}