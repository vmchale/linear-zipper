datavtype tree(a:vt@ype+) =
    | item of a
    | section of List_vt(a)

datavtype path(a:vt@ype) =
    | top
    | node of (List_vt(tree(a)), path(a), List_vt(tree(a)))

vtypedef loc(a:vt@ype) = (tree(a), path(a))
