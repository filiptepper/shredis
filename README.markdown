Shredis
=======

Shredis is a simple show-me-what-you-got-Redis application written using Sinatra, aiming to become a Ruby equivalent of phpMyAdmin for Redis.

Tested with Ruby 1.9.1p378 (2010-01-10 revision 26273).

Usage
-----

    git clone git://github.com/filiptepper/shredis.git
    cd shredis
    gem install bundler
    bundle install
    cp redis.yml.example redis.yml

Edit `redis.yml`.

    rackup

Browse to `http://localhost:9292/`.

Contributing
------------

Contributions are welcome!

To contribute:

* fork,
* spec,
* code,
* request pull.

**Important!**

Shredis tests use [FLUSHALL](http://code.google.com/p/redis/wiki/FlushallCommand) - you might want to use a separate Redis instance for testing.

Issues
------

Please report all issues via GitHub's issue tracker at [http://github.com/filiptepper/shredis/issues](http://github.com/filiptepper/shredis/issues).

What needs to be done
---------------------

Shredis is a work in constant progress.

Coming up:

* better configuration,
* search,
* paging.