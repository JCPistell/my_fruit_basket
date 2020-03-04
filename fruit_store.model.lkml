connection: "internal"
include: "//looker_fruit_basket/*.explore.lkml"

# This test failed on 02/21/2020 17:03:15!
# This test failed on 02/21/2020 17:04:03!
test: check_fruit {
  explore_source: performance {
    column: name {
      field: fruit.name
    }
    limit: 1
  }
  assert: the_first_fruit_is_an_orange {
    expression: ${fruit.name} = "apple" ;;
  }
}

explore: fruit_ext {
  label: "Fruit"
  group_label: "Spoke"
  extends: [fruit]
  hidden: no
}
