{
  description = ''Check minecraft server status'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-minecraft_server_status-0_1_1.flake = false;
  inputs.src-minecraft_server_status-0_1_1.type = "github";
  inputs.src-minecraft_server_status-0_1_1.owner = "GabrielLasso";
  inputs.src-minecraft_server_status-0_1_1.repo = "minecraft_server_status";
  inputs.src-minecraft_server_status-0_1_1.ref = "refs/tags/0.1.1";
  inputs.src-minecraft_server_status-0_1_1.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-minecraft_server_status-0_1_1, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-minecraft_server_status-0_1_1;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-minecraft_server_status-0_1_1"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}