{
  description = ''A client for the Google Cloud Text to Speech API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
    inputs."texttospeech-master".type = "github";
  inputs."texttospeech-master".owner = "riinr";
  inputs."texttospeech-master".repo = "flake-nimble";
  inputs."texttospeech-master".ref = "flake-pinning";
  inputs."texttospeech-master".dir = "nimpkgs/t/texttospeech/master";

    inputs."texttospeech-v0_1_0".type = "github";
  inputs."texttospeech-v0_1_0".owner = "riinr";
  inputs."texttospeech-v0_1_0".repo = "flake-nimble";
  inputs."texttospeech-v0_1_0".ref = "flake-pinning";
  inputs."texttospeech-v0_1_0".dir = "nimpkgs/t/texttospeech/v0_1_0";

  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
    let lib = flakeNimbleLib.lib;
    in lib.mkProjectOutput {
      inherit self nixpkgs;
      refs = builtins.removeAttrs inputs ["self" "nixpkgs" "flakeNimbleLib"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}