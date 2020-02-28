let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "src/linear-zipper.dats"
      , target = "${prelude.atsProject}/lz-tests"
      , gcBin = False
      }
    ]
      , compiler = [ 0, 4, 0 ]
      , version = [ 0, 3, 13 ]
      , atsLib = False
  }
