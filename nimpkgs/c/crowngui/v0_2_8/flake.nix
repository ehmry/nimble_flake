{
  description = ''Web Technologies based Crossplatform GUI Framework'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-crowngui-v0_2_8.flake = false;
  inputs.src-crowngui-v0_2_8.type = "github";
  inputs.src-crowngui-v0_2_8.owner = "bung87";
  inputs.src-crowngui-v0_2_8.repo = "crowngui";
  inputs.src-crowngui-v0_2_8.ref = "refs/tags/v0.2.8";
  
  
  inputs."regex".type = "github";
  inputs."regex".owner = "riinr";
  inputs."regex".repo = "flake-nimble";
  inputs."regex".ref = "flake-pinning";
  inputs."regex".dir = "nimpkgs/r/regex";

  
  inputs."xlsx".type = "github";
  inputs."xlsx".owner = "riinr";
  inputs."xlsx".repo = "flake-nimble";
  inputs."xlsx".ref = "flake-pinning";
  inputs."xlsx".dir = "nimpkgs/x/xlsx";

  
  inputs."static_server".type = "github";
  inputs."static_server".owner = "riinr";
  inputs."static_server".repo = "flake-nimble";
  inputs."static_server".ref = "flake-pinning";
  inputs."static_server".dir = "nimpkgs/s/static_server";

  
  inputs."jsonschema".type = "github";
  inputs."jsonschema".owner = "riinr";
  inputs."jsonschema".repo = "flake-nimble";
  inputs."jsonschema".ref = "flake-pinning";
  inputs."jsonschema".dir = "nimpkgs/j/jsonschema";

  
  inputs."https://github.com/bung87/objc_runtime".type = "github";
  inputs."https://github.com/bung87/objc_runtime".owner = "riinr";
  inputs."https://github.com/bung87/objc_runtime".repo = "flake-nimble";
  inputs."https://github.com/bung87/objc_runtime".ref = "flake-pinning";
  inputs."https://github.com/bung87/objc_runtime".dir = "nimpkgs/h/https://github.com/bung87/objc_runtime";

  
  inputs."darwin".type = "github";
  inputs."darwin".owner = "riinr";
  inputs."darwin".repo = "flake-nimble";
  inputs."darwin".ref = "flake-pinning";
  inputs."darwin".dir = "nimpkgs/d/darwin";

  outputs = { self, nixpkgs, flakeNimbleLib, src-crowngui-v0_2_8, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-crowngui-v0_2_8;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-crowngui-v0_2_8"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}