cask "nudge" do
  version "1.0.2"
  sha256 "b6fb924ce20d271c781e2a70a71a601fd3375caeae27ec9a0bde84ed007be9ec"

  url "https://github.com/SagenKoder/nudge/releases/download/v#{version}/Nudge-#{version}.dmg"
  name "Nudge"
  desc "Window snapper with five shortcuts and no menu bar icon"
  homepage "https://github.com/SagenKoder/nudge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Nudge.app"

  # No login_item here: `brew upgrade` runs this too, and Nudge should keep starting at login.
  uninstall quit: "com.sagenkoder.nudge"

  zap login_item: "Nudge",
      trash:      "~/Library/Preferences/com.sagenkoder.nudge.plist"

  caveats <<~EOS
    Open Nudge once to grant the Accessibility permission it needs to move windows.
    It then starts at login by itself.
  EOS
end
