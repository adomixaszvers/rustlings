{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.7.3

  crates.aho_corasick."0.7.3" = deps: { features?(features_.aho_corasick."0.7.3" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.3";
    description = "Fast multiple substring searching.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0dn42fbdms4brigqphxrvzbjd1s4knyjlzky30kgvpnrcl4sqqdv";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.3" or {});
  };
  features_.aho_corasick."0.7.3" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.3"."std" =
        (f.aho_corasick."0.7.3"."std" or false) ||
        (f.aho_corasick."0.7.3".default or false) ||
        (aho_corasick."0.7.3"."default" or false); }
      { "0.7.3".default = (f.aho_corasick."0.7.3".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.3".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.3".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.3"."std" or false) ||
        (f."aho_corasick"."0.7.3"."std" or false); }
      { "${deps.aho_corasick."0.7.3".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.3".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
  ];


# end
# ansi_term-0.11.0

  crates.ansi_term."0.11.0" = deps: { features?(features_.ansi_term."0.11.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.11.0";
    description = "Library for ANSI terminal colours and styles (bold, underline)";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "08fk0p2xvkqpmz3zlrwnf6l8sj2vngw464rvzspzp31sbgxbwm4v";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ansi_term"."0.11.0"."winapi"}" deps)
    ]) else []);
  };
  features_.ansi_term."0.11.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.11.0".default = (f.ansi_term."0.11.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.ansi_term."0.11.0".winapi}"."consoleapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."errhandlingapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."processenv" = true; }
      { "${deps.ansi_term."0.11.0".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."ansi_term"."0.11.0"."winapi"}" deps)
  ];


# end
# assert_cmd-0.11.1

  crates.assert_cmd."0.11.1" = deps: { features?(features_.assert_cmd."0.11.1" deps {}) }: buildRustCrate {
    crateName = "assert_cmd";
    version = "0.11.1";
    description = "Test CLI Applications.";
    authors = [ "Pascal Hertleif <killercup@gmail.com>" "Ed Page <eopage@gmail.com>" ];
    sha256 = "09azlmwyg1hxcgfx7xwdgl863n07ssdq50a8cg4fmrmbmaadgxvw";
    crateBin =
      [{  name = "bin_fixture"; }];
    dependencies = mapFeatures features ([
      (crates."escargot"."${deps."assert_cmd"."0.11.1"."escargot"}" deps)
      (crates."predicates"."${deps."assert_cmd"."0.11.1"."predicates"}" deps)
      (crates."predicates_core"."${deps."assert_cmd"."0.11.1"."predicates_core"}" deps)
      (crates."predicates_tree"."${deps."assert_cmd"."0.11.1"."predicates_tree"}" deps)
    ]);
  };
  features_.assert_cmd."0.11.1" = deps: f: updateFeatures f (rec {
    assert_cmd."0.11.1".default = (f.assert_cmd."0.11.1".default or true);
    escargot."${deps.assert_cmd."0.11.1".escargot}".default = true;
    predicates = fold recursiveUpdate {} [
      { "${deps.assert_cmd."0.11.1".predicates}"."difference" = true; }
      { "${deps.assert_cmd."0.11.1".predicates}".default = (f.predicates."${deps.assert_cmd."0.11.1".predicates}".default or false); }
    ];
    predicates_core."${deps.assert_cmd."0.11.1".predicates_core}".default = true;
    predicates_tree."${deps.assert_cmd."0.11.1".predicates_tree}".default = true;
  }) [
    (features_.escargot."${deps."assert_cmd"."0.11.1"."escargot"}" deps)
    (features_.predicates."${deps."assert_cmd"."0.11.1"."predicates"}" deps)
    (features_.predicates_core."${deps."assert_cmd"."0.11.1"."predicates_core"}" deps)
    (features_.predicates_tree."${deps."assert_cmd"."0.11.1"."predicates_tree"}" deps)
  ];


