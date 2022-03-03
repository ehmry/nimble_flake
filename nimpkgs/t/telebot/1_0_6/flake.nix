{
  description = ''Async Telegram Bot API Client'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "nim-flakes-lib";
  inputs.flakeNimbleLib.ref = "master";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
    inputs.src-telebot-1_0_6.flake = false;
  inputs.src-telebot-1_0_6.type = "github";
  inputs.src-telebot-1_0_6.owner = "ba0f3";
  inputs.src-telebot-1_0_6.repo = "telebot.nim";
  inputs.src-telebot-1_0_6.ref = "refs/tags/1.0.6";
  inputs.src-telebot-1_0_6.inputs.nixpkgs.follows = "nixpkgs";
  
  
  # inputs."sam".type = "github";
  # inputs."sam".owner = "riinr";
  # inputs."sam".repo = "flake-nimble";
  # inputs."sam".ref = "flake-pinning";
  # inputs."sam".dir = "nimpkgs/s/sam";
  # inputs."sam".inputs.nixpkgs.follows = "nixpkgs";
  # inputs."sam".inputs.flakeNimbleLib.follows = "flakeNimbleLib";

  outputs = { self, nixpkgs, flakeNimbleLib, src-telebot-1_0_6, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-telebot-1_0_6;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-telebot-1_0_6"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}