datavtype binary_tree =
  | nil
  | cons of (binary_tree, binary_tree)

datavtype binary_path =
  | top
  | left of (binary_path, binary_tree)
  | right of (binary_tree, binary_path)

vtypedef binary_loc = (binary_tree, binary_path)

fn btr_free(binary_tree) : void

fn change(binary_loc, binary_tree) : binary_loc

fn go_left(binary_loc) : Option_vt(binary_loc)
