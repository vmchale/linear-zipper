staload "libats/ML/SATS/basis.sats"

datavtype tree(a: vt@ype+) =
  | item of a
  | section of list0_vt(tree(a))

datavtype path(a: vt@ype) =
  | top
  | node of (list0_vt(tree(a)), path(a), list0_vt(tree(a)))

vtypedef loc(a: vt@ype) = (tree(a), path(a))

fn go_left {a:vt@ype} (loc(a)) : loc(a)

fn go_right {a:vt@ype} (loc(a)) : loc(a)

fn {a:vt@ype} go_up (loc(a)) : loc(a)

fn go_down {a:vt@ype} (loc(a)) : loc(a)

fn {a:vt@ype+} tree_free (tree(a)) : void

overload free with tree_free

fn {a:vt@ype} change (loc(a), tree(a)) : loc(a)

fn insert_right {a:vt@ype} (loc(a), tree(a)) : loc(a)

fn insert_left {a:vt@ype} (loc(a), tree(a)) : loc(a)

fn insert_down {a:vt@ype} (loc(a), tree(a)) : loc(a)

fn {a:vt@ype} delete (loc(a)) : loc(a)
