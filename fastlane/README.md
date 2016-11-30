fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
### tests
```
fastlane tests
```
Build and run all tests for the given environment

####Example:

```
fastlane tests workspace:NAME.xcworkspace
```

####Options

 * **workspace**: The workspace to use.

  * **environment_variable**: DG_WORKSPACE

  * **type**: string

  * **optional**: true

 * **project**: The project to use.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **scheme**: The scheme into the workspace to execute.

  * **environment_variable**: DG_SCHEME

  * **type**: string

  * **optional**: true

* **skip_slack**: Skip slack notification even if a SLACK_URL is define.

  * **type**: boolean

  * **optional**: true

  * **default_value**: false

* **clean**: Clean the project before building.

  * **type**: boolean

  * **optional**: true

  * **default_value**: false


### coverage
```
fastlane coverage
```
Calculate the codecoverage score for your tests

####Example:

```
fastlane coverage workspace:NAME.xcworkspace
```

####Options

 * **workspace**: The workspace to use.

  * **environment_variable**: DG_WORKSPACE

  * **type**: string

  * **optional**: true

 * **project**: The project to use.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **scheme**: The scheme into the workspace to execute.

  * **environment_variable**: DG_SCHEME

  * **type**: string

  * **optional**: true

* **skip_slack**: Skip slack notification even if a SLACK_URL is define.

  * **type**: boolean

  * **optional**: true

  * **default_value**: false


### start_framework_release
```
fastlane start_framework_release
```
Start new framework release version on your git repository

