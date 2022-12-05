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
