{
  description = ''Simple database generator, connector and query tools.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-zfdbms-v0_0_6.flake = false;
  inputs.src-zfdbms-v0_0_6.type = "github";
  inputs.src-zfdbms-v0_0_6.owner = "zendbit";
  inputs.src-zfdbms-v0_0_6.repo = "nim.zfdbms";
  inputs.src-zfdbms-v0_0_6.ref = "refs/tags/v0.0.6";
  inputs.src-zfdbms-v0_0_6.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."stdext".type = "github";
  # inputs."stdext".owner = "riinr";
  # inputs."stdext".repo = "flake-nimble";
  # inputs."stdext".ref = "flake-pinning";
  # inputs."stdext".dir = "nimpkgs/s/stdext";
  # inputs."stdext".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."stdext".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-zfdbms-v0_0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-zfdbms-v0_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-zfdbms-v0_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}