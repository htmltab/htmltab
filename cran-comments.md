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

Additionally, *only* on win devel (with `devtools::check_win_devel`) I get the following error

  Running the tests in 'tests/testthat.R' failed.
  Complete output:
    > library(testthat)
    > test_check("htmltab")
    Loading required package: htmltab
    == Failed tests ================================================================
    -- Error (test_inputs.R:18:3): check_type produces class output ----------------
    Error: cannot open the connection to 'https://en.wikipedia.org/w/index.php?title=2014_Indian_general_election&oldid=1007662542'
    Backtrace:
        x
     1. +-base::suppressWarnings(XML::htmlParse(readLines(con))) test_inputs.R:18:2
     2. | \-base::withCallingHandlers(...)
     3. +-XML::htmlParse(readLines(con))
     4. \-base::readLines(con)
    
    [ FAIL 1 | WARN 15 | SKIP 0 | PASS 119 ]
    Error: Test failures
    In addition: Warning message:
    In for (i in seq_len(n)) { :
      closing unused connection 4 (https://en.wikipedia.org/w/index.php?title=2014_Indian_general_election&oldid=1007662542)
    Execution halted
    
I'm not sure how to solve this, all the other systems have no problem with it.. Should I disable this for CRAN?

## Downstream dependencies
Could not use revdep_check because htmltab was previously removed from CRAN