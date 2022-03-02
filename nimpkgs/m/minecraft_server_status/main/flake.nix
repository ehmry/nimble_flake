{
  description = ''Check minecraft server status'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-minecraft_server_status-main.flake = false;
  inputs.src-minecraft_server_status-main.type = "github";
  inputs.src-minecraft_server_status-main.owner = "GabrielLasso";
  inputs.src-minecraft_server_status-main.repo = "minecraft_server_status";
  inputs.src-minecraft_server_status-main.ref = "refs/heads/main";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-minecraft_server_status-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-minecraft_server_status-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-minecraft_server_status-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}