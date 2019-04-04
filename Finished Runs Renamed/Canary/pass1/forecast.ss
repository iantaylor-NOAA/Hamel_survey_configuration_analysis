#V3.21e
# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy 
1 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt); 4=set to F(endyr) 
0.887 # SPR target (e.g. 0.40)
0.4 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF (enter actual year, or values of 0 or -integer to be rel. endyr)
 0 0 0 0 0 0
#  2010 2010 2010 2010 2010 2010 # after processing 
2 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
1 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
12 # N forecast years 
1 # F scalar (only used for Do_Forecast==5)
#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF  (enter actual year, or values of 0 or -integer to be rel. endyr)
 0 0 0 0
#  2010 2010 2010 2010 # after processing 
1 # Control rule method (1=catch=f(SSB) west coast; 2=F=f(SSB) ) 
0.4 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below) 
0.1 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 # Control rule target as fraction of Flimit (e.g. 0.75) 
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
-1 #_Forecast loop control #3 (reserved for future bells&whistles) 
0 #_Forecast loop control #4 (reserved for future bells&whistles) 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2013  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1) 
1999 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2002 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
2 # fleet relative F:  1=use first-last alloc year; 2=read seas(row) x fleet(col) below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum)
# Conditional input if relative F choice = 2
# Fleet relative F:  rows are seasons, columns are fleets
#_Fleet:  1CA_S_trwl 2CA_N_trwl 3OR_trwl 4WA_trwl 5CA_S_nontrwl 6CA_N_nontrwl 7WAOR_nontrwl 8CA_S_rec 9CA_N_rec 10WAOR_rec 11_atseahake 12_NWFSC
0.018660 0.044578 0.180326 0.115599 0.000177 0.000163 0.107902 0.056306 0.122046 0.110701 0.154982 0.088561
# max totalcatch by fleet (-1 to have no max) must enter value for each fleet
 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
# max totalcatch by area (-1 to have no max); must enter value for each fleet 
 -1
# fleet assignment to allocation group (enter group ID# for each fleet, 0 for not included in an alloc group)
 0 0 0 0 0 0 0 0 0 0 0 0
#_Conditional on >1 allocation group
# allocation fraction for each of: 0 allocation groups
# no allocation groups
24 # Number of forecast catch levels to input (else calc catch from forecast F) 
2 # basis for input Fcast catch:  2=dead catch; 3=retained catch; 99=input Hrate(F) (units are from fleetunits; note new codes in SSV3.20)
# Input fixed catch values
#Year Seas Fleet Catch(or_F) 
 2011 1 1 1.90332
 2011 1 2 4.54696
 2011 1 3 18.3933
 2011 1 4 11.7911
 2011 1 5 0.018054
 2011 1 6 0.016626
 2011 1 7 11.006
 2011 1 8 5.74321
 2011 1 9 12.4487
 2011 1 10 11.2915
 2011 1 11 15.8082
 2011 1 12 9.03322
 2012 1 1 1.99662
 2012 1 2 4.76985
 2012 1 3 19.2949
 2012 1 4 12.3691
 2012 1 5 0.018939
 2012 1 6 0.017441
 2012 1 7 11.5455
 2012 1 8 6.02474
 2012 1 9 13.0589
 2012 1 10 11.845
 2012 1 11 16.5831
 2012 1 12 9.47603
#
999 # verify end of input 
