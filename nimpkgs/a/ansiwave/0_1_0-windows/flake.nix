{
  description = ''ANSI art + MIDI music editor'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  inputs.src-ansiwave-0_1_0-windows.flake = false;
  inputs.src-ansiwave-0_1_0-windows.type = "github";
  inputs.src-ansiwave-0_1_0-windows.owner = "ansiwave";
  inputs.src-ansiwave-0_1_0-windows.repo = "ansiwave";
  inputs.src-ansiwave-0_1_0-windows.ref = "refs/tags/0.1.0-windows";
  inputs.src-ansiwave-0_1_0-windows.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."pararules".type = "github";
  # inputs."pararules".owner = "riinr";
  # inputs."pararules".repo = "flake-nimble";
  # inputs."pararules".ref = "flake-pinning";
  # inputs."pararules".dir = "nimpkgs/p/pararules";
  # inputs."pararules".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."pararules".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."paramidi".type = "github";
  # inputs."paramidi".owner = "riinr";
  # inputs."paramidi".repo = "flake-nimble";
  # inputs."paramidi".ref = "flake-pinning";
  # inputs."paramidi".dir = "nimpkgs/p/paramidi";
  # inputs."paramidi".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."paramidi".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."paramidi_soundfonts".type = "github";
  # inputs."paramidi_soundfonts".owner = "riinr";
  # inputs."paramidi_soundfonts".repo = "flake-nimble";
  # inputs."paramidi_soundfonts".ref = "flake-pinning";
  # inputs."paramidi_soundfonts".dir = "nimpkgs/p/paramidi_soundfonts";
  # inputs."paramidi_soundfonts".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."paramidi_soundfonts".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."parasound".type = "github";
  # inputs."parasound".owner = "riinr";
  # inputs."parasound".repo = "flake-nimble";
  # inputs."parasound".ref = "flake-pinning";
  # inputs."parasound".dir = "nimpkgs/p/parasound";
  # inputs."parasound".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."parasound".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."illwill".type = "github";
  # inputs."illwill".owner = "riinr";
  # inputs."illwill".repo = "flake-nimble";
  # inputs."illwill".ref = "flake-pinning";
  # inputs."illwill".dir = "nimpkgs/i/illwill";
  # inputs."illwill".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."illwill".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  # inputs."zippy".type = "github";
  # inputs."zippy".owner = "riinr";
  # inputs."zippy".repo = "flake-nimble";
  # inputs."zippy".ref = "flake-pinning";
  # inputs."zippy".dir = "nimpkgs/z/zippy";
  # inputs."zippy".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."zippy".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-ansiwave-0_1_0-windows, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-ansiwave-0_1_0-windows;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-ansiwave-0_1_0-windows"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}