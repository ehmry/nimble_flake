{
  description = ''Simple shape drawing'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-hdrawing-master.flake = false;
  inputs.src-hdrawing-master.type = "github";
  inputs.src-hdrawing-master.owner = "haxscramper";
  inputs.src-hdrawing-master.repo = "hdrawing";
  inputs.src-hdrawing-master.ref = "refs/heads/master";
  
  
  inputs."hmisc".type = "github";
  inputs."hmisc".owner = "riinr";
  inputs."hmisc".repo = "flake-nimble";
  inputs."hmisc".ref = "flake-pinning";
  inputs."hmisc".dir = "nimpkgs/h/hmisc";

  outputs = { self, nixpkgs, flakeNimbleLib, src-hdrawing-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-hdrawing-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-hdrawing-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}