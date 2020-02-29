staload "SATS/binary-tree-zipper.sats"

implement btr_free (x) =
  case+ x of
    | ~nil() => ()
    | ~cons (x0, x1) => (btr_free(x0) ; btr_free(x1))

implement go_left (z) =
  let
    val (t, p) = z
  in
    case- p of
      | ~top() => let
        val () = btr_free(t)
      in
        None_vt
      end
  end
