# Getting Captain working with Cucumber

Starting from a [simple workflow that runs cucumber][workflow-before-captain], we want to

1. 🧪 Ensure cucumber produces json output

`cucumber --format json --out tmp/cucumber.json` will produce captain-compatible json output in `tmp/cucumber.json`.
For github logs to continue to have test output, also include a stdout-friendly formatter (`--format progess` for dots
`--format pretty` for full test names)

```sh
bundle exec cucumber \
  --format json --out tmp/cucumber.json \
  --format pretty
```

2. 🔐 Create an Access Token

Create an Access Token for your organization within [Captain][captain] ([more documentation here][create-access-token]).

Add the new token as an action secret to your repository. Conventionally, we call this secret `RWX_ACCESS_TOKEN`.

3. 💌 Install the Captain CLI, and then call it when running tests

See the [full documentation on test suite integration][test-suite-integration].

```yaml
- uses: rwx-research/setup-captain@v1
- run: |
    captain run \
      --suite-id captain-examples-cucumber \
      --test-results tmp/cucumber.json \
      -- \
      bundle exec cucumber \
        --format json --out tmp/cucumber.json \
        --format pretty
  env:
    RWX_ACCESS_TOKEN: ${{ secrets.RWX_ACCESS_TOKEN }}
```

4. 🎉 See your test results in Captain!

Take a look at the [final workflow!][workflow-with-captain]

[workflow-before-captain]: https://github.com/captain-examples/cucumber-ruby/blob/basic-workflow/.github/workflows/ci.yml
[captain]: https://captain.build/_/organizations
[create-access-token]: https://www.rwx.com/docs/access-tokens
[workflow-with-captain]: https://github.com/captain-examples/cucumber-ruby/blob/main/.github/workflows/ci.yml
[test-suite-integration]: https://www.rwx.com/captain/docs/test-suite-integration