# end
# atty-0.2.11

  crates.atty."0.2.11" = deps: { features?(features_.atty."0.2.11" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.11";
    description = "A simple interface for querying atty";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0by1bj2km9jxi4i4g76zzi76fc2rcm9934jpnyrqd95zw344pb20";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."atty"."0.2.11"."termion"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.11"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.11" = deps: f: updateFeatures f (rec {
    atty."0.2.11".default = (f.atty."0.2.11".default or true);
    libc."${deps.atty."0.2.11".libc}".default = (f.libc."${deps.atty."0.2.11".libc}".default or false);
    termion."${deps.atty."0.2.11".termion}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.11".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.11".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.11".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.11".winapi}".default = true; }
    ];
  }) [
    (features_.termion."${deps."atty"."0.2.11"."termion"}" deps)
    (features_.libc."${deps."atty"."0.2.11"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.11"."winapi"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# clap-2.33.0

  crates.clap."2.33.0" = deps: { features?(features_.clap."2.33.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.33.0";
    description = "A simple to use, efficient, and full-featured Command Line Argument Parser\n";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "054n9ngh6pkknpmd4acgdsp40iw6f5jzq8a4h2b76gnbvk6p5xjh";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.33.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.33.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.33.0"."unicode_width"}" deps)
    ]
      ++ (if features.clap."2.33.0".atty or false then [ (crates.atty."${deps."clap"."2.33.0".atty}" deps) ] else [])
      ++ (if features.clap."2.33.0".strsim or false then [ (crates.strsim."${deps."clap"."2.33.0".strsim}" deps) ] else [])
      ++ (if features.clap."2.33.0".vec_map or false then [ (crates.vec_map."${deps."clap"."2.33.0".vec_map}" deps) ] else []))
      ++ (if !(kernel == "windows") then mapFeatures features ([
    ]
      ++ (if features.clap."2.33.0".ansi_term or false then [ (crates.ansi_term."${deps."clap"."2.33.0".ansi_term}" deps) ] else [])) else []);
    features = mkFeatures (features."clap"."2.33.0" or {});
  };
  features_.clap."2.33.0" = deps: f: updateFeatures f (rec {
    ansi_term."${deps.clap."2.33.0".ansi_term}".default = true;
    atty."${deps.clap."2.33.0".atty}".default = true;
    bitflags."${deps.clap."2.33.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.33.0"."ansi_term" =
        (f.clap."2.33.0"."ansi_term" or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."atty" =
        (f.clap."2.33.0"."atty" or false) ||
        (f.clap."2.33.0".color or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."clippy" =
        (f.clap."2.33.0"."clippy" or false) ||
        (f.clap."2.33.0".lints or false) ||
        (clap."2.33.0"."lints" or false); }
      { "2.33.0"."color" =
        (f.clap."2.33.0"."color" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."strsim" =
        (f.clap."2.33.0"."strsim" or false) ||
        (f.clap."2.33.0".suggestions or false) ||
        (clap."2.33.0"."suggestions" or false); }
      { "2.33.0"."suggestions" =
        (f.clap."2.33.0"."suggestions" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."term_size" =
        (f.clap."2.33.0"."term_size" or false) ||
        (f.clap."2.33.0".wrap_help or false) ||
        (clap."2.33.0"."wrap_help" or false); }
      { "2.33.0"."vec_map" =
        (f.clap."2.33.0"."vec_map" or false) ||
        (f.clap."2.33.0".default or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."yaml" =
        (f.clap."2.33.0"."yaml" or false) ||
        (f.clap."2.33.0".doc or false) ||
        (clap."2.33.0"."doc" or false); }
      { "2.33.0"."yaml-rust" =
        (f.clap."2.33.0"."yaml-rust" or false) ||
        (f.clap."2.33.0".yaml or false) ||
        (clap."2.33.0"."yaml" or false); }
      { "2.33.0".default = (f.clap."2.33.0".default or true); }
    ];
    strsim."${deps.clap."2.33.0".strsim}".default = true;
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.33.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.33.0".textwrap}"."term_size" or false) ||
        (clap."2.33.0"."wrap_help" or false) ||
        (f."clap"."2.33.0"."wrap_help" or false); }
      { "${deps.clap."2.33.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.33.0".unicode_width}".default = true;
    vec_map."${deps.clap."2.33.0".vec_map}".default = true;
  }) [
    (features_.atty."${deps."clap"."2.33.0"."atty"}" deps)
    (features_.bitflags."${deps."clap"."2.33.0"."bitflags"}" deps)
    (features_.strsim."${deps."clap"."2.33.0"."strsim"}" deps)
    (features_.textwrap."${deps."clap"."2.33.0"."textwrap"}" deps)
    (features_.unicode_width."${deps."clap"."2.33.0"."unicode_width"}" deps)
    (features_.vec_map."${deps."clap"."2.33.0"."vec_map"}" deps)
    (features_.ansi_term."${deps."clap"."2.33.0"."ansi_term"}" deps)
  ];


# end
# clicolors-control-1.0.0

  crates.clicolors_control."1.0.0" = deps: { features?(features_.clicolors_control."1.0.0" deps {}) }: buildRustCrate {
    crateName = "clicolors-control";
    version = "1.0.0";
    description = "A common utility library to control CLI colorization";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "02vi8lmf17w4mqjm0rh46ij750bxam2w3a9yxak6i26xhryh77zl";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."clicolors_control"."1.0.0"."lazy_static"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."clicolors_control"."1.0.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."atty"."${deps."clicolors_control"."1.0.0"."atty"}" deps)
      (crates."winapi"."${deps."clicolors_control"."1.0.0"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."clicolors_control"."1.0.0" or {});
  };
  features_.clicolors_control."1.0.0" = deps: f: updateFeatures f (rec {
    atty."${deps.clicolors_control."1.0.0".atty}".default = true;
    clicolors_control = fold recursiveUpdate {} [
      { "1.0.0"."terminal_autoconfig" =
        (f.clicolors_control."1.0.0"."terminal_autoconfig" or false) ||
        (f.clicolors_control."1.0.0".default or false) ||
        (clicolors_control."1.0.0"."default" or false); }
      { "1.0.0".default = (f.clicolors_control."1.0.0".default or true); }
    ];
    lazy_static."${deps.clicolors_control."1.0.0".lazy_static}".default = true;
    libc."${deps.clicolors_control."1.0.0".libc}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.clicolors_control."1.0.0".winapi}"."consoleapi" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."handleapi" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."processenv" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."winbase" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."clicolors_control"."1.0.0"."lazy_static"}" deps)
    (features_.libc."${deps."clicolors_control"."1.0.0"."libc"}" deps)
    (features_.atty."${deps."clicolors_control"."1.0.0"."atty"}" deps)
    (features_.winapi."${deps."clicolors_control"."1.0.0"."winapi"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# console-0.7.7

  crates.console."0.7.7" = deps: { features?(features_.console."0.7.7" deps {}) }: buildRustCrate {
    crateName = "console";
    version = "0.7.7";
    description = "A terminal and console abstraction for Rust";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "0sh4gx811yai8r0n02pm6kyds501znc5762z0b50hk961j8psfij";
    dependencies = mapFeatures features ([
      (crates."atty"."${deps."console"."0.7.7"."atty"}" deps)
      (crates."clicolors_control"."${deps."console"."0.7.7"."clicolors_control"}" deps)
      (crates."lazy_static"."${deps."console"."0.7.7"."lazy_static"}" deps)
      (crates."libc"."${deps."console"."0.7.7"."libc"}" deps)
      (crates."parking_lot"."${deps."console"."0.7.7"."parking_lot"}" deps)
      (crates."regex"."${deps."console"."0.7.7"."regex"}" deps)
      (crates."unicode_width"."${deps."console"."0.7.7"."unicode_width"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."termios"."${deps."console"."0.7.7"."termios"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."encode_unicode"."${deps."console"."0.7.7"."encode_unicode"}" deps)
      (crates."winapi"."${deps."console"."0.7.7"."winapi"}" deps)
    ]) else []);
  };
  features_.console."0.7.7" = deps: f: updateFeatures f (rec {
    atty."${deps.console."0.7.7".atty}".default = true;
    clicolors_control."${deps.console."0.7.7".clicolors_control}".default = true;
    console."0.7.7".default = (f.console."0.7.7".default or true);
    encode_unicode."${deps.console."0.7.7".encode_unicode}".default = true;
    lazy_static."${deps.console."0.7.7".lazy_static}".default = true;
    libc."${deps.console."0.7.7".libc}".default = true;
    parking_lot."${deps.console."0.7.7".parking_lot}".default = true;
    regex."${deps.console."0.7.7".regex}".default = true;
    termios."${deps.console."0.7.7".termios}".default = true;
    unicode_width."${deps.console."0.7.7".unicode_width}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.console."0.7.7".winapi}"."consoleapi" = true; }
      { "${deps.console."0.7.7".winapi}"."processenv" = true; }
      { "${deps.console."0.7.7".winapi}"."winbase" = true; }
      { "${deps.console."0.7.7".winapi}"."wincon" = true; }
      { "${deps.console."0.7.7".winapi}"."winuser" = true; }
      { "${deps.console."0.7.7".winapi}".default = true; }
    ];
  }) [
    (features_.atty."${deps."console"."0.7.7"."atty"}" deps)
    (features_.clicolors_control."${deps."console"."0.7.7"."clicolors_control"}" deps)
    (features_.lazy_static."${deps."console"."0.7.7"."lazy_static"}" deps)
    (features_.libc."${deps."console"."0.7.7"."libc"}" deps)
    (features_.parking_lot."${deps."console"."0.7.7"."parking_lot"}" deps)
    (features_.regex."${deps."console"."0.7.7"."regex"}" deps)
    (features_.unicode_width."${deps."console"."0.7.7"."unicode_width"}" deps)
    (features_.termios."${deps."console"."0.7.7"."termios"}" deps)
    (features_.encode_unicode."${deps."console"."0.7.7"."encode_unicode"}" deps)
    (features_.winapi."${deps."console"."0.7.7"."winapi"}" deps)
  ];


# end
# console-0.8.0

  crates.console."0.8.0" = deps: { features?(features_.console."0.8.0" deps {}) }: buildRustCrate {
    crateName = "console";
    version = "0.8.0";
    description = "A terminal and console abstraction for Rust";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "01sf0ny69s0abvmqbrnq37iyvdcpnpxv2930311d796fivf7qxgm";
    dependencies = mapFeatures features ([
      (crates."clicolors_control"."${deps."console"."0.8.0"."clicolors_control"}" deps)
      (crates."lazy_static"."${deps."console"."0.8.0"."lazy_static"}" deps)
      (crates."libc"."${deps."console"."0.8.0"."libc"}" deps)
      (crates."regex"."${deps."console"."0.8.0"."regex"}" deps)
      (crates."unicode_width"."${deps."console"."0.8.0"."unicode_width"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."termios"."${deps."console"."0.8.0"."termios"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."encode_unicode"."${deps."console"."0.8.0"."encode_unicode"}" deps)
      (crates."winapi"."${deps."console"."0.8.0"."winapi"}" deps)
    ]) else []);
  };
  features_.console."0.8.0" = deps: f: updateFeatures f (rec {
    clicolors_control."${deps.console."0.8.0".clicolors_control}".default = true;
    console."0.8.0".default = (f.console."0.8.0".default or true);
    encode_unicode."${deps.console."0.8.0".encode_unicode}".default = true;
    lazy_static."${deps.console."0.8.0".lazy_static}".default = true;
    libc."${deps.console."0.8.0".libc}".default = true;
    regex."${deps.console."0.8.0".regex}".default = true;
    termios."${deps.console."0.8.0".termios}".default = true;
    unicode_width."${deps.console."0.8.0".unicode_width}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.console."0.8.0".winapi}"."consoleapi" = true; }
      { "${deps.console."0.8.0".winapi}"."processenv" = true; }
      { "${deps.console."0.8.0".winapi}"."winbase" = true; }
      { "${deps.console."0.8.0".winapi}"."wincon" = true; }
      { "${deps.console."0.8.0".winapi}"."winuser" = true; }
      { "${deps.console."0.8.0".winapi}".default = true; }
    ];
  }) [
    (features_.clicolors_control."${deps."console"."0.8.0"."clicolors_control"}" deps)
    (features_.lazy_static."${deps."console"."0.8.0"."lazy_static"}" deps)
    (features_.libc."${deps."console"."0.8.0"."libc"}" deps)
    (features_.regex."${deps."console"."0.8.0"."regex"}" deps)
    (features_.unicode_width."${deps."console"."0.8.0"."unicode_width"}" deps)
    (features_.termios."${deps."console"."0.8.0"."termios"}" deps)
    (features_.encode_unicode."${deps."console"."0.8.0"."encode_unicode"}" deps)
    (features_.winapi."${deps."console"."0.8.0"."winapi"}" deps)
  ];


# end
# difference-2.0.0

  crates.difference."2.0.0" = deps: { features?(features_.difference."2.0.0" deps {}) }: buildRustCrate {
    crateName = "difference";
    version = "2.0.0";
    description = "A Rust text diffing and assertion library.";
    authors = [ "Johann Hofmann <mail@johann-hofmann.com>" ];
    sha256 = "1rk24wxxkhhw8drhda229dfy2nb64vvcz0ras6lq7va6wswlrc49";
    crateBin =
      [{  name = "difference"; }];
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."difference"."2.0.0" or {});
  };
  features_.difference."2.0.0" = deps: f: updateFeatures f (rec {
    difference = fold recursiveUpdate {} [
      { "2.0.0"."getopts" =
        (f.difference."2.0.0"."getopts" or false) ||
        (f.difference."2.0.0".bin or false) ||
        (difference."2.0.0"."bin" or false); }
      { "2.0.0".default = (f.difference."2.0.0".default or true); }
    ];
  }) [];


# end
# encode_unicode-0.3.5

  crates.encode_unicode."0.3.5" = deps: { features?(features_.encode_unicode."0.3.5" deps {}) }: buildRustCrate {
    crateName = "encode_unicode";
    version = "0.3.5";
    description = "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.\n";
    authors = [ "Torbjørn Birch Moltu <t.b.moltu@lyse.net>" ];
    sha256 = "01qvydmk3mbq19carzbmzbds5ck0hskb60sm7ab474vzm5ws0i02";
    dependencies = mapFeatures features ([
])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."encode_unicode"."0.3.5" or {});
  };
  features_.encode_unicode."0.3.5" = deps: f: updateFeatures f (rec {
    encode_unicode = fold recursiveUpdate {} [
      { "0.3.5"."std" =
        (f.encode_unicode."0.3.5"."std" or false) ||
        (f.encode_unicode."0.3.5".default or false) ||
        (encode_unicode."0.3.5"."default" or false); }
      { "0.3.5".default = (f.encode_unicode."0.3.5".default or true); }
    ];
  }) [];


# end
# escargot-0.4.0

  crates.escargot."0.4.0" = deps: { features?(features_.escargot."0.4.0" deps {}) }: buildRustCrate {
    crateName = "escargot";
    version = "0.4.0";
    description = "Cargo API written in Paris";
    authors = [ "Ed Page <eopage@gmail.com>" ];
    sha256 = "1420y7llg3xr954mva6yyzbh9d7382amlkv2n8j4m92z73czrqmz";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."escargot"."0.4.0"."lazy_static"}" deps)
      (crates."log"."${deps."escargot"."0.4.0"."log"}" deps)
      (crates."serde"."${deps."escargot"."0.4.0"."serde"}" deps)
      (crates."serde_json"."${deps."escargot"."0.4.0"."serde_json"}" deps)
    ]);
    features = mkFeatures (features."escargot"."0.4.0" or {});
  };
  features_.escargot."0.4.0" = deps: f: updateFeatures f (rec {
    escargot."0.4.0".default = (f.escargot."0.4.0".default or true);
    lazy_static."${deps.escargot."0.4.0".lazy_static}".default = true;
    log."${deps.escargot."0.4.0".log}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.escargot."0.4.0".serde}"."derive" = true; }
      { "${deps.escargot."0.4.0".serde}".default = true; }
    ];
    serde_json."${deps.escargot."0.4.0".serde_json}".default = true;
  }) [
    (features_.lazy_static."${deps."escargot"."0.4.0"."lazy_static"}" deps)
    (features_.log."${deps."escargot"."0.4.0"."log"}" deps)
    (features_.serde."${deps."escargot"."0.4.0"."serde"}" deps)
    (features_.serde_json."${deps."escargot"."0.4.0"."serde_json"}" deps)
  ];


