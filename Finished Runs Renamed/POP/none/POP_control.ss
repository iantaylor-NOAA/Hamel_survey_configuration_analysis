# 2016 for 2013 POP control 7/15/2016
#No Combo Survey Oct 2016
###################################################
## Prior type -1 = none, 0=normal, 1=symmetric beta, 2=full beta, 3=lognormal

###################################################

1	# N growth patterns
1	# N sub morphs within patterns 
1	# Number of block designs for time varying parameters
5       # number of blocks

1940 1981 1982 1988 1989 1994 1995 2007 2009 2010

# Mortality and growth specifications
0.5	# Fraction female (birth) 
0	# M setup: 0=single parameter,1=breakpoints,2=Lorenzen,3=age-specific;4=age-specific,seasonal interpolation
1 	# Growth model: 1=VB with L1 and L2, 2=VB with A0 and Linf, 3=Richards, 4=Read vector of L@A 
3	# Age for growth Lmin
25	# Age for growth Lmax
0.0	# Constant added to SD of LAA (0.1 mimics SS2v1 for compatibility only) 
0 	# Variability of growth: 0=CV~f(LAA), 1=CV~f(A), 2=SD~f(LAA), 3=SD~f(A)
3 	#_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=read fec and wt from wtatage.ss
#maturity ages 0 to 40 from Hannah and Parker 2007 book bhaper (from "Biology, Assessment, and Management of North Pacific Rockfishes")
0 0 0 0 0 0.24 0.49 0.73 0.89 0.95 0.91 0.85 0.81 0.84 0.89 0.94 0.96 0.95 0.94 0.94 0.94 0.95 0.95 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
5	# First age allowed to mature (ignored from above)
3	# Fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b
0  	# Hermaphroditism option:  0=none; 1=age-specific fxn
2	# MG parm offset option: 1=none, 2= M,G,CV_G as offset from GP1, 3=like SS2v1
1	# MG parm env/block/dev_adjust_method: 1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check

# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd 	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
0.02 	0.1 	0.05 	-2.81 -1 	0.31 	-2	0	0	0	0	0	0	0	# M female
### Growth parameters 
# Females
15	25	21.211	22.2214	-1	99	-3	0	0	0	0	0	0	0	# A0
35	45	41.983	39.986	-1	99	-2	0	0	0	0	0	0	0	# Linf 
0.1	0.4	0.159  0.193718  -1	99	-3	0	0	0	0	0	0	0	# VBK
0.03	0.16	0.072	0.1	-1	99	-5	0	0	0	0	0	0	0	# CV of length at age 0
0.03	0.16	0.064	0.1	-1	99	-5	0	0	0	0	0	0	0	# CV of length at age inf

-1 	1 	0.00 	0.05 0 	0.1 	2	0	0	0	0	0	0	0	# M male
# Males
-1 	1 	0.00 	0.00 -1 	99 	-2	0	0	0	0	0	0	0		# A0
-1 	1 	-0.059 	0.00 -1 	99 	-2	0	0	0	0	0	0	0	# Linf 
-1 	1 	0.195 	0.00 -1 	99 	-2	0	0	0	0	0	0	0	# VBK
-1 	1 	0.049 	0.00 -1 	99 	-2	0	0	0	0	0	0	0	# CV of length at age 0
-1 	1 	-0.189 	0.00 -1 	99 	-2	0	0	0	0	0	0	0	# CV of length at age inf
# W-L, maturity and fecundity parameters
# Female Weight Length
# Estimated from BDS data 5.23.11 10:14pm
0	3	1.065E-05	1.0E-05	-1	99	-50	0	0	0	0	0	0	0	# F W-L slope
2 	4	3.08	3.05	-1	99	-50	0	0	0	0	0	0	0	# F W-L exponent
# Maturity ok from  assessment
2	12	8	8	-1	99	-50	0	0	0	0	0	0	0	# Age at 50% maturity
-2 	4	-2.0	-2.0	-1	99	-50	0	0	0	0	0	0	0	# Age Logistic maturity slope
#  fecundity relationship from E.J.
0	6	1.08643	1.0	-1	99	-50	0	0	0	0	0	0	0	# mult for fec since opt 3
-3	3	1.44	1.0	-1	99	-50	0	0	0	0	0	0	0	# exponent on weight for fecundity since option 3
# Male Weight Length
# Estimated from BDS data 5.23.11 10:14pm
0	3	1.395E-05	1.0E-05	-1	99	-50	0	0	0	0	0	0	0	# M W-L slope
2	4	3.0	3.05	-1	99	-50	0	0	0	0	0	0	0	# M W-L exponent
# Unused recruitment interactionM
0	2	1	1	-1	99	-50	0	0	0	0	0	0	0	# placeholder only
0	2	1	1	-1	99	-50	0	0	0	0	0	0	0	# placeholder only
0	2	1	1	-1	99	-50	0	0	0	0	0	0	0	# placeholder only
0	2	1	1	-1	99	-50	0	0	0	0	0	0	0	# placeholder only
0 0 0 0 0 0 0 0 0 0 # Unused MGparm_seas_effects

