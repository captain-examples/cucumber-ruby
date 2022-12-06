@feature_tag
Feature: Rule Sample

  @rule_tag
  Rule: This is a rule

    Example: A passing example
      Given this will pass
      When I do an action
      Then some results should be there

    @failing
    Example: A failing example
      Given this will fail
      When I do an action
      Then some results should be there

    Example: A pending example
      Given this is pending
      When I do an action
      Then nothing should happen

    Example: A skipped example
      Given this is skipped
      When I do an action
      Then nothing should happen

    Example: An undefined example
      Given this is undefined
      When I do an action
      Then nothing should happen
