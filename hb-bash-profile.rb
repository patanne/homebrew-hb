#!/usr/bin/ruby

# original script file


class HbBashProfile < Formula
	desc "A realtime, distributed, fault-tolerant stream processing engine from Twitter"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/homebrew/packages/hb-bash-profile.tar.gz"
	sha256 "951abe04f18f7a02d8fef1c1f733d83c6a2ec1e12bf548d0eadd7da4ddbb86d2"
	version "0.0.1"
	revision 2

	bottle :unneeded

	def hbLogFolder
		var/"log/hb"
	end
		
	def install
		libexec.install Dir["*"]
		bin.write_exec_script Dir["#{libexec}/hb-bash-profile-la"]

		if not hbLogFolder.exist?
			system "mkdir", "-p", "#{var}/log/hb"
			system "chmod", "-R", "777", "#{var}/log/hb"
		end 
#		(prefix/"homebrew.mxcl.heron-ui.plist").write heron_ui_plist
#		(prefix/"hb-bash-profile").chmod 0644
	end

	def caveats; <<~EOS
		To create bash profile
			brew services start hb-bash-profile
			
		To create bash profile for all users
			sudo brew services --lla start hb-bash-profile
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
					<string>#{libexec}/hb-bash-profile-la</string>
				</array>
				<key>RunAtLoad</key>
				<true/>
				<key>WorkingDirectory</key>
				<string>#{var}</string>
				<key>StandardErrorPath</key>
				<string>#{var}/log/hb/hb-bash-profile.log</string>
				<key>StandardOutPath</key>
				<string>#{var}/log/hb/hb-bash-profile.log</string>
			</dict>
		</plist>
		EOS
	end
end