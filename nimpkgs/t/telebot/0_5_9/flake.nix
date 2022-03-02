{
  description = ''Async Telegram Bot API Client'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-telebot-0_5_9.flake = false;
  inputs.src-telebot-0_5_9.type = "github";
  inputs.src-telebot-0_5_9.owner = "ba0f3";
  inputs.src-telebot-0_5_9.repo = "telebot.nim";
  inputs.src-telebot-0_5_9.ref = "refs/tags/0.5.9";
  
  
  inputs."sam".type = "github";
  inputs."sam".owner = "riinr";
  inputs."sam".repo = "flake-nimble";
  inputs."sam".ref = "flake-pinning";
  inputs."sam".dir = "nimpkgs/s/sam";

  outputs = { self, nixpkgs, flakeNimbleLib, src-telebot-0_5_9, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-0_5_9;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-telebot-0_5_9"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}