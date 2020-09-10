# homebrew-datadog-agent-macos-build

Homebrew tap to store pinned versions of software needed for the MacOS Agent build.

## How to add a new version of software

From a MacOS host, run:
```
brew extract <formula> DataDog/datadog-agent-macos-build --version <version>
```

This will clone this repository in `/usr/local/Homebrew/Library/Taps`, and create a new `Formula/<formula>@<version>.rb` formula with the extracted formula from `homebrew-core`.

Then, commit the changes and create a PR with them.
