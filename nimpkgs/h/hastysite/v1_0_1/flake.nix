{
  description = ''A small but powerful static site generator powered by HastyScribe and min'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-hastysite-v1_0_1.flake = false;
  inputs.src-hastysite-v1_0_1.type = "github";
  inputs.src-hastysite-v1_0_1.owner = "h3rald";
  inputs.src-hastysite-v1_0_1.repo = "hastysite";
  inputs.src-hastysite-v1_0_1.ref = "refs/tags/v1.0.1";
  inputs.src-hastysite-v1_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-hastysite-v1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hastysite-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-hastysite-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}