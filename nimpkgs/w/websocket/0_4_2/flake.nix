{
  description = ''websockets for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-websocket-0_4_2.flake = false;
  inputs.src-websocket-0_4_2.type = "github";
  inputs.src-websocket-0_4_2.owner = "niv";
  inputs.src-websocket-0_4_2.repo = "websocket.nim";
  inputs.src-websocket-0_4_2.ref = "refs/tags/0.4.2";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-websocket-0_4_2, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-websocket-0_4_2;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-websocket-0_4_2"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}