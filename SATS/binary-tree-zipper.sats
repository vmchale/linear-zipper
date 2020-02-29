datavtype binary_tree =
  | Nil
  | Cons of (binary_tree, binary_tree)

datavtype binary_path =
  | Top
  | Left of (binary_path, binary_tree)
  | Right of (binary_tree, binary_path)

vtypedef binary_loc = (binary_tree, binary_path)

fn btr_free(binary_tree) : void

fn bpath_free(binary_path) : void

overload free with btr_free
overload free with bpath_free

fn change(binary_loc, binary_tree) : binary_loc

fn go_left(binary_loc) : Option_vt(binary_loc)

fn go_right(binary_loc) : Option_vt(binary_loc)

fn go_up(binary_loc) : Option_vt(binary_loc)

fn go_first(binary_loc) : Option_vt(binary_loc)

fn go_second(binary_loc) : Option_vt(binary_loc)
