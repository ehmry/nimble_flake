{
  description = ''A client for the Google Cloud Text to Speech API.'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-texttospeech-master.flake = false;
  inputs.src-texttospeech-master.type = "github";
  inputs.src-texttospeech-master.owner = "dom96";
  inputs.src-texttospeech-master.repo = "texttospeech";
  inputs.src-texttospeech-master.ref = "refs/heads/master";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-texttospeech-master, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-texttospeech-master;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-texttospeech-master"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}