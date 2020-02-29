staload "SATS/binary-tree-zipper.sats"
staload "SATS/zipper.sats"

#include "DATS/zipper.dats"

extern
castfn space_leak {a:vt@ype} (loc(a)) : void

// TODO: print tree and all that stuff
implement main0 () =
  {
    val x0 = let
      val l_ctx = list0_vt_cons(item("c"), list0_vt_nil)
      val r_ctx = list0_vt_cons(item("d"), list0_vt_nil)
      val middle_ctx = list0_vt_cons( item("+")
                                    , list0_vt_cons(section(list0_vt_cons( item("a")
                                                                         , list0_vt_cons( item("*")
                                                                                        , list0_vt_cons( item("b")
                                                                                                       , list0_vt_nil
                                                                                                       )
                                                                                        )
                                                                         )), list0_vt_nil)
                                    )
    in
      (item("*"), node(l_ctx, node(middle_ctx, top, list0_vt_nil), r_ctx))
    end
    val x1 = go_left(x0)
    val () = space_leak(x1)
  }
