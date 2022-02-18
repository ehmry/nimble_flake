{
  description = ''Domain Name System (DNS) protocol for Nim programming language'';
    inputs.flakeNimbleLib.type = "github";
  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.repo = "flake-nimble";
  inputs.flakeNimbleLib.ref = "flake-pinning";
  inputs.flakeNimbleLib.dir = "nimpkgs/";
  inputs.src-dnsprotocol-main.flake = false;
  inputs.src-dnsprotocol-main.type = "github";
  inputs.src-dnsprotocol-main.owner = "rockcavera";
  inputs.src-dnsprotocol-main.repo = "nim-dnsprotocol";
  inputs.src-dnsprotocol-main.ref = "refs/heads/main";
  
  
  inputs."stew".type = "github";
  inputs."stew".owner = "riinr";
  inputs."stew".repo = "flake-nimble";
  inputs."stew".ref = "flake-pinning";
  inputs."stew".dir = "nimpkgs/s/stew";

  outputs = { self, nixpkgs, flakeNimbleLib, src-dnsprotocol-main, ...}@deps:
    let lib = flakeNimbleLib.lib;
    in lib.mkRefOutput {
      inherit self nixpkgs ;
      src = src-dnsprotocol-main;
      deps = builtins.removeAttrs deps ["self" "nixpkgs" "flakeNimbleLib" "src-dnsprotocol-main"];
      meta = builtins.fromJSON (builtins.readFile ./meta.json);
    };
}