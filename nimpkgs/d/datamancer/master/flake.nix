{
  description = ''A dataframe library with a dplyr like API'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-datamancer-master.flake = false;
  inputs.src-datamancer-master.type = "github";
  inputs.src-datamancer-master.owner = "SciNim";
  inputs.src-datamancer-master.repo = "datamancer";
  inputs.src-datamancer-master.ref = "refs/heads/master";
  inputs.src-datamancer-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."https://github.com/vindaar/seqmath".type = "github";
  inputs."https://github.com/vindaar/seqmath".owner = "riinr";
  inputs."https://github.com/vindaar/seqmath".repo = "flake-nimble";
  inputs."https://github.com/vindaar/seqmath".ref = "flake-pinning";
  inputs."https://github.com/vindaar/seqmath".dir = "nimpkgs/h/https://github.com/vindaar/seqmath";
  inputs."https://github.com/vindaar/seqmath".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/vindaar/seqmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."arraymancer".type = "github";
  inputs."arraymancer".owner = "riinr";
  inputs."arraymancer".repo = "flake-nimble";
  inputs."arraymancer".ref = "flake-pinning";
  inputs."arraymancer".dir = "nimpkgs/a/arraymancer";
  inputs."arraymancer".inputs.nixpkgs.follows = "nixpkgs";
  inputs."arraymancer".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-datamancer-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-datamancer-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-datamancer-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}