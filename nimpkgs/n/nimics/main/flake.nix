{
  description = ''Create ICS files for email invites, eg. invite.ics'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-nimics-main.flake = false;
  inputs.src-nimics-main.type = "github";
  inputs.src-nimics-main.owner = "ThomasTJdev";
  inputs.src-nimics-main.repo = "nimics";
  inputs.src-nimics-main.ref = "refs/heads/main";
  inputs.src-nimics-main.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-nimics-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimics-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimics-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}