This lane require **git flow** installed in your framework directory check documentation [here](https://github.com/nvie/gitflow)

You will automatically be switched to release/X.X.X branch after this lane and your project/podsec version will be updated

####Example using specific version:

```
fastlane start_framework_release version:4.0.9
```

####Options

* **bump_type**: The type of this version bump. Available: patch, minor, major

  * **environment_variable**: DG_BUMP_TYPE

  * **type**: string

  * **optional**: true

  * **default_value**: patch

* **version**: Change to a specific version. This will replace the bump type value

  * **environment_variable**: DG_RELEASE_VERSION

  * **type**: string

  * **optional**: true, **automatically patch** release version to the next number (1.0.0 --> 1.0.1)

* **project**: The project path.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **podspec_path**: The podspec path if specific.

  * **environment_variable**: DG_PODSPEC_PATH

  * **type**: string

  * **optional**: true


### submit_framework_release
```
fastlane submit_framework_release
```
Submit the framework release version on your git repository and close the branch

This lane require **git flow** installed in your framework directory check documentation [here](https://github.com/nvie/gitflow)

You will automatically be switched to develop branch after this lane

####How to install ?

This lane require the `tests` lane define in [Digipolitan/fastlane-ios-common](https://github.com/Digipolitan/fastlane-ios-common)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-ios-common'
)
```

####Options

* **message**: The commit message

  * **type**: string

  * **optional**: true

  * **default_value**: Release version **VERSION**

* **workspace**: The workspace to use.

  * **environment_variable**: DG_WORKSPACE

  * **type**: string

  * **optional**: true

* **project**: The project path.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **scheme**: The scheme into the workspace to execute.

  * **environment_variable**: DG_SCHEME

  * **type**: string

  * **optional**: true


### framework_deploy_cocoapods
```
fastlane framework_deploy_cocoapods
```
CocoaPods deployment lane

This lane must be run only on the **master** branch

####Options

* **podspec_path**: The podspec path

  * **environment_variable**: DG_PODSPEC_PATH

  * **type**: string

  * **optional**: true

####Environment variables

* **COCOAPODS_TRUNK_TOKEN**: The CocoaPods access token use to push the release to CocoaPods, check below how to retrieve CocoaPods token

  * **type**: string

  * **optional**: true

####Output context variables

* **DG_COCOAPODS_RELEASE_LINK**: The CocoaPods release link

  * **type**: string

####How to retrieve CocoaPods Trunk Token ?

First setup your CocoaPods trunk [as follow](https://guides.cocoapods.org/making/getting-setup-with-trunk.html)

After that run this command :

```
grep -A2 'trunk.cocoapods.org' ~/.netrc
```

The output sould be something like this :

```
machine trunk.cocoapods.org
  login user@example.com
  password XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

The password `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` is your CocoaPods trunk token


### framework_deploy_github
```
fastlane framework_deploy_github
```
GitHub deployment lane

This lane must be run only on the **master** branch

####Options

* **token**: The GitHub access token use to push the release to GitHub, check how to generate access token [here](https://help.github.com/articles/creating-an-access-token-for-command-line-use/)

  * **environment_variable**: DG_GITHUB_TOKEN

  * **type**: string

  * **optional**: false

* **repository_name**: The GitHub repository name such as 'company/project'

  * **environment_variable**: DG_GITHUB_REPOSITORY_NAME

  * **type**: string

  * **optional**: false

* **project**: Your xcodeproj path

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **skip_carthage**: Skip the carthage asset to the GitHub release

  * **type**: boolean

  * **optional**: true

  * **default_value**: false
### travis_framework_tests
```
fastlane travis_framework_tests
```
Build and run all tests for the given environment

####Example:

```
fastlane travis_framework_tests workspace:NAME.xcworkspace
```

####How to install ?

This lane require the `tests` lane define in [Digipolitan/fastlane-ios-common](https://github.com/Digipolitan/fastlane-ios-common)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-ios-common'
)
```

####Options

* **workspace**: The workspace to use.

  * **environment_variable**: DG_WORKSPACE

  * **type**: string

  * **optional**: true

* **name**: The framework name.

  * **environment_variable**: DG_FRAMEWORK_NAME

  * **type**: string

  * **optional**: true

* **project**: The project to use.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **scheme**: The scheme into the workspace to execute.

  * **environment_variable**: DG_SCHEME

  * **type**: string

  * **optional**: true

* **skip_slack**: Skip slack notification even if a SLACK_URL is define.

  * **type**: boolean

  * **optional**: true

  * **default_value**: false

####Environment variables

* **SLACK_URL**: The slack Hook URL

  * **type**: string

  * **optional**: true


### travis_framework_after_success_action
```
fastlane travis_framework_after_success_action
```
Travis after success lane, the action depend of the current git branch

For all branches run **code coverage** and submit stat to slack

After that only for the **master branch**, deploy framework to **github** and **cocoapods**

####How to install ?

This lane require the `coverage` lane define in [Digipolitan/fastlane-ios-common](https://github.com/Digipolitan/fastlane-ios-common)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-ios-common'
)
```

This lane require :

- `framework_deploy_github` lane **if github_repository_name != nil**

- `framework_deploy_cocoapods` lane **if skip_cocoapods != true**

Define in [Digipolitan/fastlane-ios-framework](https://github.com/Digipolitan/fastlane-ios-framework)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-ios-framework'
)
```

####Options

* **github_repository_name**: The GitHub repository name such as 'company/project'

  * **environment_variable**: DG_GITHUB_REPOSITORY_NAME

  * **type**: string

  * **optional**: true

* **workspace**: The workspace to use.

  * **environment_variable**: DG_WORKSPACE

  * **type**: string

  * **optional**: true

* **project**: The project to use.

  * **environment_variable**: DG_PROJECT

  * **type**: string

  * **optional**: true

* **scheme**: The scheme into the workspace to execute.

  * **environment_variable**: DG_SCHEME

  * **type**: string

  * **optional**: true

* **skip_slack**: Skip slack notification even if a SLACK_URL is define.

  * **type**: boolean

  * **optional**: true

  * **default_value**: false

* **skip_cocoapods**: Skip cocoapods deployment

  * **type**: boolean

  * **optional**: true

  * **default_value**: false

* **skip_carthage**: Skip carthage deployment

  * **type**: boolean

  * **optional**: true

  * **default_value**: false

####Environment variables

* **SLACK_URL**: The slack Hook URL

  * **type**: string

  * **optional**: true



----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).