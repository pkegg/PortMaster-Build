# Summary
This is a re-implementation of portmaster scripts using `global-functions` to simplify scripting.  It is capable of being run under: Ubuntu Linux and MacOS in addition to device specific code (useful for testing).

## Testing
PortMaster aims to be easy to test.  As it doesn't **require** much beyond `dialog`/`wget`/`curl`, it's easy to run on any platform to verify functionality.

Just run: `bash ./ports/portmaster/PortMaster.sh` and `apt` or `brew` will be used to install dependencies on linux (or mac).  It should also work in WSL with Ubuntu 20.04.

NOTE: Currently running does not work in a chroot due to redirection to `/dev/stdout` not working.
