staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0_vt.sats"
staload "SATS/zipper.sats"

implement go_left (z) =
  let
    val (t, p) = z
  in
    case- p of
      | ~node (~list0_vt_cons (l, left), up, right) => (l, node(left, up, list0_vt_cons(t, right)))
  end

implement go_right (z) =
  let
    val (t, p) = z
  in
    case- p of
      | ~node (left, up, ~list0_vt_cons (r, right)) => (r, node(list0_vt_cons(t, left), up, right))
  end

implement {a} go_up (z) =
  let
    val (t, p) = z
  in
    case- p of
      | ~node (left, up, right) => (section(list0_vt_append<tree(a)>( list0_vt_reverse<tree(a)>(left)
                                                                    , list0_vt_cons(t, right)
                                                                    )), up)
  end

implement go_down (z) =
  let
    val (t, p) = z
  in
    case- t of
      | ~section (~list0_vt_cons (t1, trees)) => (t1, node(list0_vt_nil, p, trees))
  end
