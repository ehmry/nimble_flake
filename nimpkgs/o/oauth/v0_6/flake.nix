{
  description = ''OAuth library for nim'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-oauth-v0_6.flake = false;
  inputs.src-oauth-v0_6.type = "github";
  inputs.src-oauth-v0_6.owner = "CORDEA";
  inputs.src-oauth-v0_6.repo = "oauth";
  inputs.src-oauth-v0_6.ref = "refs/tags/v0.6";
  
  
  inputs."sha1".type = "github";
  inputs."sha1".owner = "riinr";
  inputs."sha1".repo = "flake-nimble";
  inputs."sha1".ref = "flake-pinning";
  inputs."sha1".dir = "nimpkgs/s/sha1";

  outputs = { self, nixpkgs, flakeNimbleLib, src-oauth-v0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-oauth-v0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-oauth-v0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}