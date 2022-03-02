{
  description = ''Syslog module.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-syslog-0_0_5.flake = false;
  inputs.src-syslog-0_0_5.type = "github";
  inputs.src-syslog-0_0_5.owner = "FedericoCeratto";
  inputs.src-syslog-0_0_5.repo = "nim-syslog";
  inputs.src-syslog-0_0_5.ref = "refs/tags/0.0.5";
  
  
  inputs."nake".type = "github";
  inputs."nake".owner = "riinr";
  inputs."nake".repo = "flake-nimble";
  inputs."nake".ref = "flake-pinning";
  inputs."nake".dir = "nimpkgs/n/nake";

  outputs = { self, nixpkgs, flakeNimbleLib, src-syslog-0_0_5, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-syslog-0_0_5;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-syslog-0_0_5"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}