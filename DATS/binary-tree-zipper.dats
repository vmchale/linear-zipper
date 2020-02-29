staload "SATS/binary-tree-zipper.sats"

implement btr_free (x) =
  case+ x of
    | ~Nil() => ()
    | ~Cons (x0, x1) => (btr_free(x0) ; btr_free(x1))

implement go_left (z) =
  let
    val (t, p) = z
  in
    case+ p of
      | ~Top() => let
        val () = btr_free(t)
      in
        None_vt
      end
      | ~Left (father, right) => let
        val () = bpath_free(father)
        val () = btr_free(right)
        val () = btr_free(t)
      in
        None_vt
      end
      | ~Right (left, father) => Some_vt((left, Left(father, t)))
  end

implement go_right (z) =
  let
    val (t, p) = z
  in
    case+ p of
      | ~Top() => let
        val () = btr_free(t)
      in
        None_vt
      end
      | ~Left (father, right) => Some_vt((right, Right(t, father)))
      | ~Right (left, father) => let
        val () = btr_free(t)
        val () = btr_free(left)
        val () = bpath_free(father)
      in
        None_vt
      end
  end

implement go_up (z) =
  let
    val (t, p) = z
  in
    case+ p of
      | ~Top() => let
        val () = btr_free(t)
      in
        None_vt
      end
      | ~Left (father, right) => Some_vt((Cons(t, right), father))
      | ~Right (left, father) => Some_vt((Cons(left, t), father))
  end

implement go_first (z) =
  let
    val (t, p) = z
  in
    case+ t of
      | ~Nil() => let
        val () = bpath_free(p)
      in
        None_vt
      end
      | ~Cons (left, right) => Some_vt((right, Right(left, p)))
  end
