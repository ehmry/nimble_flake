{
  description = ''onnxruntime C Api wrapped for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."onnxruntime-main".type = "github";
  inputs."onnxruntime-main".owner = "riinr";
  inputs."onnxruntime-main".repo = "flake-nimble";
  inputs."onnxruntime-main".ref = "flake-pinning";
  inputs."onnxruntime-main".dir = "nimpkgs/o/onnxruntime/main";

  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}