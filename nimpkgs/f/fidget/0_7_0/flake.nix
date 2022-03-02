{
  description = ''Figma based UI library for nim, with HTML and OpenGL backends.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-fidget-0_7_0.flake = false;
  inputs.src-fidget-0_7_0.type = "github";
  inputs.src-fidget-0_7_0.owner = "treeform";
  inputs.src-fidget-0_7_0.repo = "fidget";
  inputs.src-fidget-0_7_0.ref = "refs/tags/0.7.0";
  inputs.src-fidget-0_7_0.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."chroma".type = "github";
  # inputs."chroma".owner = "riinr";
  # inputs."chroma".repo = "flake-nimble";
  # inputs."chroma".ref = "flake-pinning";
  # inputs."chroma".dir = "nimpkgs/c/chroma";
  # inputs."chroma".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."chroma".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."typography".type = "github";
  # inputs."typography".owner = "riinr";
  # inputs."typography".repo = "flake-nimble";
  # inputs."typography".ref = "flake-pinning";
  # inputs."typography".dir = "nimpkgs/t/typography";
  # inputs."typography".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."typography".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."pixie".type = "github";
  # inputs."pixie".owner = "riinr";
  # inputs."pixie".repo = "flake-nimble";
  # inputs."pixie".ref = "flake-pinning";
  # inputs."pixie".dir = "nimpkgs/p/pixie";
  # inputs."pixie".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."pixie".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."vmath".type = "github";
  # inputs."vmath".owner = "riinr";
  # inputs."vmath".repo = "flake-nimble";
  # inputs."vmath".ref = "flake-pinning";
  # inputs."vmath".dir = "nimpkgs/v/vmath";
  # inputs."vmath".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."vmath".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."print".type = "github";
  # inputs."print".owner = "riinr";
  # inputs."print".repo = "flake-nimble";
  # inputs."print".ref = "flake-pinning";
  # inputs."print".dir = "nimpkgs/p/print";
  # inputs."print".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."print".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."opengl".type = "github";
  # inputs."opengl".owner = "riinr";
  # inputs."opengl".repo = "flake-nimble";
  # inputs."opengl".ref = "flake-pinning";
  # inputs."opengl".dir = "nimpkgs/o/opengl";
  # inputs."opengl".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."opengl".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."html5_canvas".type = "github";
  # inputs."html5_canvas".owner = "riinr";
  # inputs."html5_canvas".repo = "flake-nimble";
  # inputs."html5_canvas".ref = "flake-pinning";
  # inputs."html5_canvas".dir = "nimpkgs/h/html5_canvas";
  # inputs."html5_canvas".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."html5_canvas".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."staticglfw".type = "github";
  # inputs."staticglfw".owner = "riinr";
  # inputs."staticglfw".repo = "flake-nimble";
  # inputs."staticglfw".ref = "flake-pinning";
  # inputs."staticglfw".dir = "nimpkgs/s/staticglfw";
  # inputs."staticglfw".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."staticglfw".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."cligen".type = "github";
  # inputs."cligen".owner = "riinr";
  # inputs."cligen".repo = "flake-nimble";
  # inputs."cligen".ref = "flake-pinning";
  # inputs."cligen".dir = "nimpkgs/c/cligen";
  # inputs."cligen".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."cligen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."supersnappy".type = "github";
  # inputs."supersnappy".owner = "riinr";
  # inputs."supersnappy".repo = "flake-nimble";
  # inputs."supersnappy".ref = "flake-pinning";
  # inputs."supersnappy".dir = "nimpkgs/s/supersnappy";
  # inputs."supersnappy".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."supersnappy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."bumpy".type = "github";
  # inputs."bumpy".owner = "riinr";
  # inputs."bumpy".repo = "flake-nimble";
  # inputs."bumpy".ref = "flake-pinning";
  # inputs."bumpy".dir = "nimpkgs/b/bumpy";
  # inputs."bumpy".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."bumpy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-fidget-0_7_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-fidget-0_7_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-fidget-0_7_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}