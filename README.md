# is-merge-commit

The following action determines if a commit is a merge commit by inspecting the commits parent. If there is more than one commit then it returns true, otherwise false.

Only parameter needed is the SHA of the commit. This action is heavily reliant on the `actions/checkout@v3` and the fetch-depth is a required field. If using the current commit the fetch-depth property should be at least set to 2. Otherwise it is recommended to fetch entire git history with `fetch-depth: 0`. Following is the example of the use of action.

```
on: [push]

jobs:
  check_if_merge_commit_test:
    runs-on: ubuntu-latest
    name: Test merge commit
    steps:
      - uses: actions/checkout@v3
        with:
	  # If not using current commit sha, set to 0
          fetch-depth: 2
      - id: test
        uses: mmatotan/is-merge-commit@v0.5
        with:
	  # Using current commit sha, but you can use any
          github-sha: $GITHUB_SHA
      # Use the steps.test.outputs.is-merge-commit to determine true/false
      - run: echo ${{ steps.test.outputs.is-merge-commit }}
```
