# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and due to the way Cuis Smalltalk manages package versions, this project does not follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/Garuflax/cuis-testlint/compare/v1.40...HEAD)

## [1.40](https://github.com/Garuflax/cuis-testlint/compare/v1.39...v1.40) - 2023-05-31
### Fixed
- WrongAssertUsageTestRule used to need that all #assert: had a message as argument.

## [1.39](https://github.com/Garuflax/cuis-testlint/compare/v1.38...v1.39) - 2023-05-06
### Fixed
- Manage assertions with cascade operator ";".

## [1.38](https://github.com/Garuflax/cuis-testlint/compare/v1.36...v1.38) - 2023-01-26
### Added
- Returning assertion rule test smell description with route to assertion.
- Ability to except assertions by defining the method #exceptedTestLintSelectorsForAssertionAnalysis with the selectors of the excepted assertions.

## [1.36](https://github.com/Garuflax/cuis-testlint/compare/v1.33...v1.36) - 2022-12-10
### Added
- Rule for detecting tests that use the "Transcript" class.
- Rule for detecting test classes that override the default code-behavior of the unit testing framework.
- Rule for detecting returning assertions.

## [1.33](https://github.com/Garuflax/cuis-testlint/compare/v1.27...v1.33) - 2022-11-12
### Added
- Rule for detecting test classes that do not use one of its instance variables.
- Rule for detecting tests that call a test.
- Rule for detecting tear down only test-suites.
- Rule for detecting empty method categories.
- Mark excepted test lint rules implementing the method "exceptedTestLintRules".

### Changed
- Prints message when no test lint failures are detected.

### Fixed
- Assertionless test rule now has less false positives.

## [1.27](https://github.com/Garuflax/cuis-testlint/compare/v1.16...v1.27) - 2022-10-05
### Added
- Rule for detecting tests with return.
- Rule for detecting unclassified tests.
- Rule for detecting method categories with a meaningless name.

### Changed
- Improved Test Lint Result window where failures are grouped.

## [1.16](https://github.com/Garuflax/cuis-testlint/compare/v1.15...v1.16) - 2022-08-14
### Added
- Rule for detecting tests with too many literals.

### Changed
- ProperOrganizationTestRule now allows to pass messages as arguments to assertions.

## [1.15](https://github.com/Garuflax/cuis-testlint/compare/v1.14...v1.15) - 2022-07-17
### Added
- Rule for detecting tests that do ```assert: a = b``` instead of ```assert: a equals: b```.

## [1.14](https://github.com/Garuflax/cuis-testlint/compare/v1.13...v1.14) - 2022-07-11
### Added
- Rule for detecting tests not following a proper organization.

## [1.13](https://github.com/Garuflax/cuis-testlint/compare/v1.10...v1.13) - 2022-07-03
### Added
- Rule for detecting assertionless test.

### Changed
- TestLint is now run as a "Method Object".
- Method "expectedTestLintFailures" now uses ExpectedTestSmellInformation in order to remove redundant "self class" in method.

## [1.10](https://github.com/Garuflax/cuis-testlint/compare/v1.9...v1.10) - 2022-06-10
### Added
- Rule for detecting classes that have too many instance variables.

### Fixed
- Expected failures of not run nodes were being notified.

## [1.9](https://github.com/Garuflax/cuis-testlint/compare/v1.8...v1.9) - 2022-06-05
### Added
- Mark expected test smells implementing the method "expectedTestLintFailures".

## [1.8](https://github.com/Garuflax/cuis-testlint/compare/v1.5...v1.8) - 2022-05-29
### Added
- New context menu option for Test Classes to run testlint over them.
- Throw exception when creating an invalid TestMethodNode, TestClassNode or LongTestRule.

### Fixed
- Mixed Selectors Rule was only checking if the last 2 methods of the category were of the same type.

## [1.5](https://github.com/Garuflax/cuis-testlint/compare/v1.4...v1.5) - 2022-05-25
### Added
- Rule for detecting categories with Mixed Selectors.

### Fixed
- Correct printing of Test Smells.

## [1.4](https://github.com/Garuflax/cuis-testlint/compare/v1.2...v1.4) - 2022-05-15
### Added
- Rule for detecting Guarded Test.
- New context menu option for Categories to run testlint over them.

### Fixed
- Do not permit running TestLint on not Test Methods.

## [1.2](https://github.com/Garuflax/cuis-testlint/compare/v1.1...v1.2) - 2022-05-01
### Added
- Rule for detecting Long Test.

### Changed
- Rule for detecting Anonymous Test now uses [Regex](https://github.com/nmingotti/Cuis-Smalltalk-Regex).

## [1.1](https://github.com/Garuflax/cuis-testlint/compare/v1.0...v1.1) - 2022-04-14
### Added
- Rule for detecting Anonymous Test.

## [1.0](https://github.com/Garuflax/cuis-testlint/releases/tag/v1.0) - 2022-04-10
### Added
- New context menu option for Messages to run testlint over them.

