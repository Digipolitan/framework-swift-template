DGFrameworkTemplate
=================================

[![Swift Version](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Build Status](https://travis-ci.org/Digipolitan/framework-swift-template.svg?branch=master)](https://travis-ci.org/Digipolitan/framework-swift-template)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DGFrameworkTemplate.svg)](https://img.shields.io/cocoapods/v/DGFrameworkTemplate.svg)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager Compatible](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/cocoapods/p/DGFrameworkTemplate.svg?style=flat)](http://cocoadocs.org/docsets/DGFrameworkTemplate)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

## Installation

### Using digipolitan-framework-swift-template-cli

```Shell
gem install digipolitan-framework-swift-template-cli
```

And then execute the follow command

```Shell
dg-fst --init
```

Check all available options [here](https://github.com/Digipolitan/framework-swift-template-cli)

### Manually

First download the zip file and install bundler

```Shell
[sudo] gem install bundler
bundle install
```

Then execute the **install.rb** and follow the instructions

```Shell
bundle exec ruby install.rb
```

## Features

* Xcode setup and ready to deploy Swift Framework
* [Travis](https://travis-ci.org) : Travis CI is configure into [.travis.yml](.travis.yml) and ready to execute [Digipolitan CI lanes](https://github.com/Digipolitan/fastlane-ios-ci-framework)
* [Fastlane](https://fastlane.tools/) : The [Fastfile](fastlane/Fastfile) is configure to download [Digipolitan CI lanes](https://github.com/Digipolitan/fastlane-ios-ci-framework)
* [Swift Package Manager](https://github.com/apple/swift-package-manager) : The [Package.swift](Package.swift) created without dependencies
* [CocoaPods](https://cocoapods.org/) : The [Podfile](Podfile) and the [Podspec](DGFrameworkTemplate.podspec) are created without dependencies
* [SwifLint](https://github.com/realm/SwiftLint) : The [.swiftlint.yml](.swiftlint.yml) is created and a run script is added to **Xcode Build Phases** to run for each build
* [RubyGems](https://rubygems.org/) : The [Gemfile](Gemfile) contains ruby dependencies such as Fastlane, run `bundle install` to install these dependencies into your machine
* [Homebrew](http://brew.sh/index_fr.html) : The [Brewfile](Brewfile) contains non-ruby dependencies such as git-flow, run `brew bundle` to install these dependencies into your machine

## How to deploy ?

First install deployment dependencies
```Shell
bundle install && brew bundle
```

Run the following lane to start a new release version on git :
```Shell
fastlane start_framework_release
```
This lane is a part of [Digipolitan lanes](https://github.com/Digipolitan/fastlane-ios-framework)

Check if everything is OK, after that publish the new release version on git
```Shell
fastlane publish_framework_release
```
This lane is a part of [Digipolitan lanes](https://github.com/Digipolitan/fastlane-ios-framework)

After that 2 options are available :
- If you keep Travis CI : Travis will run tests and will deploy CocoaPods and GitHub release
- Otherwise you must run lanes yourself `framework_deploy_cocoapods` and `framework_deploy_github` part of [Digipolitan lanes](https://github.com/Digipolitan/fastlane-ios-framework)


## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

DGFrameworkTemplate is licensed under the [BSD 3-Clause license](LICENSE).
