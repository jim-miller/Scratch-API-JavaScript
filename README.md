#Scratch JavaScript Libraries
Documentation can be found on the [Scratch Website](http://api.paywithscratch.com/docs)

## Development and Testing Prerequisites
If you would like to run the [Jasmine](http://jasmine.github.io/) specs, you will need the following
tools and libraries installed:

### Ruby
Although not strictly required, the automated testing and Guard components for automatic
test execution and CI are monitored and launched using [Ruby 1.9](https://www.ruby-lang.org/en/)
or higher.

### PhantomJS
Per the [guard-jasmine](https://github.com/guard/guard-jasmine) README.md:

You need the PhantomJS browser installed on your system. You can download binaries for Mac OS X and Windows from
[the PhantomJS download section][].

Alternatively you can install [Homebrew][] on Mac OS X and install it with:

```bash
$ brew install phantomjs
```

If you are using Ubuntu 12.04 or above, phantomjs is in the official repositories and can be installed with apt:

```bash
$ sudo apt-get install phantomjs
```

For older versions of Ubuntu, you will need to add a repository first:

```bash
$ sudo add-apt-repository ppa:jerome-etienne/neoip
$ sudo apt-get update
$ sudo apt-get install phantomjs
```

You can also build it from source for several other operating systems, please consult the
[PhantomJS build instructions][].

## Installation
Install all Ruby gem dependencies:

```bash
$ bundle install
```

## Automatic Test Execution and Environment Monitoring
The Scratch JavaScript API project uses [Guard](https://github.com/guard) to
continually monitor changes in source, spec files, and development files.

Simply start Guard to automatically run tests and monitor for changes:

```bash
$ bundle exec guard
```

## Running the Tests Manually
Tests can be run through the local Jasmine web server via:

```bash
$ bundle exec rake jasmine
```

or in a one-time fashion for CI environments:

```bash
$ bundle exec rake jasmine:ci
```
