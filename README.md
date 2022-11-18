# README

Simple application preview of the first 2 steps of the schedule widget.

* Ruby version 2.7.2
* Rails version 7.0.4

Contains:

    - router
    - one controller
    - views
    - specs
    
    - no Database
    - no service objects
    - no jobs queues, cache servers, search engines, etc.
    - no http errors interсeption(since there was no such task)

Install:
    
    bundle
    rails db:create:all

Run:
    
    this will compile also tailwind css
    ./bin/dev

    or

    rails s

Server available on http://localhost:3000/

Run tests:
    
    rspec

* CSS Framework: https://tailwindcss.com/
* Spec http requests mocked by VCR gem