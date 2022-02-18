{
  description = ''Small program to grab notifications from freedesktop and output them according to a format'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-notificatcher-v0_3_0.flake = false;
  inputs.src-notificatcher-v0_3_0.type = "github";
  inputs.src-notificatcher-v0_3_0.owner = "PMunch";
  inputs.src-notificatcher-v0_3_0.repo = "notificatcher";
  inputs.src-notificatcher-v0_3_0.ref = "refs/tags/v0.3.0";
  
  
  inputs."dbus".type = "github";
  inputs."dbus".owner = "riinr";
  inputs."dbus".repo = "flake-nimble";
  inputs."dbus".ref = "flake-pinning";
  inputs."dbus".dir = "nimpkgs/d/dbus";

  
  inputs."https://github.com/pmunch/docopt.nim".type = "github";
  inputs."https://github.com/pmunch/docopt.nim".owner = "riinr";
  inputs."https://github.com/pmunch/docopt.nim".repo = "flake-nimble";
  inputs."https://github.com/pmunch/docopt.nim".ref = "flake-pinning";
  inputs."https://github.com/pmunch/docopt.nim".dir = "nimpkgs/h/https://github.com/pmunch/docopt.nim";

  outputs = { self, nixpkgs, flakeNimbleLib, src-notificatcher-v0_3_0, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-notificatcher-v0_3_0;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-notificatcher-v0_3_0"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}