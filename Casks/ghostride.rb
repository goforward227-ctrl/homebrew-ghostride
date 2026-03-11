cask "ghostride" do
  version "1.0.0"
  sha256 "2e98890fda672f70d1b120fc1d7f1cdf3560e671124bda002355f555d3daf4ce"

  url "https://github.com/goforward227-ctrl/ghostride/releases/download/v#{version}/Ghostride-#{version}-arm64.zip"
  name "Ghostride"
  desc "Menu bar app for monitoring and approving Claude Code sessions"
  homepage "https://github.com/goforward227-ctrl/ghostride"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Ghostride.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ghostride.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ghostride",
    "~/Library/Preferences/com.ghostride.app.plist",
  ]
end
