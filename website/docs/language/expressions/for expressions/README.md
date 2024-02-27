# Prerequisites
* [Install terraform](https://developer.hashicorp.com/terraform/install)

# for
* `resultTypeStart for temporarySymbol in inputType : expression resultTypeEnd`
  * allows
    * complex type value → another complex type value or nothing -- 'value_of_upper_elements' & 'value_of_filter_list' --
      * since unordered types `set`, `map` or `object` — can be converted to → ordered types `list` or `tuple` → Terraform apply an ordering
        * `map` or `object` — via key / attribute name by lexical sorting → `list` or `tuple`
        * `set(string)` — via value by lexical sorting → `list` or `tuple`
        * `set(!=string)` — via arbitrary ordering → `list` or `tuple`
  * resultType == `resultTypeStart` or `resultTypeEnd`
    * available ones
      * `[]` -- produces -> tuple / list
      * if you want to produce a set → `toset`
      * `{}` -- produces -> map / object     -- 'value_of_list_to_map' --
  * `inputType`
    * available ones
      * list / tuple  -- 'value_of_upper_elements' --
      * set  -- 'value_for_set' --
      * map / object  -- 'value_for_map' --
  * `temporarySymbol`
    * depends on `inputType`
      * if set → 1! is possible   -- 'temporary_symbol_set' --
        * Note: 👁️although you can add 2 temporary symbols, just access to the item, not index 👁️
      * if list/tuple  or  map/object
        * if you add 1 — represent →  inputType’s value  -- 'temporary_symbol_list_1' & 'temporary_symbol_map_1' --
        * if you add 2 — represent → inputType’s index, inputType’s value  -- 'temporary_symbol_list_2' & 'temporary_symbol_map_2' --
  * `expression`
    * `if` is allowed → filter / reduce output elements
      * uses
        * 1 collection → 2 collections  -- 'users', 'admin_users' & 'regular_users' --
  * `…`
    * grouping model   -- 'users_by_role' --
      * Optional to use it in the for expression  -- Check all previous examples --
    * requirements
      * resultType is `{}` for an object
    * allows
      * several output object’s entries / same key    -- 'users_to_group' --
        * ordering is also applied to the output elements
        * if you do NOT use grouping model → terraform would return an error
* `terraform plan` & check in the output that it makes sense

# How to run locally?
* `terraform init`
