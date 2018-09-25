class HbPythonBootstrapDir < Formula
	desc "hb-python-bootstrap, the directory version"
	homepage "https://github.com/"
	url "http://san.customer.hb/repos.hb/macos/hb-python-bootstrap-dir.tar.gz"
	sha256 "e4e09b8ebaaeacd323e888a6799ef084c01fafe4f903c55dc8a3f45093850ebc"
	version "0.0.1"
	revision 6
  
	depends_on "curl"
	depends_on "python37"

	bottle :unneeded

	def sitepackages34
		prefix/"lib/python3.4/site-packages"
	end

	def sitepackages34live
		HOMEBREW_PREFIX/"lib/python3.4/site-packages"
	end

	def sitepackages36
		prefix/"lib/python3.6/site-packages"
	end

	def sitepackages36live
		HOMEBREW_PREFIX/"lib/python3.6/site-packages"
	end

	def sitepackages37
		prefix/"lib/python3.7/site-packages"
	end

	def sitepackages37live
		HOMEBREW_PREFIX/"lib/python3.7/site-packages"
	end

	def install
		lib.install "hb-python-bootstrap"
		libexec.install "sitecustomize.py"

#		puts sitepackages36

		if sitepackages34live.exist?
			sitepackages34.install_symlink libexec/"sitecustomize.py"
		end

		if sitepackages36live.exist?
			sitepackages36.install_symlink libexec/"sitecustomize.py" => "sitecustomize.py"
		end

		if sitepackages37live.exist?
			# this line fails with...
			# Errno::EPERM: Operation not permitted @ rb_file_s_rename - (/usr/local/lib/python3.7/site-packages/sitecustomize.py, /usr/local/lib/python3.7/site-packages/sitecustomize.brew.py)
#			mv sitepackages37live/"sitecustomize.py", sitepackages37live/"sitecustomize.brew.py" if File.exist?(sitepackages37live/"sitecustomize.py")
#			system "mv", "#{sitepackages37live}/sitecustomize.py", "#{sitepackages37live}/sitecustomize.brew.py" if File.exist?(sitepackages37live/"sitecustomize.py")
#			system "whoami"
			sitepackages37.install_symlink libexec/"sitecustomize.py" => "sitecustomize.py"
		end
	end
  end
  