# end
# filetime-0.2.5

  crates.filetime."0.2.5" = deps: { features?(features_.filetime."0.2.5" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.5";
    description = "Platform-agnostic accessors of timestamps in File metadata\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0x36k69d1cvy0c2mrqrnahjjar8f2iai99cli2jjqxc1qx6kvdl7";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.5"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.5"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.5"."libc"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.5" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.5".cfg_if}".default = true;
    filetime."0.2.5".default = (f.filetime."0.2.5".default or true);
    libc."${deps.filetime."0.2.5".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.5".redox_syscall}".default = true;
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.5"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.5"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.5"."libc"}" deps)
  ];


# end
# float-cmp-0.4.0

  crates.float_cmp."0.4.0" = deps: { features?(features_.float_cmp."0.4.0" deps {}) }: buildRustCrate {
    crateName = "float-cmp";
    version = "0.4.0";
    description = "Floating point approximate comparison traits";
    authors = [ "Mike Dilger <mike@mikedilger.com>" ];
    sha256 = "0fvzhjvrq4mwga90x8pchakm3q0q13dyiw2ppks54is0sywij122";
    libPath = "src/lib.rs";
    libName = "float_cmp";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."float_cmp"."0.4.0"."num_traits"}" deps)
    ]);
  };
  features_.float_cmp."0.4.0" = deps: f: updateFeatures f (rec {
    float_cmp."0.4.0".default = (f.float_cmp."0.4.0".default or true);
    num_traits."${deps.float_cmp."0.4.0".num_traits}".default = (f.num_traits."${deps.float_cmp."0.4.0".num_traits}".default or false);
  }) [
    (features_.num_traits."${deps."float_cmp"."0.4.0"."num_traits"}" deps)
  ];


# end
# fsevent-0.4.0

  crates.fsevent."0.4.0" = deps: { features?(features_.fsevent."0.4.0" deps {}) }: buildRustCrate {
    crateName = "fsevent";
    version = "0.4.0";
    description = "Rust bindings to the fsevent-sys macOS API for file changes notifications";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "19wynmx2k8gmsxv6fa9kpjzb9v5k6qc2ykziw25bray645spg77v";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fsevent"."0.4.0"."bitflags"}" deps)
      (crates."fsevent_sys"."${deps."fsevent"."0.4.0"."fsevent_sys"}" deps)
    ]);
  };
  features_.fsevent."0.4.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fsevent."0.4.0".bitflags}".default = true;
    fsevent."0.4.0".default = (f.fsevent."0.4.0".default or true);
    fsevent_sys."${deps.fsevent."0.4.0".fsevent_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fsevent"."0.4.0"."bitflags"}" deps)
    (features_.fsevent_sys."${deps."fsevent"."0.4.0"."fsevent_sys"}" deps)
  ];


# end
# fsevent-sys-2.0.1

  crates.fsevent_sys."2.0.1" = deps: { features?(features_.fsevent_sys."2.0.1" deps {}) }: buildRustCrate {
    crateName = "fsevent-sys";
    version = "2.0.1";
    description = "Rust bindings to the fsevent macOS API for file changes notifications";
    authors = [ "Pierre Baillet <pierre@baillet.name>" ];
    sha256 = "1jlnqp6iw4mmwd2f973j33k00mbfc1cv9wpdvxq1jk3bry558gbr";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."fsevent_sys"."2.0.1"."libc"}" deps)
    ]);
  };
  features_.fsevent_sys."2.0.1" = deps: f: updateFeatures f (rec {
    fsevent_sys."2.0.1".default = (f.fsevent_sys."2.0.1".default or true);
    libc."${deps.fsevent_sys."2.0.1".libc}".default = true;
  }) [
    (features_.libc."${deps."fsevent_sys"."2.0.1"."libc"}" deps)
  ];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# fuchsia-zircon-0.3.3

  crates.fuchsia_zircon."0.3.3" = deps: { features?(features_.fuchsia_zircon."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon";
    version = "0.3.3";
    description = "Rust bindings for the Zircon kernel";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "0jrf4shb1699r4la8z358vri8318w4mdi6qzfqy30p2ymjlca4gk";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
    ]);
  };
  features_.fuchsia_zircon."0.3.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.fuchsia_zircon."0.3.3".bitflags}".default = true;
    fuchsia_zircon."0.3.3".default = (f.fuchsia_zircon."0.3.3".default or true);
    fuchsia_zircon_sys."${deps.fuchsia_zircon."0.3.3".fuchsia_zircon_sys}".default = true;
  }) [
    (features_.bitflags."${deps."fuchsia_zircon"."0.3.3"."bitflags"}" deps)
    (features_.fuchsia_zircon_sys."${deps."fuchsia_zircon"."0.3.3"."fuchsia_zircon_sys"}" deps)
  ];


# end
# fuchsia-zircon-sys-0.3.3

  crates.fuchsia_zircon_sys."0.3.3" = deps: { features?(features_.fuchsia_zircon_sys."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fuchsia-zircon-sys";
    version = "0.3.3";
    description = "Low-level Rust bindings for the Zircon kernel";
    authors = [ "Raph Levien <raph@google.com>" ];
    sha256 = "08jp1zxrm9jbrr6l26bjal4dbm8bxfy57ickdgibsqxr1n9j3hf5";
  };
  features_.fuchsia_zircon_sys."0.3.3" = deps: f: updateFeatures f (rec {
    fuchsia_zircon_sys."0.3.3".default = (f.fuchsia_zircon_sys."0.3.3".default or true);
  }) [];


# end
# glob-0.3.0

  crates.glob."0.3.0" = deps: { features?(features_.glob."0.3.0" deps {}) }: buildRustCrate {
    crateName = "glob";
    version = "0.3.0";
    description = "Support for matching file paths against Unix shell style patterns.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1b3dc2686xnrpxwx4nd3w06f9qs433w6xmmzq6jb76hh95dwwqb2";
  };
  features_.glob."0.3.0" = deps: f: updateFeatures f (rec {
    glob."0.3.0".default = (f.glob."0.3.0".default or true);
  }) [];


# end
# indicatif-0.10.3

  crates.indicatif."0.10.3" = deps: { features?(features_.indicatif."0.10.3" deps {}) }: buildRustCrate {
    crateName = "indicatif";
    version = "0.10.3";
    description = "A progress bar and cli reporting library for Rust";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "1rh6h2hma9mjmrghf9smynhxjaannlqlki1pmr53kwdk3r3ss1cx";
    dependencies = mapFeatures features ([
      (crates."console"."${deps."indicatif"."0.10.3"."console"}" deps)
      (crates."lazy_static"."${deps."indicatif"."0.10.3"."lazy_static"}" deps)
      (crates."number_prefix"."${deps."indicatif"."0.10.3"."number_prefix"}" deps)
      (crates."parking_lot"."${deps."indicatif"."0.10.3"."parking_lot"}" deps)
      (crates."regex"."${deps."indicatif"."0.10.3"."regex"}" deps)
    ]);
  };
  features_.indicatif."0.10.3" = deps: f: updateFeatures f (rec {
    console."${deps.indicatif."0.10.3".console}".default = true;
    indicatif."0.10.3".default = (f.indicatif."0.10.3".default or true);
    lazy_static."${deps.indicatif."0.10.3".lazy_static}".default = true;
    number_prefix."${deps.indicatif."0.10.3".number_prefix}".default = true;
    parking_lot."${deps.indicatif."0.10.3".parking_lot}".default = true;
    regex."${deps.indicatif."0.10.3".regex}".default = true;
  }) [
    (features_.console."${deps."indicatif"."0.10.3"."console"}" deps)
    (features_.lazy_static."${deps."indicatif"."0.10.3"."lazy_static"}" deps)
    (features_.number_prefix."${deps."indicatif"."0.10.3"."number_prefix"}" deps)
    (features_.parking_lot."${deps."indicatif"."0.10.3"."parking_lot"}" deps)
    (features_.regex."${deps."indicatif"."0.10.3"."regex"}" deps)
  ];


# end
# inotify-0.7.0

  crates.inotify."0.7.0" = deps: { features?(features_.inotify."0.7.0" deps {}) }: buildRustCrate {
    crateName = "inotify";
    version = "0.7.0";
    description = "Idiomatic wrapper for inotify";
    authors = [ "Hanno Braun <mail@hannobraun.de>" "Félix Saparelli <me@passcod.name>" "Cristian Kubis <cristian.kubis@tsunix.de>" "Frank Denis <github@pureftpd.org>" ];
    sha256 = "1djx64kq3mgzh2yw4iilq9rigvkk4q07xrysw7m2szpd8395y3yb";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."inotify"."0.7.0"."bitflags"}" deps)
      (crates."inotify_sys"."${deps."inotify"."0.7.0"."inotify_sys"}" deps)
      (crates."libc"."${deps."inotify"."0.7.0"."libc"}" deps)
    ]);
    features = mkFeatures (features."inotify"."0.7.0" or {});
  };
  features_.inotify."0.7.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.inotify."0.7.0".bitflags}".default = true;
    inotify = fold recursiveUpdate {} [
      { "0.7.0"."futures" =
        (f.inotify."0.7.0"."futures" or false) ||
        (f.inotify."0.7.0".stream or false) ||
        (inotify."0.7.0"."stream" or false); }
      { "0.7.0"."mio" =
        (f.inotify."0.7.0"."mio" or false) ||
        (f.inotify."0.7.0".stream or false) ||
        (inotify."0.7.0"."stream" or false); }
      { "0.7.0"."stream" =
        (f.inotify."0.7.0"."stream" or false) ||
        (f.inotify."0.7.0".default or false) ||
        (inotify."0.7.0"."default" or false); }
      { "0.7.0"."tokio" =
        (f.inotify."0.7.0"."tokio" or false) ||
        (f.inotify."0.7.0".stream or false) ||
        (inotify."0.7.0"."stream" or false); }
      { "0.7.0"."tokio-io" =
        (f.inotify."0.7.0"."tokio-io" or false) ||
        (f.inotify."0.7.0".stream or false) ||
        (inotify."0.7.0"."stream" or false); }
      { "0.7.0"."tokio-reactor" =
        (f.inotify."0.7.0"."tokio-reactor" or false) ||
        (f.inotify."0.7.0".stream or false) ||
        (inotify."0.7.0"."stream" or false); }
      { "0.7.0".default = (f.inotify."0.7.0".default or true); }
    ];
    inotify_sys."${deps.inotify."0.7.0".inotify_sys}".default = true;
    libc."${deps.inotify."0.7.0".libc}".default = true;
  }) [
    (features_.bitflags."${deps."inotify"."0.7.0"."bitflags"}" deps)
    (features_.inotify_sys."${deps."inotify"."0.7.0"."inotify_sys"}" deps)
    (features_.libc."${deps."inotify"."0.7.0"."libc"}" deps)
  ];


