{
  description = ''Async Telegram Bot API Client'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-telebot-0_5_6_4.flake = false;
  inputs.src-telebot-0_5_6_4.type = "github";
  inputs.src-telebot-0_5_6_4.owner = "ba0f3";
  inputs.src-telebot-0_5_6_4.repo = "telebot.nim";
  inputs.src-telebot-0_5_6_4.ref = "refs/tags/0.5.6.4";
  inputs.src-telebot-0_5_6_4.inputs.nixpkgs.follows = "nixpkgs";
  
  outputs = { self, nixpkgs, flakeNimbleLib, src-telebot-0_5_6_4, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_5_6_4;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-telebot-0_5_6_4"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}