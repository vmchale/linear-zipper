staload "libats/ML/SATS/basis.sats"

datavtype tree(a: vt@ype+) =
  | item of a
  | section of list0_vt(a)

datavtype path(a: vt@ype) =
  | top
  | node of (list0_vt(tree(a)), path(a), list0_vt(tree(a)))

vtypedef loc(a: vt@ype) = (tree(a), path(a))

fn go_left {a:vt@ype} (loc(a)) : loc(a)
