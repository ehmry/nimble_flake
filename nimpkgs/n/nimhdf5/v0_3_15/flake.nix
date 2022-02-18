{
  description = ''Bindings for the HDF5 data format C library'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-nimhdf5-v0_3_15.flake = false;
  inputs.src-nimhdf5-v0_3_15.type = "github";
  inputs.src-nimhdf5-v0_3_15.owner = "Vindaar";
  inputs.src-nimhdf5-v0_3_15.repo = "nimhdf5";
  inputs.src-nimhdf5-v0_3_15.ref = "refs/tags/v0.3.15";
  
  
  inputs."https://github.com/vindaar/seqmath".type = "github";
  inputs."https://github.com/vindaar/seqmath".owner = "riinr";
  inputs."https://github.com/vindaar/seqmath".repo = "flake-nimble";
  inputs."https://github.com/vindaar/seqmath".ref = "flake-pinning";
  inputs."https://github.com/vindaar/seqmath".dir = "nimpkgs/h/https://github.com/vindaar/seqmath";

  outputs = { self, nixpkgs, flakeNimbleLib, src-nimhdf5-v0_3_15, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-nimhdf5-v0_3_15;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-nimhdf5-v0_3_15"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}