# end
# inotify-sys-0.1.3

  crates.inotify_sys."0.1.3" = deps: { features?(features_.inotify_sys."0.1.3" deps {}) }: buildRustCrate {
    crateName = "inotify-sys";
    version = "0.1.3";
    description = "inotify bindings for the Rust programming language";
    authors = [ "Hanno Braun <hb@hannobraun.de>" ];
    sha256 = "110bbc9vprrj3cmp5g5v1adfh3wlnlbxqllwfksrlcdv1k3dnv8n";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."inotify_sys"."0.1.3"."libc"}" deps)
    ]);
  };
  features_.inotify_sys."0.1.3" = deps: f: updateFeatures f (rec {
    inotify_sys."0.1.3".default = (f.inotify_sys."0.1.3".default or true);
    libc."${deps.inotify_sys."0.1.3".libc}".default = true;
  }) [
    (features_.libc."${deps."inotify_sys"."0.1.3"."libc"}" deps)
  ];


# end
# iovec-0.1.2

  crates.iovec."0.1.2" = deps: { features?(features_.iovec."0.1.2" deps {}) }: buildRustCrate {
    crateName = "iovec";
    version = "0.1.2";
    description = "Portable buffer type for scatter/gather I/O operations\n";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0vjymmb7wj4v4kza5jjn48fcdb85j3k37y7msjl3ifz0p9yiyp2r";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."iovec"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."iovec"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.iovec."0.1.2" = deps: f: updateFeatures f (rec {
    iovec."0.1.2".default = (f.iovec."0.1.2".default or true);
    libc."${deps.iovec."0.1.2".libc}".default = true;
    winapi."${deps.iovec."0.1.2".winapi}".default = true;
  }) [
    (features_.libc."${deps."iovec"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."iovec"."0.1.2"."winapi"}" deps)
  ];


# end
# itoa-0.4.4

  crates.itoa."0.4.4" = deps: { features?(features_.itoa."0.4.4" deps {}) }: buildRustCrate {
    crateName = "itoa";
    version = "0.4.4";
    description = "Fast functions for printing integer primitives to an io::Write";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1fqc34xzzl2spfdawxd9awhzl0fwf1y6y4i94l8bq8rfrzd90awl";
    features = mkFeatures (features."itoa"."0.4.4" or {});
  };
  features_.itoa."0.4.4" = deps: f: updateFeatures f (rec {
    itoa = fold recursiveUpdate {} [
      { "0.4.4"."std" =
        (f.itoa."0.4.4"."std" or false) ||
        (f.itoa."0.4.4".default or false) ||
        (itoa."0.4.4"."default" or false); }
      { "0.4.4".default = (f.itoa."0.4.4".default or true); }
    ];
  }) [];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    description = "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# lazycell-1.2.1

  crates.lazycell."1.2.1" = deps: { features?(features_.lazycell."1.2.1" deps {}) }: buildRustCrate {
    crateName = "lazycell";
    version = "1.2.1";
    description = "A library providing a lazily filled Cell struct";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Nikita Pekin <contact@nikitapek.in>" ];
    sha256 = "1m4h2q9rgxrgc7xjnws1x81lrb68jll8w3pykx1a9bhr29q2mcwm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazycell"."1.2.1" or {});
  };
  features_.lazycell."1.2.1" = deps: f: updateFeatures f (rec {
    lazycell = fold recursiveUpdate {} [
      { "1.2.1"."clippy" =
        (f.lazycell."1.2.1"."clippy" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1"."nightly" =
        (f.lazycell."1.2.1"."nightly" or false) ||
        (f.lazycell."1.2.1".nightly-testing or false) ||
        (lazycell."1.2.1"."nightly-testing" or false); }
      { "1.2.1".default = (f.lazycell."1.2.1".default or true); }
    ];
  }) [];


# end
# libc-0.2.58

  crates.libc."0.2.58" = deps: { features?(features_.libc."0.2.58" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.58";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "06yk3c0qlcn925ap1rrhikpzgwf504ydkcadj41kib7a06f66k7c";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.58" or {});
  };
  features_.libc."0.2.58" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.58"."align" =
        (f.libc."0.2.58"."align" or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58"."rustc-std-workspace-core" =
        (f.libc."0.2.58"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.58".rustc-dep-of-std or false) ||
        (libc."0.2.58"."rustc-dep-of-std" or false); }
      { "0.2.58"."std" =
        (f.libc."0.2.58"."std" or false) ||
        (f.libc."0.2.58".default or false) ||
        (libc."0.2.58"."default" or false) ||
        (f.libc."0.2.58".use_std or false) ||
        (libc."0.2.58"."use_std" or false); }
      { "0.2.58".default = (f.libc."0.2.58".default or true); }
    ];
  }) [];


# end
# lock_api-0.2.0

  crates.lock_api."0.2.0" = deps: { features?(features_.lock_api."0.2.0" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.2.0";
    description = "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "0395dw47pjqzwd2krhj8p5khm0dhsj3h03syjdvqb75zxwagi84k";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.2.0"."scopeguard"}" deps)
    ]);
    features = mkFeatures (features."lock_api"."0.2.0" or {});
  };
  features_.lock_api."0.2.0" = deps: f: updateFeatures f (rec {
    lock_api."0.2.0".default = (f.lock_api."0.2.0".default or true);
    scopeguard."${deps.lock_api."0.2.0".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.2.0".scopeguard}".default or false);
  }) [
    (features_.scopeguard."${deps."lock_api"."0.2.0"."scopeguard"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0"."use_std" =
        (f.memchr."2.2.0"."use_std" or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
    ];
  }) [];


