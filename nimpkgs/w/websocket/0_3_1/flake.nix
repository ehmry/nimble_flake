{
  description = ''websockets for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-websocket-0_3_1.flake = false;
  inputs.src-websocket-0_3_1.type = "github";
  inputs.src-websocket-0_3_1.owner = "niv";
  inputs.src-websocket-0_3_1.repo = "websocket.nim";
  inputs.src-websocket-0_3_1.ref = "refs/tags/0.3.1";
  inputs.src-websocket-0_3_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-websocket-0_3_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-websocket-0_3_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-websocket-0_3_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}