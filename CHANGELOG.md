# CHANGELOG

## v1.1.2 (2021-06-19)

* Removed duplicate record, unpacked, and sorted list of cloud storage providers to ignore
* Added explicit exit status of `1` to exit logic where applicable

## v1.1.1 (2021-01-09)

* Switched from Travis-CI to GitHub Actions
* Using `homebrew-releaser` for automated releasing

## v1.1.0 (2020-10-05)

* Moved all logic to functions
* Replaced global variables with local variables

## v1.0.0 (2020-09-16)

* Now installable via Homebrew
* Updated docs

## v0.3.0 (2020)

* Added cloud hosts to the exclusion list of items to not remove data from

## v0.2.0 (2020)

* Refactored to remove all items from the home folder excluding a few notable exceptions
* Better user confirmation before proceeding

## v0.1.0 (2020)

* Initial release
* Required a full list of items to remove
