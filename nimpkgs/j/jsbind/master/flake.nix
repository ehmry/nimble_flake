{
  description = ''Define bindings to JavaScript and Emscripten'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-jsbind-master.flake = false;
  inputs.src-jsbind-master.type = "github";
  inputs.src-jsbind-master.owner = "yglukhov";
  inputs.src-jsbind-master.repo = "jsbind";
  inputs.src-jsbind-master.ref = "refs/heads/master";
  
  
  inputs."https://github.com/yglukhov/wasmrt".type = "github";
  inputs."https://github.com/yglukhov/wasmrt".owner = "riinr";
  inputs."https://github.com/yglukhov/wasmrt".repo = "flake-nimble";
  inputs."https://github.com/yglukhov/wasmrt".ref = "flake-pinning";
  inputs."https://github.com/yglukhov/wasmrt".dir = "nimpkgs/h/https://github.com/yglukhov/wasmrt";

  outputs = { self, nixpkgs, flakeNimbleLib, src-jsbind-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-jsbind-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-jsbind-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}