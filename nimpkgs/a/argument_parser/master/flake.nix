{
  description = ''Provides a complex command-line parser'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-argument_parser-master.flake = false;
  inputs.src-argument_parser-master.type = "github";
  inputs.src-argument_parser-master.owner = "Xe";
  inputs.src-argument_parser-master.repo = "argument_parser";
  inputs.src-argument_parser-master.ref = "refs/heads/master";
  inputs.src-argument_parser-master.inputs.nixpkgs.follows = "nixpkgs";
  
  
  inputs."https://github.com/xe/badger_bits.git".type = "github";
  inputs."https://github.com/xe/badger_bits.git".owner = "riinr";
  inputs."https://github.com/xe/badger_bits.git".repo = "flake-nimble";
  inputs."https://github.com/xe/badger_bits.git".ref = "flake-pinning";
  inputs."https://github.com/xe/badger_bits.git".dir = "nimpkgs/h/https://github.com/xe/badger_bits.git";
  inputs."https://github.com/xe/badger_bits.git".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/xe/badger_bits.git".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  
  inputs."nake".type = "github";
  inputs."nake".owner = "riinr";
  inputs."nake".repo = "flake-nimble";
  inputs."nake".ref = "flake-pinning";
  inputs."nake".dir = "nimpkgs/n/nake";
  inputs."nake".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nake".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-argument_parser-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-argument_parser-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-argument_parser-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}