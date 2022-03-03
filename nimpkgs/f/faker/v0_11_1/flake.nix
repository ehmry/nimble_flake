{
  description = ''faker is a Nim package that generates fake data for you.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-faker-v0_11_1.flake = false;
  inputs.src-faker-v0_11_1.type = "github";
  inputs.src-faker-v0_11_1.owner = "jiro4989";
  inputs.src-faker-v0_11_1.repo = "faker";
  inputs.src-faker-v0_11_1.ref = "refs/tags/v0.11.1";
  inputs.src-faker-v0_11_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-faker-v0_11_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-faker-v0_11_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-faker-v0_11_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}