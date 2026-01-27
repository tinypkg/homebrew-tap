# typed: false
# frozen_string_literal: true

cask "go-pkg" do
  arch arm: "arm64", intel: "amd64"

  version "1.24.3"
  sha256 arm:   "4f6e7e49c9759c9d5d0bae3c0ed80c6c957de28c92d20f3a6cd8afc654bb57e1",
         intel: "89f836561f4c6362d5291807a33e6f75fc1d71bd1c5f3fcf68e22e3aef36d98e"

  # Official download URL from go.dev
  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  name "Go"
  desc "Go programming language (official pkg installer)"
  homepage "https://go.dev/"

  # Conflict with Homebrew's official go formula
  conflicts_with formula: "go"

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
