connection: "internal"
include: "//looker_fruit_basket/*.explore.lkml"

test: check_fruit {
  explore_source: fruit_ext {
    column: name {
      field: fruit.name
    }
    limit: 1
  }
  assert: the_first_fruit_is_an_orange {
    expression: ${fruit.name} = "orange" ;;
  }
}

explore: fruit_ext {
  label: "Fruit"
  group_label: "Spoke"
  extends: [fruit]
  hidden: no
}
