# Forecast specifications - 2009 Canary update

1 	# Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=F(endyr); 5=Ave F (enter yrs); 6=read Fmult
2006 	# First year for averaging selex to use in forecast (e.g. 2004; or use -x to be rel endyr)
2008 	# Last year for averaging selex to use in forecast 
1	# Benchmarks:0=skip, 1=calc Fspr, Fbtgt, Fmsy
2 	# MSY: 0=none,1=F(SPR),2=calc F(MSY),3=F(Btgt),4=set to F(endyr) 
0.922 	# SPR target (e.g. 0.40)
0.4 	# Biomass target (e.g. 0.40)
12 	# Number of forecast years 
1     # Read advanced options add indents below if 1
0 	# Puntalyzer output: 0=no,1=yes 
-1 	# Rebuilder:  first year catch could have been set to zero (Ydecl)
-1 	# Rebuilder:  year for current age structure (Yinit)
1 	# Control rule method (1=west coast adjust catch; 2=adjust F) 
0.05 	# Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40) 
0.001 	# Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
1 	# Control rule fraction of Flimit (e.g. 0.75) 
-1 	# maximum annual catch during forecast (not coded yet)
0 	# 0= no implementation error; 1=use implementation error in forecast (not coded yet)
0.1 	# stddev of log(realized F/target F) in forecast (not coded yet)
1 	# fleet allocation (in terms of F) (1=use endyr pattern,no read; 2=read below)
24 	# Number of manual forecast catches to input
2 	# basis for forecatch:  1=retained catch; 2=total dead catch (if line above > 0)
# Year Seas Fleet Catch
2009	1	1	0.14    # 2009-2010 OYs (105mt) hard-wired at 2006-2008 average allocations
2009	1	2	13.43
2009	1	3	22.25
2009	1	4	8.41
2009	1	5	0.56
2009	1	6	7.08
2009	1	7	2.37
2009	1	8	6.45
2009	1	9	8.13
2009	1	10	17.50
2009	1	11	9.28
2009	1	12	9.40
2010	1	1	0.14
2010	1	2	13.43
2010	1	3	22.25
2010	1	4	8.41
2010	1	5	0.56
2010	1	6	7.08
2010	1	7	2.37
2010	1	8	6.45
2010	1	9	8.13
2010	1	10	17.50
2010	1	11	9.28
2010	1	12	9.40

999 # end of forecast file