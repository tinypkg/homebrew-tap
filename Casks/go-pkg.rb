# typed: false
# frozen_string_literal: true

cask "go-pkg" do
  arch arm: "arm64", intel: "amd64"

  version "1.26.1"
  sha256 arm:   "04095714d4956c93cbfc481a9a0c931c42edc8805a9f8952179aa171e487295e",
         intel: "5142ad2340eb66868ac62d016d7d05addb0faefee6306023db98ebf5c7235466"

  # Official download URL from go.dev
  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  name "Go"
  desc "Go programming language (official pkg installer)"
  homepage "https://go.dev/"

  # Automatically check for new stable releases from official API
  livecheck do
    url "https://go.dev/dl/?mode=json"
    strategy :json do |json|
      json.filter_map do |release|
        next unless release["stable"] == true

        release["version"]&.delete_prefix("go")
      end
    end
  end

  pkg "go#{version}.darwin-#{arch}.pkg"

  # Post-installation: create symlinks in Homebrew's bin directory
  postflight do
    # Get all Go binaries (go, gofmt, etc.)
    go_bin_dir = "/usr/local/go/bin"
    next unless Dir.exist?(go_bin_dir)

    Dir.children(go_bin_dir).each do |binary|
      source = "#{go_bin_dir}/#{binary}"
      target = "#{HOMEBREW_PREFIX}/bin/#{binary}"

      # Create symbolic link for each binary
      system_command "/bin/ln",
                     args: ["-sf", source, target],
                     sudo: false
    end
  end

  # Pre-uninstall: clean up symbolic links before removing Go
  uninstall_preflight do
    go_bin_dir = "/usr/local/go/bin"
    next unless Dir.exist?(go_bin_dir)

    Dir.children(go_bin_dir).each do |binary|
      target = "#{HOMEBREW_PREFIX}/bin/#{binary}"
      # Only remove if it's a symlink pointing to Go installation
      if File.symlink?(target) && File.readlink(target).start_with?("/usr/local/go/")
        File.unlink(target)
      end
    end
  end

  uninstall pkgutil: "com.googlecode.go"

  caveats <<~EOS
    Go has been installed via the official macOS pkg installer.

    Installation details:
      - Go root: /usr/local/go
      - Binaries: #{HOMEBREW_PREFIX}/bin/go, gofmt
      - Documentation: /usr/local/go/doc

    Symbolic links have been created automatically.
    Open a new terminal to start using Go.
  EOS
end
