{
  description = ''A tiny static file web server.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-static_server-v2_2_0.flake = false;
  inputs.src-static_server-v2_2_0.type = "github";
  inputs.src-static_server-v2_2_0.owner = "bung87";
  inputs.src-static_server-v2_2_0.repo = "nimhttpd";
  inputs.src-static_server-v2_2_0.ref = "refs/tags/v2.2.0";
  inputs.src-static_server-v2_2_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."https://github.com/bung87/finder".type = "github";
  inputs."https://github.com/bung87/finder".owner = "riinr";
  inputs."https://github.com/bung87/finder".repo = "flake-nimble";
  inputs."https://github.com/bung87/finder".ref = "flake-pinning";
  inputs."https://github.com/bung87/finder".dir = "nimpkgs/h/https://github.com/bung87/finder";
  inputs."https://github.com/bung87/finder".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/bung87/finder".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-static_server-v2_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-static_server-v2_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-static_server-v2_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}