# end
# mio-0.6.19

  crates.mio."0.6.19" = deps: { features?(features_.mio."0.6.19" deps {}) }: buildRustCrate {
    crateName = "mio";
    version = "0.6.19";
    description = "Lightweight non-blocking IO";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0pjazzvqwkb4fgmm4b3m8i05c2gq60lvqqia0faawswgqy7rvgac";
    dependencies = mapFeatures features ([
      (crates."iovec"."${deps."mio"."0.6.19"."iovec"}" deps)
      (crates."log"."${deps."mio"."0.6.19"."log"}" deps)
      (crates."net2"."${deps."mio"."0.6.19"."net2"}" deps)
      (crates."slab"."${deps."mio"."0.6.19"."slab"}" deps)
    ])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_zircon"."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
      (crates."fuchsia_zircon_sys"."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."mio"."0.6.19"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
      (crates."miow"."${deps."mio"."0.6.19"."miow"}" deps)
      (crates."winapi"."${deps."mio"."0.6.19"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."mio"."0.6.19" or {});
  };
  features_.mio."0.6.19" = deps: f: updateFeatures f (rec {
    fuchsia_zircon."${deps.mio."0.6.19".fuchsia_zircon}".default = true;
    fuchsia_zircon_sys."${deps.mio."0.6.19".fuchsia_zircon_sys}".default = true;
    iovec."${deps.mio."0.6.19".iovec}".default = true;
    kernel32_sys."${deps.mio."0.6.19".kernel32_sys}".default = true;
    libc."${deps.mio."0.6.19".libc}".default = true;
    log."${deps.mio."0.6.19".log}".default = true;
    mio = fold recursiveUpdate {} [
      { "0.6.19"."with-deprecated" =
        (f.mio."0.6.19"."with-deprecated" or false) ||
        (f.mio."0.6.19".default or false) ||
        (mio."0.6.19"."default" or false); }
      { "0.6.19".default = (f.mio."0.6.19".default or true); }
    ];
    miow."${deps.mio."0.6.19".miow}".default = true;
    net2."${deps.mio."0.6.19".net2}".default = true;
    slab."${deps.mio."0.6.19".slab}".default = true;
    winapi."${deps.mio."0.6.19".winapi}".default = true;
  }) [
    (features_.iovec."${deps."mio"."0.6.19"."iovec"}" deps)
    (features_.log."${deps."mio"."0.6.19"."log"}" deps)
    (features_.net2."${deps."mio"."0.6.19"."net2"}" deps)
    (features_.slab."${deps."mio"."0.6.19"."slab"}" deps)
    (features_.fuchsia_zircon."${deps."mio"."0.6.19"."fuchsia_zircon"}" deps)
    (features_.fuchsia_zircon_sys."${deps."mio"."0.6.19"."fuchsia_zircon_sys"}" deps)
    (features_.libc."${deps."mio"."0.6.19"."libc"}" deps)
    (features_.kernel32_sys."${deps."mio"."0.6.19"."kernel32_sys"}" deps)
    (features_.miow."${deps."mio"."0.6.19"."miow"}" deps)
    (features_.winapi."${deps."mio"."0.6.19"."winapi"}" deps)
  ];


# end
# mio-extras-2.0.5

  crates.mio_extras."2.0.5" = deps: { features?(features_.mio_extras."2.0.5" deps {}) }: buildRustCrate {
    crateName = "mio-extras";
    version = "2.0.5";
    description = "Extra components for use with Mio";
    authors = [ "Carl Lerche <me@carllerche.com>" "David Hotham" ];
    sha256 = "0h3f488fbqgiigs4zhff75db6afj8hndf7dfw7gw22fg286hfhwq";
    dependencies = mapFeatures features ([
      (crates."lazycell"."${deps."mio_extras"."2.0.5"."lazycell"}" deps)
      (crates."log"."${deps."mio_extras"."2.0.5"."log"}" deps)
      (crates."mio"."${deps."mio_extras"."2.0.5"."mio"}" deps)
      (crates."slab"."${deps."mio_extras"."2.0.5"."slab"}" deps)
    ]);
  };
  features_.mio_extras."2.0.5" = deps: f: updateFeatures f (rec {
    lazycell."${deps.mio_extras."2.0.5".lazycell}".default = true;
    log."${deps.mio_extras."2.0.5".log}".default = true;
    mio."${deps.mio_extras."2.0.5".mio}".default = true;
    mio_extras."2.0.5".default = (f.mio_extras."2.0.5".default or true);
    slab."${deps.mio_extras."2.0.5".slab}".default = true;
  }) [
    (features_.lazycell."${deps."mio_extras"."2.0.5"."lazycell"}" deps)
    (features_.log."${deps."mio_extras"."2.0.5"."log"}" deps)
    (features_.mio."${deps."mio_extras"."2.0.5"."mio"}" deps)
    (features_.slab."${deps."mio_extras"."2.0.5"."slab"}" deps)
  ];


# end
# miow-0.2.1

  crates.miow."0.2.1" = deps: { features?(features_.miow."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miow";
    version = "0.2.1";
    description = "A zero overhead I/O library for Windows, focusing on IOCP and Async I/O\nabstractions.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "14f8zkc6ix7mkyis1vsqnim8m29b6l55abkba3p2yz7j1ibcvrl0";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
      (crates."net2"."${deps."miow"."0.2.1"."net2"}" deps)
      (crates."winapi"."${deps."miow"."0.2.1"."winapi"}" deps)
      (crates."ws2_32_sys"."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
    ]);
  };
  features_.miow."0.2.1" = deps: f: updateFeatures f (rec {
    kernel32_sys."${deps.miow."0.2.1".kernel32_sys}".default = true;
    miow."0.2.1".default = (f.miow."0.2.1".default or true);
    net2."${deps.miow."0.2.1".net2}".default = (f.net2."${deps.miow."0.2.1".net2}".default or false);
    winapi."${deps.miow."0.2.1".winapi}".default = true;
    ws2_32_sys."${deps.miow."0.2.1".ws2_32_sys}".default = true;
  }) [
    (features_.kernel32_sys."${deps."miow"."0.2.1"."kernel32_sys"}" deps)
    (features_.net2."${deps."miow"."0.2.1"."net2"}" deps)
    (features_.winapi."${deps."miow"."0.2.1"."winapi"}" deps)
    (features_.ws2_32_sys."${deps."miow"."0.2.1"."ws2_32_sys"}" deps)
  ];


# end
# net2-0.2.33

  crates.net2."0.2.33" = deps: { features?(features_.net2."0.2.33" deps {}) }: buildRustCrate {
    crateName = "net2";
    version = "0.2.33";
    description = "Extensions to the standard library's networking types as proposed in RFC 1158.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1qnmajafgybj5wyxz9iffa8x5wgbwd2znfklmhqj7vl6lw1m65mq";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."net2"."0.2.33"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" || (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."net2"."0.2.33"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."net2"."0.2.33"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."net2"."0.2.33" or {});
  };
  features_.net2."0.2.33" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.net2."0.2.33".cfg_if}".default = true;
    libc."${deps.net2."0.2.33".libc}".default = true;
    net2 = fold recursiveUpdate {} [
      { "0.2.33"."duration" =
        (f.net2."0.2.33"."duration" or false) ||
        (f.net2."0.2.33".default or false) ||
        (net2."0.2.33"."default" or false); }
      { "0.2.33".default = (f.net2."0.2.33".default or true); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.net2."0.2.33".winapi}"."handleapi" = true; }
      { "${deps.net2."0.2.33".winapi}"."winsock2" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2def" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2ipdef" = true; }
      { "${deps.net2."0.2.33".winapi}"."ws2tcpip" = true; }
      { "${deps.net2."0.2.33".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."net2"."0.2.33"."cfg_if"}" deps)
    (features_.libc."${deps."net2"."0.2.33"."libc"}" deps)
    (features_.winapi."${deps."net2"."0.2.33"."winapi"}" deps)
  ];


# end
# normalize-line-endings-0.2.2

  crates.normalize_line_endings."0.2.2" = deps: { features?(features_.normalize_line_endings."0.2.2" deps {}) }: buildRustCrate {
    crateName = "normalize-line-endings";
    version = "0.2.2";
    description = "Takes an iterator over chars and returns a new iterator with all line endings (\\r, \\n, or \\r\\n) as \\n";
    authors = [ "Richard Dodd <richdodj@gmail.com>" ];
    sha256 = "0hzwsp4p30g105y3s2vj5wg8yc187jmkacrp9m7shwpzkfdiri0y";
  };
  features_.normalize_line_endings."0.2.2" = deps: f: updateFeatures f (rec {
    normalize_line_endings."0.2.2".default = (f.normalize_line_endings."0.2.2".default or true);
  }) [];


# end
# notify-4.0.15

  crates.notify."4.0.15" = deps: { features?(features_.notify."4.0.15" deps {}) }: buildRustCrate {
    crateName = "notify";
    version = "4.0.15";
    description = "Cross-platform filesystem notification library";
    authors = [ "Félix Saparelli <me@passcod.name>" "Jorge Israel Peña <jorge.israel.p@gmail.com>" "Michael Maurizi <michael.maurizi@gmail.com>" "Pierre Baillet <oct@zoy.org>" "Joe Wilm <joe@jwilm.com>" "Daniel Faust <hessijames@gmail.com>" "Aron Heinecke <Ox0p54r36@t-online.de>" ];
    sha256 = "1d3ln4xc92x14rnyf11jfix8rqhp1v10z0j3m275x0yd7g2s7ac6";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."notify"."4.0.15"."bitflags"}" deps)
      (crates."filetime"."${deps."notify"."4.0.15"."filetime"}" deps)
      (crates."libc"."${deps."notify"."4.0.15"."libc"}" deps)
      (crates."walkdir"."${deps."notify"."4.0.15"."walkdir"}" deps)
    ])
      ++ (if kernel == "linux" then mapFeatures features ([
      (crates."inotify"."${deps."notify"."4.0.15"."inotify"}" deps)
      (crates."mio"."${deps."notify"."4.0.15"."mio"}" deps)
      (crates."mio_extras"."${deps."notify"."4.0.15"."mio_extras"}" deps)
    ]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
      (crates."fsevent"."${deps."notify"."4.0.15"."fsevent"}" deps)
      (crates."fsevent_sys"."${deps."notify"."4.0.15"."fsevent_sys"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."notify"."4.0.15"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."notify"."4.0.15" or {});
  };
  features_.notify."4.0.15" = deps: f: updateFeatures f (rec {
    bitflags."${deps.notify."4.0.15".bitflags}".default = true;
    filetime."${deps.notify."4.0.15".filetime}".default = true;
    fsevent."${deps.notify."4.0.15".fsevent}".default = true;
    fsevent_sys."${deps.notify."4.0.15".fsevent_sys}".default = true;
    inotify."${deps.notify."4.0.15".inotify}".default = (f.inotify."${deps.notify."4.0.15".inotify}".default or false);
    libc."${deps.notify."4.0.15".libc}".default = true;
    mio."${deps.notify."4.0.15".mio}".default = true;
    mio_extras."${deps.notify."4.0.15".mio_extras}".default = true;
    notify."4.0.15".default = (f.notify."4.0.15".default or true);
    walkdir."${deps.notify."4.0.15".walkdir}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.notify."4.0.15".winapi}"."fileapi" = true; }
      { "${deps.notify."4.0.15".winapi}"."handleapi" = true; }
      { "${deps.notify."4.0.15".winapi}"."ioapiset" = true; }
      { "${deps.notify."4.0.15".winapi}"."minwinbase" = true; }
      { "${deps.notify."4.0.15".winapi}"."synchapi" = true; }
      { "${deps.notify."4.0.15".winapi}"."winbase" = true; }
      { "${deps.notify."4.0.15".winapi}"."winnt" = true; }
      { "${deps.notify."4.0.15".winapi}".default = true; }
    ];
  }) [
    (features_.bitflags."${deps."notify"."4.0.15"."bitflags"}" deps)
    (features_.filetime."${deps."notify"."4.0.15"."filetime"}" deps)
    (features_.libc."${deps."notify"."4.0.15"."libc"}" deps)
    (features_.walkdir."${deps."notify"."4.0.15"."walkdir"}" deps)
    (features_.inotify."${deps."notify"."4.0.15"."inotify"}" deps)
    (features_.mio."${deps."notify"."4.0.15"."mio"}" deps)
    (features_.mio_extras."${deps."notify"."4.0.15"."mio_extras"}" deps)
    (features_.fsevent."${deps."notify"."4.0.15"."fsevent"}" deps)
    (features_.fsevent_sys."${deps."notify"."4.0.15"."fsevent_sys"}" deps)
    (features_.winapi."${deps."notify"."4.0.15"."winapi"}" deps)
  ];


# end
# num-traits-0.2.8

  crates.num_traits."0.2.8" = deps: { features?(features_.num_traits."0.2.8" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.8";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_traits"."0.2.8"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_traits"."0.2.8" or {});
  };
  features_.num_traits."0.2.8" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_traits."0.2.8".autocfg}".default = true;
    num_traits = fold recursiveUpdate {} [
      { "0.2.8"."std" =
        (f.num_traits."0.2.8"."std" or false) ||
        (f.num_traits."0.2.8".default or false) ||
        (num_traits."0.2.8"."default" or false); }
      { "0.2.8".default = (f.num_traits."0.2.8".default or true); }
    ];
  }) [
    (features_.autocfg."${deps."num_traits"."0.2.8"."autocfg"}" deps)
  ];


