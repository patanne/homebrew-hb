#!/usr/bin/ruby

# original script file


class HbBashProfile < Formula
	desc "A realtime, distributed, fault-tolerant stream processing engine from Twitter"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/homebrew/packages/hb-bash-profile.tar.gz"
	sha256 "c0bb5c31cac2631fc73999e68d705731068600ecabab91bfd89695fd6baeaba2"
	version "0.0.0"
	revision 2

	bottle :unneeded


	def install
		libexec.install Dir["*"]
		bin.write_exec_script Dir["#{libexec}/bin/hb-bash-profile"]
#		(prefix/"homebrew.mxcl.heron-ui.plist").write heron_ui_plist
#		(prefix/"homebrew.mxcl.heron-ui.plist").chmod 0644
	end

	def caveats; <<~EOS
		To create bash profilex
			brew services start hb-bash-profile
		EOS
	end

	def plist; <<-EOS
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
		<plist version="1.0">
			<dict>
				<key>KeepAlive</key>
				<false/>
				<key>Label</key>
				<string>#{plist_name}</string>
				<key>ProgramArguments</key>
				<array>
					<string>#{opt_bin}/heron-tracker</string>
				</array>
				<key>RunAtLoad</key>
				<true/>
				<key>WorkingDirectory</key>
				<string>#{var}</string>
				<key>StandardErrorPath</key>
				<string>#{var}/log/hb-bash-profile.log</string>
				<key>StandardOutPath</key>
				<string>#{var}/log/hb-bash-profile.log</string>
			</dict>
		</plist>
		EOS
	end
end