# Ruby-CLI-Logger

The idea is that this will be a super simple command line utility for logging short bits of text.

Ideally, there will also eventually be a way to push notes from rcl into Evernote, Simplenote or email.

# Requirements

* chronic
* sequel
* rspec (to run the tests)

# Usage

One can log something, like so:

     $ rcl log "Don't forget this."

or by piping input in:

     $ echo "And another thing" | rcl

You can also get your log entries back:

     $ rcl -d

or pull back entries from a particular day:

     $ rcl --on "yesterday"
     $ rcl --on "2/4/2012"