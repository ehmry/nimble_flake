{
  description = ''A small but powerful static site generator powered by HastyScribe and min'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-hastysite-v1_2_2.flake = false;
  inputs.src-hastysite-v1_2_2.type = "github";
  inputs.src-hastysite-v1_2_2.owner = "h3rald";
  inputs.src-hastysite-v1_2_2.repo = "hastysite";
  inputs.src-hastysite-v1_2_2.ref = "refs/tags/v1.2.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-hastysite-v1_2_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hastysite-v1_2_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-hastysite-v1_2_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}