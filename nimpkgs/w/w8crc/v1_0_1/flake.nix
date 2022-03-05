{
  description = ''Full-featured CRC library for Nim.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-w8crc-v1_0_1.flake = false;
  inputs.src-w8crc-v1_0_1.type = "github";
  inputs.src-w8crc-v1_0_1.owner = "sumatoshi";
  inputs.src-w8crc-v1_0_1.repo = "w8crc";
  inputs.src-w8crc-v1_0_1.ref = "refs/tags/v1.0.1";
  inputs.src-w8crc-v1_0_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-w8crc-v1_0_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-w8crc-v1_0_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-w8crc-v1_0_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}