# end
# number_prefix-0.2.8

  crates.number_prefix."0.2.8" = deps: { features?(features_.number_prefix."0.2.8" deps {}) }: buildRustCrate {
    crateName = "number_prefix";
    version = "0.2.8";
    description = "Library for formatting numeric prefixes: kilo, giga, kibi.";
    authors = [ "ogham@bsago.me" ];
    sha256 = "0qlm6kx5ynjlqjmc88nb8dlansanxr8ajh1b5sb398d0n59lcikf";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."number_prefix"."0.2.8"."num_traits"}" deps)
    ]);
  };
  features_.number_prefix."0.2.8" = deps: f: updateFeatures f (rec {
    num_traits."${deps.number_prefix."0.2.8".num_traits}".default = true;
    number_prefix."0.2.8".default = (f.number_prefix."0.2.8".default or true);
  }) [
    (features_.num_traits."${deps."number_prefix"."0.2.8"."num_traits"}" deps)
  ];


# end
# numtoa-0.1.0

  crates.numtoa."0.1.0" = deps: { features?(features_.numtoa."0.1.0" deps {}) }: buildRustCrate {
    crateName = "numtoa";
    version = "0.1.0";
    description = "Convert numbers into stack-allocated byte arrays";
    authors = [ "Michael Aaron Murphy <mmstickman@gmail.com>" ];
    sha256 = "1i2wxr96bb1rvax15z843126z3bnl2frpx69vxsp95r96wr24j08";
    features = mkFeatures (features."numtoa"."0.1.0" or {});
  };
  features_.numtoa."0.1.0" = deps: f: updateFeatures f (rec {
    numtoa."0.1.0".default = (f.numtoa."0.1.0".default or true);
  }) [];


# end
# parking_lot-0.8.0

  crates.parking_lot."0.8.0" = deps: { features?(features_.parking_lot."0.8.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.8.0";
    description = "More compact and efficient implementations of the standard synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "176yk6b55qxz9h4hp01icpb7jsh4fki0ycp9gs6x3yqcxgfkp53z";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.8.0"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.8.0"."parking_lot_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot"."0.8.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.8.0" or {});
  };
  features_.parking_lot."0.8.0" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.8.0".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.8.0".lock_api}"."nightly" or false) ||
        (parking_lot."0.8.0"."nightly" or false) ||
        (f."parking_lot"."0.8.0"."nightly" or false); }
      { "${deps.parking_lot."0.8.0".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.8.0".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.8.0"."owning_ref" or false) ||
        (f."parking_lot"."0.8.0"."owning_ref" or false); }
      { "${deps.parking_lot."0.8.0".lock_api}"."serde" =
        (f.lock_api."${deps.parking_lot."0.8.0".lock_api}"."serde" or false) ||
        (parking_lot."0.8.0"."serde" or false) ||
        (f."parking_lot"."0.8.0"."serde" or false); }
      { "${deps.parking_lot."0.8.0".lock_api}".default = true; }
    ];
    parking_lot."0.8.0".default = (f.parking_lot."0.8.0".default or true);
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.8.0".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.8.0".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.8.0"."deadlock_detection" or false) ||
        (f."parking_lot"."0.8.0"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.8.0".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.8.0".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.8.0"."nightly" or false) ||
        (f."parking_lot"."0.8.0"."nightly" or false); }
      { "${deps.parking_lot."0.8.0".parking_lot_core}".default = true; }
    ];
    rustc_version."${deps.parking_lot."0.8.0".rustc_version}".default = true;
  }) [
    (features_.lock_api."${deps."parking_lot"."0.8.0"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.8.0"."parking_lot_core"}" deps)
    (features_.rustc_version."${deps."parking_lot"."0.8.0"."rustc_version"}" deps)
  ];


# end
# parking_lot_core-0.5.0

  crates.parking_lot_core."0.5.0" = deps: { features?(features_.parking_lot_core."0.5.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.5.0";
    description = "An advanced API for creating custom synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "0a8v2jnm5r97qmihlpffxwr252n8i3ljywgbxzagnma55k3323zp";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."parking_lot_core"."0.5.0"."cfg_if"}" deps)
      (crates."rand"."${deps."parking_lot_core"."0.5.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.5.0"."smallvec"}" deps)
    ])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."parking_lot_core"."0.5.0"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."parking_lot_core"."0.5.0"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.5.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.5.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.5.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.5.0" or {});
  };
  features_.parking_lot_core."0.5.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.parking_lot_core."0.5.0".cfg_if}".default = true;
    cloudabi."${deps.parking_lot_core."0.5.0".cloudabi}".default = true;
    libc."${deps.parking_lot_core."0.5.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.5.0"."backtrace" =
        (f.parking_lot_core."0.5.0"."backtrace" or false) ||
        (f.parking_lot_core."0.5.0".deadlock_detection or false) ||
        (parking_lot_core."0.5.0"."deadlock_detection" or false); }
      { "0.5.0"."petgraph" =
        (f.parking_lot_core."0.5.0"."petgraph" or false) ||
        (f.parking_lot_core."0.5.0".deadlock_detection or false) ||
        (parking_lot_core."0.5.0"."deadlock_detection" or false); }
      { "0.5.0"."thread-id" =
        (f.parking_lot_core."0.5.0"."thread-id" or false) ||
        (f.parking_lot_core."0.5.0".deadlock_detection or false) ||
        (parking_lot_core."0.5.0"."deadlock_detection" or false); }
      { "0.5.0".default = (f.parking_lot_core."0.5.0".default or true); }
    ];
    rand."${deps.parking_lot_core."0.5.0".rand}".default = true;
    redox_syscall."${deps.parking_lot_core."0.5.0".redox_syscall}".default = true;
    rustc_version."${deps.parking_lot_core."0.5.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.5.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.5.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.5.0".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."parking_lot_core"."0.5.0"."cfg_if"}" deps)
    (features_.rand."${deps."parking_lot_core"."0.5.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.5.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.5.0"."rustc_version"}" deps)
    (features_.cloudabi."${deps."parking_lot_core"."0.5.0"."cloudabi"}" deps)
    (features_.redox_syscall."${deps."parking_lot_core"."0.5.0"."redox_syscall"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.5.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.5.0"."winapi"}" deps)
  ];


# end
# predicates-1.0.1

  crates.predicates."1.0.1" = deps: { features?(features_.predicates."1.0.1" deps {}) }: buildRustCrate {
    crateName = "predicates";
    version = "1.0.1";
    description = "An implementation of boolean-valued predicate functions.\n";
    authors = [ "Nick Stevens <nick@bitcurry.com>" ];
    sha256 = "06l9y5rml2c9jinnfv5kk40ssg7xc0g9jaibzmhh9kwff4im8ipx";
    dependencies = mapFeatures features ([
      (crates."predicates_core"."${deps."predicates"."1.0.1"."predicates_core"}" deps)
    ]
      ++ (if features.predicates."1.0.1".difference or false then [ (crates.difference."${deps."predicates"."1.0.1".difference}" deps) ] else [])
      ++ (if features.predicates."1.0.1".float-cmp or false then [ (crates.float_cmp."${deps."predicates"."1.0.1".float_cmp}" deps) ] else [])
      ++ (if features.predicates."1.0.1".normalize-line-endings or false then [ (crates.normalize_line_endings."${deps."predicates"."1.0.1".normalize_line_endings}" deps) ] else [])
      ++ (if features.predicates."1.0.1".regex or false then [ (crates.regex."${deps."predicates"."1.0.1".regex}" deps) ] else []));
    features = mkFeatures (features."predicates"."1.0.1" or {});
  };
  features_.predicates."1.0.1" = deps: f: updateFeatures f (rec {
    difference."${deps.predicates."1.0.1".difference}".default = true;
    float_cmp."${deps.predicates."1.0.1".float_cmp}".default = true;
    normalize_line_endings."${deps.predicates."1.0.1".normalize_line_endings}".default = true;
    predicates = fold recursiveUpdate {} [
      { "1.0.1"."difference" =
        (f.predicates."1.0.1"."difference" or false) ||
        (f.predicates."1.0.1".default or false) ||
        (predicates."1.0.1"."default" or false); }
      { "1.0.1"."float-cmp" =
        (f.predicates."1.0.1"."float-cmp" or false) ||
        (f.predicates."1.0.1".default or false) ||
        (predicates."1.0.1"."default" or false); }
      { "1.0.1"."normalize-line-endings" =
        (f.predicates."1.0.1"."normalize-line-endings" or false) ||
        (f.predicates."1.0.1".default or false) ||
        (predicates."1.0.1"."default" or false); }
      { "1.0.1"."regex" =
        (f.predicates."1.0.1"."regex" or false) ||
        (f.predicates."1.0.1".default or false) ||
        (predicates."1.0.1"."default" or false); }
      { "1.0.1".default = (f.predicates."1.0.1".default or true); }
    ];
    predicates_core."${deps.predicates."1.0.1".predicates_core}".default = true;
    regex."${deps.predicates."1.0.1".regex}".default = true;
  }) [
    (features_.difference."${deps."predicates"."1.0.1"."difference"}" deps)
    (features_.float_cmp."${deps."predicates"."1.0.1"."float_cmp"}" deps)
    (features_.normalize_line_endings."${deps."predicates"."1.0.1"."normalize_line_endings"}" deps)
    (features_.predicates_core."${deps."predicates"."1.0.1"."predicates_core"}" deps)
    (features_.regex."${deps."predicates"."1.0.1"."regex"}" deps)
  ];


# end
# predicates-core-1.0.0

  crates.predicates_core."1.0.0" = deps: { features?(features_.predicates_core."1.0.0" deps {}) }: buildRustCrate {
    crateName = "predicates-core";
    version = "1.0.0";
    description = "An API for boolean-valued predicate functions.\n";
    authors = [ "Nick Stevens <nick@bitcurry.com>" ];
    sha256 = "14khkbx5lv35jbs64cyxafiljjygamy25y5brnnh38ksymlc8izp";
  };
  features_.predicates_core."1.0.0" = deps: f: updateFeatures f (rec {
    predicates_core."1.0.0".default = (f.predicates_core."1.0.0".default or true);
  }) [];


