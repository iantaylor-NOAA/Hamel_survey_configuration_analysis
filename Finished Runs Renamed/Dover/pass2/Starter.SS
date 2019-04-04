#C Dover Sole 2011 assessment: recreate 2005 assessment in SS3 (Allan Hicks, Chantel Wetzel)
dover2011.dat
dover2011.ctl
0 # 0=use init values in control file; 1=use ss3.par
0 # run display detail (0,1,2)
0 # detailed age-structured reports in REPORT.SSO (0,1)
0 # write detailed checkup.sso file (0,1)
0 # write parm values to ParmTrace.sso (0=no,1=good,active; 2=good,all; 3=every_iter,all_parms; 4=every,active)
0 # Cumulative Report
0 # Include prior_like for non-estimated parameters (0,1)
1 # Use Soft Boundaries to aid convergence (0,1) (recommended)
0 # Number of bootstrap datafiles to produce (N-2), 1 means reporduce data, 2 means add expected values
10 # Turn off estimation for parameters entering after this phase
1 # MCMC burn interval
1 # MCMC thin interval
0.0001 # jitter initial parm value by this fraction
-1 # min yr for sdreport outputs (-1 for styr)
-2 # max yr for sdreport outputs (-1 for endyr; -2 for endyr+Nforecastyrs
0 # N individual STD years
#vector of year values
# 1973 1976
0.00001 # final convergence criteria (e.g. 1.0e-04)
0 # retrospective year relative to end year (e.g. -4)
5 # min age for calc of summary biomass
1 # Depletion basis:  denom is: 0=skip; 1=rel X*B0; 2=rel X*Bmsy; 3=rel X*B_styr
1 # Fraction (X) for Depletion denominator (e.g. 0.4)
4 # (1-SPR)_reporting:  0=skip; 1=rel(1-SPR); 2=rel(1-SPR_MSY); 3=rel(1-SPR_Btarget); 4=notrel
1 # F_std reporting: 0=skip; 1=exploit(Bio); 2=exploit(Num); 3=sum(frates)
0 # F_report_basis: 0=raw; 1=rel Fspr; 2=rel Fmsy ; 3=rel Fbtgt
999 # check value for end of file
