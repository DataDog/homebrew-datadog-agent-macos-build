# homebrew-datadog-agent-macos-build

Homebrew tap to store pinned versions of software needed for the MacOS Agent build.

## How to add a new version of software

From a MacOS host, run:
```
brew extract <formula> DataDog/datadog-agent-macos-build --version <version>
```

This will clone this repository in `/usr/local/Homebrew/Library/Taps`, and create a new `Formula/<formula>@<version>.rb` formula with the extracted formula from `homebrew-core`.

Then, commit the changes and create a PR with them.

**Note:** Before merging the change, check if the new formula you added has dependencies on other formulae we have in this tap. In that case, make sure it uses the version in this tap. For instance, if a formula depends on `pkg-config`, change `depends_on "pkg-config"` into `depends_on "pkg-config@0.29.2"`.