# Spawner-recruit parameters
3 # S-R function: 1=B-H w/flat top, 2=Ricker, 3=standard B-H, 4=no steepness or bias adjustment
# Lo	Hi	Init	Prior	Prior	Prior	Param
# bnd	bnd	value	mean	type	SD	phase
5	20	10.2	10	-1	5	1	# Ln(R0)
0.2	1	0.4	0.78	-1	.165	-3	# Steepness 
0.5	1.2	0.7	0.76	-1	99	-6	# Sigma-R
-5	5	0	0	-1	99	-50	# Env link coefficient
-5	5	0	0	-1	99 	-50	# Initial equilibrium recruitment offset
 0 	2 	0 	1 	-1	99 	-50     # Autocorrelation in rec devs
0 # index of environmental variable to be used
0 # SR environmental target: 0=none;1=devs;_2=R0;_3=steepness
1 # Recruitment deviation type: 0=none; 1=devvector; 2=simple deviations

# Recruitment deviations
1952	# Start year standard recruitment devs
2010	# End year standard recruitment devs
1	# Rec Dev phase

1 # Read 11 advanced recruitment options: 0=no, 1=yes
1932	# Start year for early rec devs
3 	# Phase for early rec devs
5	# Phase for forecast recruit deviations
1 	# Lambda for forecast recr devs before endyr+1
1954 	# Last recruit dev with no bias_adjustment
1970 	# First year of full bias correction (linear ramp from year above)
2007	# Last year for full bias correction in_MPD
2011 	# First_recent_yr_nobias_adj_in_MPD
0.875	# Maximum bias adjustment in MPD
0 	# Period of cycles in recruitment (N parms read below)
-6	# Lower bound rec devs
6	# Upper bound rec devs
0 	# Read init values for rec devs

# Fishing mortality setup 
0.03 	# F ballpark for tuning early phases
1999 	# F ballpark year
1 	# F method:  1=Pope's; 2=Instan. F; 3=Hybrid
0.95 	# Max F or harvest rate (depends on F_Method)

# Init F parameters by fleet
#LO	HI	INIT	PRIOR	PR_type	SD	PHASE
0	1	0	0.01	-1	99	 -2

# Catchability setup
# A=do power: 0=skip, survey is prop. to abundance, 1= add par for non-linearity
# B=env. link: 0=skip, 1= add par for env. effect on Q
# C=extra SD: 0=skip, 1= add par. for additive constant to input SE (in ln space)
# D=type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
# 	   3=ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1
# A B C D		
# Create one par for each entry > 0 by row in cols A-D
0	0	0	0	 # Landings
0	0	0	0	 # POP
0	0	0	0	 # Early Triennial
0	0	0	0	 # Late Triennial
0	0	0	0	 # AFSC Slope
0	0	0	0	 # NWFSC slope


