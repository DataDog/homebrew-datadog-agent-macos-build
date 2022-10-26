# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https://www.datadoghq.com/)
# Copyright 2022-present Datadog, Inc.

class GimmeAT154 < Formula
  desc "Shell script to install any Go version"
  homepage "https://github.com/travis-ci/gimme"
  url "https://github.com/travis-ci/gimme/archive/v1.5.4.tar.gz"
  sha256 "71036f892b3cae08f29be6fd4c69fb20d9b003ec80a24221d73e995e12ab0fe0"
  license "MIT"

  def install
    bin.install "gimme"
  end

  test do
    system "#{bin}/gimme", "-l"
  end
end
