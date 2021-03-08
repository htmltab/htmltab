Resubmission with removal of outdated references as requeested by CRAN maintainers.

## Test environments
* local Windows 10, R 4.0.3
* github action "check-standard" (win release, macos release, ubuntu release+devel)
* rhub::check_for_cran(env_vars=c(`_R_CHECK_FORCE_SUGGESTS_` = "true",
                                  `_R_CHECK_CRAN_INCOMING_USE_ASPELL_` = "true", 
                                  R_COMPILE_AND_INSTALL_PACKAGES = "always"))
* win devel

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
  Maintainer: ‘Gerhard Burger <burger.ga@gmail.com>’
  
  New submission
  
  Package was archived on CRAN
  
  Possibly mis-spelled words in DESCRIPTION:
    preprocesses (22:58)
  
  CRAN repository db overrides:
    X-CRAN-Comment: Archived on 2021-01-21 as check problems were not
      corrected in time.

This is a submission from a new maintainer; I fixed the issues, because I'd like this package to stay on CRAN. I contacted the previous maintainer, Christian Rubba, and he is ok with this.

## Downstream dependencies
Could not use revdep_check because htmltab was previously removed from CRAN