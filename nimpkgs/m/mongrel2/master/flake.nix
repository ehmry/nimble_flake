{
  description = ''Handler framework for the Mongrel2 web server.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-mongrel2-master.flake = false;
  inputs.src-mongrel2-master.type = "github";
  inputs.src-mongrel2-master.owner = "mahlonsmith";
  inputs.src-mongrel2-master.repo = "nim-mongrel2";
  inputs.src-mongrel2-master.ref = "refs/heads/master";
  
  
  inputs."tnetstring".type = "github";
  inputs."tnetstring".owner = "riinr";
  inputs."tnetstring".repo = "flake-nimble";
  inputs."tnetstring".ref = "flake-pinning";
  inputs."tnetstring".dir = "nimpkgs/t/tnetstring";

  
  inputs."zmq".type = "github";
  inputs."zmq".owner = "riinr";
  inputs."zmq".repo = "flake-nimble";
  inputs."zmq".ref = "flake-pinning";
  inputs."zmq".dir = "nimpkgs/z/zmq";

  outputs = { self, nixpkgs, flakeNimbleLib, src-mongrel2-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-mongrel2-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-mongrel2-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}