#_SELEX_&_RETENTION_PARAMETERS
# Size-based setup
# A=Selex option: 1-24
# B=Do_retention: 0=no, 1=yes
# C=Male offset to female: 0=no, 1=yes
# D=Extra input (#)
# A B C D
# Size selectivity
24	1	0	0	 # Landings
1	0	0	0	 # POP
1	0	0	0	 # Early Triennial
15	0	0	3	 # Late Triennial
15	0	0	2	 # AFSC Slope
15	0	0	2	 # NWFSC slope
# Age selectivity
10	0	0	0  # Fishery
10	0	0	0  # POP
10	0	0	0  # Early Triennial
10	0	0	0   # Late Triennial
10	0	0	0   # AFSC Slope
10	0	0	0   # NWFSC Slope

# Selectivity parameters
# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd 	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
# Fishery age-based 
  # Selectivity parameters
# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd 	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
# Block design 1 means that parm’ = baseparm + blockparm, 2 means that parm’ = blockparm
# Fishery length-based 
20	45	31	28	-1	50	2	0	0	0	0	0	0	0 # Peak
-6	4	-5	-1	-1	50	-2	0	0	0	0	0	0	0 # Top
-1	9	2	4	-1	50	3	0	0	0	0	0	0	0 # Asc width
-1	9	0	4	-1	50	3	0	0	0	0	0	0	0 # Desc width
-5	9	-4.99	-4	-1	50	4	0	0	0	0	0	0	0 # Init
-5	9	1	-2	-1	50	2	0	0	0	0	0	0	0 # Final 
# Retention			
15	45	27	35	-1	99	1	0	0	0	0	0.5	0	0 # Inflection
0.1	10	2	1	-1	99	1	0	0	0	0	0.5	0	0 # Slope	
0.001	1	0.9	0.9	-1	99	-1	0	0	0	0	0.5	1	2 # Asymptote 
0	0	0	0	-1	99	-3	0	0	0	0	0.5	0	0 # Male offset
# POP	and slope surveys												
20	70	25	30	-1	99	2	0	0	0	0	0	0	0	#infl_for_logistic		
0.001	50	11	15	-1	99	3	0	0	0	0	0	0	0	#95%width_for_logistic
# Triennial														
18	70	25	30	-1	99	2	0	0	0	0	0	0	0	#infl_for_logistic		
0.001	50	11	15	-1	99	3	0	0	0	0	0	0	0	#95%width_for_logistic

1	# Selex block setup: 0=Read one line apply all, 1=read one line each parameter
# Lo	Hi	Init	Prior	P_type	SD	Phase
0.001	1	.999	.9	0	99	-1
0.001	1	.98	.9	0	99	-1
0.001	1	.9	.88	0	99	1
0.001	1	.8	.82	0	99	1
0.001	1	.6	.65	0	99	1

# -6	4	0	0	0	50	3
# 31	100	40	55	0	99	3

#Sel Parameter Adjustment Method 1 = direct, 2 = logistic and compare to bounds
1

0 # Tagging flag: 0=no tagging parameters,1=read tagging parameters

### Likelihood related quantities ###
1 # Do variance/sample size adjustments by fleet (1)
# # Component
 0	0.11	0	0.27	0	0.47	# Constant added to index CV
 0	0	0	0	0	0	# Constant added to discard SD
 0	0	0	0	0	0	# Constant added to body weight SD
 1	1	1	1	.85	1	# multiplicative scalar for length comps
 1	.4	.7	.84	1	1	# multiplicative scalar for agecomps
 1	1	1	1	1	1	# multiplicative scalar for length at age obs


1	# Lambda phasing: 1=none, 2+=change beginning in phase 1
1	# Growth offset likelihood constant for Log(s): 1=include, 2=not
0 # N changes to default Lambdas = 1.0
# Component codes:  
#  1=Survey, 2=discard, 3=mean body weight
#  4=length frequency, 5=age frequency, 6=Weight frequency
#  7=size at age, 8=catch, 9=initial equilibrium catch
#  10=rec devs, 11=parameter priors, 12=parameter devs
#  13=Crash penalty
# Component fleet/survey  phase  value  wtfreq_method

0	# Extra SD reporting switch

999 # End control file
