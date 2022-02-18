{
  description = ''Timezone library compatible with the standard library. '';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-timezones-v0_2_0.flake = false;
  inputs.src-timezones-v0_2_0.type = "github";
  inputs.src-timezones-v0_2_0.owner = "GULPF";
  inputs.src-timezones-v0_2_0.repo = "timezones";
  inputs.src-timezones-v0_2_0.ref = "refs/tags/v0.2.0";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-timezones-v0_2_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-timezones-v0_2_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-timezones-v0_2_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}