# end
# predicates-tree-1.0.0

  crates.predicates_tree."1.0.0" = deps: { features?(features_.predicates_tree."1.0.0" deps {}) }: buildRustCrate {
    crateName = "predicates-tree";
    version = "1.0.0";
    description = "Render boolean-valued predicate functions results as a tree.\n";
    authors = [ "Nick Stevens <nick@bitcurry.com>" ];
    sha256 = "0bkgg7nz6vnv4f5ah4hx2xb946w18b8sv90z1lyz4vv7x7fa45np";
    dependencies = mapFeatures features ([
      (crates."predicates_core"."${deps."predicates_tree"."1.0.0"."predicates_core"}" deps)
      (crates."treeline"."${deps."predicates_tree"."1.0.0"."treeline"}" deps)
    ]);
  };
  features_.predicates_tree."1.0.0" = deps: f: updateFeatures f (rec {
    predicates_core."${deps.predicates_tree."1.0.0".predicates_core}".default = true;
    predicates_tree."1.0.0".default = (f.predicates_tree."1.0.0".default or true);
    treeline."${deps.predicates_tree."1.0.0".treeline}".default = true;
  }) [
    (features_.predicates_core."${deps."predicates_tree"."1.0.0"."predicates_core"}" deps)
    (features_.treeline."${deps."predicates_tree"."1.0.0"."treeline"}" deps)
  ];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30"."proc-macro" =
        (f.proc_macro2."0.4.30"."proc-macro" or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12"."proc-macro" =
        (f.quote."0.6.12"."proc-macro" or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.54

  crates.redox_syscall."0.1.54" = deps: { features?(features_.redox_syscall."0.1.54" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.54";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1ndcp7brnvii87ndcd34fk846498r07iznphkslcy0shic9cp4rr";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.54" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.54".default = (f.redox_syscall."0.1.54".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    description = "A Rust library to access Redox termios functions";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.6

  crates.regex."1.1.6" = deps: { features?(features_.regex."1.1.6" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.6";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1yynvabg03m5f65qxcw70qckkfjwi9xyfpjdp6yq7pk0xf0ydc0b";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.6"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.6"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.6"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.6"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.6" or {});
  };
  features_.regex."1.1.6" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.6".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.6".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.6"."pattern" =
        (f.regex."1.1.6"."pattern" or false) ||
        (f.regex."1.1.6".unstable or false) ||
        (regex."1.1.6"."unstable" or false); }
      { "1.1.6"."use_std" =
        (f.regex."1.1.6"."use_std" or false) ||
        (f.regex."1.1.6".default or false) ||
        (regex."1.1.6"."default" or false); }
      { "1.1.6".default = (f.regex."1.1.6".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.6".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.6".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.6".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.6"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.6"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.6"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.6"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.6

  crates.regex_syntax."0.6.6" = deps: { features?(features_.regex_syntax."0.6.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1cjrdc3affa3rjfaxkp91xnf9k0fsqn9z4xqc280vv39nvrl8p8b";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.6".default = (f.regex_syntax."0.6.6".default or true);
    ucd_util."${deps.regex_syntax."0.6.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
  ];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# ryu-0.2.8

  crates.ryu."0.2.8" = deps: { features?(features_.ryu."0.2.8" deps {}) }: buildRustCrate {
    crateName = "ryu";
    version = "0.2.8";
    description = "Fast floating point to string conversion";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1qd0ni13w19a97y51vm31biyh2pvz8j9gi78rn5in912mi04xcnk";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ryu"."0.2.8" or {});
  };
  features_.ryu."0.2.8" = deps: f: updateFeatures f (rec {
    ryu."0.2.8".default = (f.ryu."0.2.8".default or true);
  }) [];


# end
# same-file-1.0.4

  crates.same_file."1.0.4" = deps: { features?(features_.same_file."1.0.4" deps {}) }: buildRustCrate {
    crateName = "same-file";
    version = "1.0.4";
    description = "A simple crate for determining whether two file paths point to the same file.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1zs244ssl381cqlnh2g42g3i60qip4z72i26z44d6kas3y3gy77q";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi_util"."${deps."same_file"."1.0.4"."winapi_util"}" deps)
    ]) else []);
  };
  features_.same_file."1.0.4" = deps: f: updateFeatures f (rec {
    same_file."1.0.4".default = (f.same_file."1.0.4".default or true);
    winapi_util."${deps.same_file."1.0.4".winapi_util}".default = true;
  }) [
    (features_.winapi_util."${deps."same_file"."1.0.4"."winapi_util"}" deps)
  ];


# end
# scopeguard-1.0.0

  crates.scopeguard."1.0.0" = deps: { features?(features_.scopeguard."1.0.0" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "1.0.0";
    description = "A RAII scope guard that will run a given closure when it goes out of scope,\neven if the code between panics (assuming unwinding panic).\n\nDefines the macros `defer!`, `defer_on_unwind!`, `defer_on_success!` as\nshorthands for guards with one of the implemented strategies.\n";
    authors = [ "bluss" ];
    sha256 = "15vrix0jx3i4naqnjswddzn4m036krrv71a8vkh3b1zq4hxmrb0q";
    features = mkFeatures (features."scopeguard"."1.0.0" or {});
  };
  features_.scopeguard."1.0.0" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "1.0.0"."use_std" =
        (f.scopeguard."1.0.0"."use_std" or false) ||
        (f.scopeguard."1.0.0".default or false) ||
        (scopeguard."1.0.0"."default" or false); }
      { "1.0.0".default = (f.scopeguard."1.0.0".default or true); }
    ];
  }) [];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.92

  crates.serde."1.0.92" = deps: { features?(features_.serde."1.0.92" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.92";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0h8mpx249fs4vcwi7dvl6jxqv7b1dxpnjbhkz6b58vxn6p0dzgbj";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.92".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.92".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.92" or {});
  };
  features_.serde."1.0.92" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.92"."serde_derive" =
        (f.serde."1.0.92"."serde_derive" or false) ||
        (f.serde."1.0.92".derive or false) ||
        (serde."1.0.92"."derive" or false); }
      { "1.0.92"."std" =
        (f.serde."1.0.92"."std" or false) ||
        (f.serde."1.0.92".default or false) ||
        (serde."1.0.92"."default" or false); }
      { "1.0.92"."unstable" =
        (f.serde."1.0.92"."unstable" or false) ||
        (f.serde."1.0.92".alloc or false) ||
        (serde."1.0.92"."alloc" or false); }
      { "1.0.92".default = (f.serde."1.0.92".default or true); }
    ];
    serde_derive."${deps.serde."1.0.92".serde_derive}".default = true;
  }) [
    (features_.serde_derive."${deps."serde"."1.0.92"."serde_derive"}" deps)
  ];


# end
# serde_derive-1.0.92

  crates.serde_derive."1.0.92" = deps: { features?(features_.serde_derive."1.0.92" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.92";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0c9a6h88b57kzhnngmd2zx87miysz9mxb137m9nl8l0gaqz15wkv";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.92"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.92"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.92"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.92" or {});
  };
  features_.serde_derive."1.0.92" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.92".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.92".quote}".default = true;
    serde_derive."1.0.92".default = (f.serde_derive."1.0.92".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.92".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.92".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.92"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.92"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.92"."syn"}" deps)
  ];


# end
# serde_json-1.0.39

  crates.serde_json."1.0.39" = deps: { features?(features_.serde_json."1.0.39" deps {}) }: buildRustCrate {
    crateName = "serde_json";
    version = "1.0.39";
    description = "A JSON serialization file format";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "07ydv06hn8x0yl0rc94l2wl9r2xz1fqd97n1s6j3bgdc6gw406a8";
    dependencies = mapFeatures features ([
      (crates."itoa"."${deps."serde_json"."1.0.39"."itoa"}" deps)
      (crates."ryu"."${deps."serde_json"."1.0.39"."ryu"}" deps)
      (crates."serde"."${deps."serde_json"."1.0.39"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_json"."1.0.39" or {});
  };
  features_.serde_json."1.0.39" = deps: f: updateFeatures f (rec {
    itoa."${deps.serde_json."1.0.39".itoa}".default = true;
    ryu."${deps.serde_json."1.0.39".ryu}".default = true;
    serde."${deps.serde_json."1.0.39".serde}".default = true;
    serde_json = fold recursiveUpdate {} [
      { "1.0.39"."indexmap" =
        (f.serde_json."1.0.39"."indexmap" or false) ||
        (f.serde_json."1.0.39".preserve_order or false) ||
        (serde_json."1.0.39"."preserve_order" or false); }
      { "1.0.39".default = (f.serde_json."1.0.39".default or true); }
    ];
  }) [
    (features_.itoa."${deps."serde_json"."1.0.39"."itoa"}" deps)
    (features_.ryu."${deps."serde_json"."1.0.39"."ryu"}" deps)
    (features_.serde."${deps."serde_json"."1.0.39"."serde"}" deps)
  ];


# end
# slab-0.4.2

  crates.slab."0.4.2" = deps: { features?(features_.slab."0.4.2" deps {}) }: buildRustCrate {
    crateName = "slab";
    version = "0.4.2";
    description = "Pre-allocated storage for a uniform data type";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "0h1l2z7qy6207kv0v3iigdf2xfk9yrhbwj1svlxk6wxjmdxvgdl7";
  };
  features_.slab."0.4.2" = deps: f: updateFeatures f (rec {
    slab."0.4.2".default = (f.slab."0.4.2".default or true);
  }) [];


# end
# smallvec-0.6.9

  crates.smallvec."0.6.9" = deps: { features?(features_.smallvec."0.6.9" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.9";
    description = "'Small vector' optimization: store up to a small number of items on the stack";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "0p96l51a2pq5y0vn48nhbm6qslbc6k8h28cxm0pmzkqmj7xynz6w";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.9" or {});
  };
  features_.smallvec."0.6.9" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.9"."std" =
        (f.smallvec."0.6.9"."std" or false) ||
        (f.smallvec."0.6.9".default or false) ||
        (smallvec."0.6.9"."default" or false); }
      { "0.6.9".default = (f.smallvec."0.6.9".default or true); }
    ];
  }) [];


