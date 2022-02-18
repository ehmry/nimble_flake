{
  description = ''til-tool: Today I Learned tool'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-til-master.flake = false;
  inputs.src-til-master.type = "github";
  inputs.src-til-master.owner = "danielecook";
  inputs.src-til-master.repo = "til-tool";
  inputs.src-til-master.ref = "refs/heads/master";
  
  
  inputs."colorize".type = "github";
  inputs."colorize".owner = "riinr";
  inputs."colorize".repo = "flake-nimble";
  inputs."colorize".ref = "flake-pinning";
  inputs."colorize".dir = "nimpkgs/c/colorize";

  
  inputs."argparse".type = "github";
  inputs."argparse".owner = "riinr";
  inputs."argparse".repo = "flake-nimble";
  inputs."argparse".ref = "flake-pinning";
  inputs."argparse".dir = "nimpkgs/a/argparse";

  outputs = { self, nixpkgs, flakeNimbleLib, src-til-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-til-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-til-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}