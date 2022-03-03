{
  description = ''Simple, modern and portable interpreted programming language for efficient scripting'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-arturo-v0_9_7_4.flake = false;
  inputs.src-arturo-v0_9_7_4.type = "github";
  inputs.src-arturo-v0_9_7_4.owner = "arturo-lang";
  inputs.src-arturo-v0_9_7_4.repo = "arturo";
  inputs.src-arturo-v0_9_7_4.ref = "refs/tags/v0.9.7.4";
  inputs.src-arturo-v0_9_7_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-arturo-v0_9_7_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-arturo-v0_9_7_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-arturo-v0_9_7_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}