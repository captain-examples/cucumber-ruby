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

2. 🔐 Create an API token

Create an API token for your organization within [captain][captain], ([more documentation here][create-api-token]).
The token needs write access.

Add the new token as an action secret to your repository. Conventionally, we call this secret `RWX_API_TOKEN`.

3. 💌 Add a step to upload to captain

```yaml
- name: Upload test results to Captain # optional, shows in github action results
  uses: rwx-research/upload-captain-artifact@v1
  if: always() # run even if build fails
  continue-on-error: true # if upload to captain fails, don't fail the build
  with:
    artifacts: |
      [
        {
          "name": "Cucumber",
          "path": "tmp/cucumber.json",
          "kind": "test_results",
          "parser": "cucumber_json"
        }
      ]
    rwx-token: '${{ secrets.RWX_API_TOKEN }}'
```

4. 🎉 See your test results in Captain!

Take a look at the [final workflow!][workflow-with-captain]

For more information on the github action, see [its readme][action-readme].

[workflow-before-captain]: https://github.com/captain-examples/cucumber-ruby/blob/basic-workflow/.github/workflows/ci.yml
[captain]: https://captain.build/_/organizations
[create-api-token]: https://www.rwx.com/captain/docs/api-tokens#generating-an-api-token
[workflow-with-captain]: https://github.com/captain-examples/cucumber-ruby/blob/main/.github/workflows/ci.yml
[action-readme]: https://github.com/rwx-research/upload-captain-artifact/#readme
