{
  description = ''React.js 16.x bindings for Nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-react16-0_3_3.flake = false;
  inputs.src-react16-0_3_3.type = "github";
  inputs.src-react16-0_3_3.owner = "kristianmandrup";
  inputs.src-react16-0_3_3.repo = "react-16.nim";
  inputs.src-react16-0_3_3.ref = "refs/tags/0.3.3";
  inputs.src-react16-0_3_3.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-react16-0_3_3, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-react16-0_3_3;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-react16-0_3_3"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}