staload "libats/ML/SATS/basis.sats"
staload "SATS/zipper.sats"

implement go_left (z) =
  let
    val (t, p) = z
  in
    case- p of
      | ~node (~list0_vt_cons (l, left), up, right) => (l, node(left, up, list0_vt_cons(t, right)))
  end