# end
# strsim-0.8.0

  crates.strsim."0.8.0" = deps: { features?(features_.strsim."0.8.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.8.0";
    description = "Implementations of string similarity metrics.\nIncludes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.\n";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0d3jsdz22wgjyxdakqnvdgmwjdvkximz50d9zfk4qlalw635qcvy";
  };
  features_.strsim."0.8.0" = deps: f: updateFeatures f (rec {
    strsim."0.8.0".default = (f.strsim."0.8.0".default or true);
  }) [];


# end
# syn-0.15.34

  crates.syn."0.15.34" = deps: { features?(features_.syn."0.15.34" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.34";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "15vmpadp8qyrri6p1mp2z59dbapwds1r2z51v8nzpf3b9c6xvzpf";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.34"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.34"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.34".quote or false then [ (crates.quote."${deps."syn"."0.15.34".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.34" or {});
  };
  features_.syn."0.15.34" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.34".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.34".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.34"."proc-macro" or false) ||
        (f."syn"."0.15.34"."proc-macro" or false); }
      { "${deps.syn."0.15.34".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.34".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.34".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.34".quote}"."proc-macro" or false) ||
        (syn."0.15.34"."proc-macro" or false) ||
        (f."syn"."0.15.34"."proc-macro" or false); }
      { "${deps.syn."0.15.34".quote}".default = (f.quote."${deps.syn."0.15.34".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.34"."clone-impls" =
        (f.syn."0.15.34"."clone-impls" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."derive" =
        (f.syn."0.15.34"."derive" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."parsing" =
        (f.syn."0.15.34"."parsing" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."printing" =
        (f.syn."0.15.34"."printing" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."proc-macro" =
        (f.syn."0.15.34"."proc-macro" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."quote" =
        (f.syn."0.15.34"."quote" or false) ||
        (f.syn."0.15.34".printing or false) ||
        (syn."0.15.34"."printing" or false); }
      { "0.15.34".default = (f.syn."0.15.34".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.34".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.34"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.34"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.34"."unicode_xid"}" deps)
  ];


# end
# termion-1.5.2

  crates.termion."1.5.2" = deps: { features?(features_.termion."1.5.2" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.2";
    description = "A bindless library for manipulating terminals.";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "0a8znl9hdnr9d21xskb2q77r6pkvrabh71b43371vy9wq97m78d9";
    dependencies = mapFeatures features ([
      (crates."numtoa"."${deps."termion"."1.5.2"."numtoa"}" deps)
    ])
      ++ (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.2"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.2"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.2" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.2".libc}".default = true;
    numtoa = fold recursiveUpdate {} [
      { "${deps.termion."1.5.2".numtoa}"."std" = true; }
      { "${deps.termion."1.5.2".numtoa}".default = true; }
    ];
    redox_syscall."${deps.termion."1.5.2".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.2".redox_termios}".default = true;
    termion."1.5.2".default = (f.termion."1.5.2".default or true);
  }) [
    (features_.numtoa."${deps."termion"."1.5.2"."numtoa"}" deps)
    (features_.libc."${deps."termion"."1.5.2"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.2"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.2"."redox_termios"}" deps)
  ];


# end
# termios-0.3.1

  crates.termios."0.3.1" = deps: { features?(features_.termios."0.3.1" deps {}) }: buildRustCrate {
    crateName = "termios";
    version = "0.3.1";
    description = "Safe bindings for the termios library.";
    authors = [ "David Cuddeback <david.cuddeback@gmail.com>" ];
    sha256 = "1h0fwglrhay85fkbl05ym5gh8hxzl7pyz0a51zfmmngxrf7823c2";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."termios"."0.3.1"."libc"}" deps)
    ]);
  };
  features_.termios."0.3.1" = deps: f: updateFeatures f (rec {
    libc."${deps.termios."0.3.1".libc}".default = true;
    termios."0.3.1".default = (f.termios."0.3.1".default or true);
  }) [
    (features_.libc."${deps."termios"."0.3.1"."libc"}" deps)
  ];


# end
# textwrap-0.11.0

  crates.textwrap."0.11.0" = deps: { features?(features_.textwrap."0.11.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.11.0";
    description = "Textwrap is a small library for word wrapping, indenting, and\ndedenting strings.\n\nYou can use it to format strings (such as help and error messages) for\ndisplay in commandline applications. It is designed to be efficient\nand handle Unicode characters correctly.\n";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "0s25qh49n7kjayrdj4q3v0jk0jc6vy88rdw0bvgfxqlscpqpxi7d";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
    ]);
  };
  features_.textwrap."0.11.0" = deps: f: updateFeatures f (rec {
    textwrap."0.11.0".default = (f.textwrap."0.11.0".default or true);
    unicode_width."${deps.textwrap."0.11.0".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# treeline-0.1.0

  crates.treeline."0.1.0" = deps: { features?(features_.treeline."0.1.0" deps {}) }: buildRustCrate {
    crateName = "treeline";
    version = "0.1.0";
    description = "a library for visualizing tree structured data";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0122i5hmryjp9ckvxn2n2nng954ppp3154pcglldg77wixqp4ir6";
  };
  features_.treeline."0.1.0" = deps: f: updateFeatures f (rec {
    treeline."0.1.0".default = (f.treeline."0.1.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# vec_map-0.8.1

  crates.vec_map."0.8.1" = deps: { features?(features_.vec_map."0.8.1" deps {}) }: buildRustCrate {
    crateName = "vec_map";
    version = "0.8.1";
    description = "A simple map based on a vector for small integer keys";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Jorge Aparicio <japaricious@gmail.com>" "Alexis Beingessner <a.beingessner@gmail.com>" "Brian Anderson <>" "tbu- <>" "Manish Goregaokar <>" "Aaron Turon <aturon@mozilla.com>" "Adolfo Ochagavía <>" "Niko Matsakis <>" "Steven Fackler <>" "Chase Southwood <csouth3@illinois.edu>" "Eduard Burtescu <>" "Florian Wilkens <>" "Félix Raimundo <>" "Tibor Benke <>" "Markus Siemens <markus@m-siemens.de>" "Josh Branchaud <jbranchaud@gmail.com>" "Huon Wilson <dbau.pp@gmail.com>" "Corey Farwell <coref@rwell.org>" "Aaron Liblong <>" "Nick Cameron <nrc@ncameron.org>" "Patrick Walton <pcwalton@mimiga.net>" "Felix S Klock II <>" "Andrew Paseltiner <apaseltiner@gmail.com>" "Sean McArthur <sean.monstar@gmail.com>" "Vadim Petrochenkov <>" ];
    sha256 = "1jj2nrg8h3l53d43rwkpkikq5a5x15ms4rf1rw92hp5lrqhi8mpi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."vec_map"."0.8.1" or {});
  };
  features_.vec_map."0.8.1" = deps: f: updateFeatures f (rec {
    vec_map = fold recursiveUpdate {} [
      { "0.8.1"."serde" =
        (f.vec_map."0.8.1"."serde" or false) ||
        (f.vec_map."0.8.1".eders or false) ||
        (vec_map."0.8.1"."eders" or false); }
      { "0.8.1".default = (f.vec_map."0.8.1".default or true); }
    ];
  }) [];


# end
# walkdir-2.2.7

  crates.walkdir."2.2.7" = deps: { features?(features_.walkdir."2.2.7" deps {}) }: buildRustCrate {
    crateName = "walkdir";
    version = "2.2.7";
    description = "Recursively walk a directory.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0wq3v28916kkla29yyi0g0xfc16apwx24py68049kriz3gjlig03";
    dependencies = mapFeatures features ([
      (crates."same_file"."${deps."walkdir"."2.2.7"."same_file"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."walkdir"."2.2.7"."winapi"}" deps)
      (crates."winapi_util"."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
    ]) else []);
  };
  features_.walkdir."2.2.7" = deps: f: updateFeatures f (rec {
    same_file."${deps.walkdir."2.2.7".same_file}".default = true;
    walkdir."2.2.7".default = (f.walkdir."2.2.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.walkdir."2.2.7".winapi}"."std" = true; }
      { "${deps.walkdir."2.2.7".winapi}"."winnt" = true; }
      { "${deps.walkdir."2.2.7".winapi}".default = true; }
    ];
    winapi_util."${deps.walkdir."2.2.7".winapi_util}".default = true;
  }) [
    (features_.same_file."${deps."walkdir"."2.2.7"."same_file"}" deps)
    (features_.winapi."${deps."walkdir"."2.2.7"."winapi"}" deps)
    (features_.winapi_util."${deps."walkdir"."2.2.7"."winapi_util"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.8

  crates.winapi."0.3.8" = deps: { features?(features_.winapi."0.3.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.8";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "084ialbgww1vxry341fmkg5crgpvab3w52ahx1wa54yqjgym0vxs";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.8"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.8"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.8" or {});
  };
  features_.winapi."0.3.8" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.8"."impl-debug" =
        (f.winapi."0.3.8"."impl-debug" or false) ||
        (f.winapi."0.3.8".debug or false) ||
        (winapi."0.3.8"."debug" or false); }
      { "0.3.8".default = (f.winapi."0.3.8".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.8".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.8".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.8"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.8"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    description = "A dumping ground for high level safe wrappers over winapi.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# ws2_32-sys-0.2.1

  crates.ws2_32_sys."0.2.1" = deps: { features?(features_.ws2_32_sys."0.2.1" deps {}) }: buildRustCrate {
    crateName = "ws2_32-sys";
    version = "0.2.1";
    description = "Contains function definitions for the Windows API library ws2_32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1zpy9d9wk11sj17fczfngcj28w4xxjs3b4n036yzpy38dxp4f7kc";
    libName = "ws2_32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
    ]);
  };
  features_.ws2_32_sys."0.2.1" = deps: f: updateFeatures f (rec {
    winapi."${deps.ws2_32_sys."0.2.1".winapi}".default = true;
    winapi_build."${deps.ws2_32_sys."0.2.1".winapi_build}".default = true;
    ws2_32_sys."0.2.1".default = (f.ws2_32_sys."0.2.1".default or true);
  }) [
    (features_.winapi."${deps."ws2_32_sys"."0.2.1"."winapi"}" deps)
    (features_.winapi_build."${deps."ws2_32_sys"."0.2.1"."winapi_build"}" deps)
  ];


# end
}
