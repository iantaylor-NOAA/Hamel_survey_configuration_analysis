# Control file for 2009 canary assessment update
# updated to run in SSv3.20

# Morph setup
1	# Number of growth patterns
1	# N sub morphs within growth patterns

# Time block setup
13	# Number of time block designs for time varying parameters
1 	# Blocks in design 1 
1	# Blocks in design 2
1	# Blocks in design 3 
1	# Blocks in design 4  
2	# Blocks in design 5  
2	# Blocks in design 6  
2	# Blocks in design 7 
2 	# Blocks in design 8
3	# Blocks in design 9
3	# Blocks in design 10  
3	# Blocks in design 11
3	# Blocks in design 12
2       # Blocks in design 13

1995 2010		# Block Design 1 Trip limits
2000 2010		# Block Design 2 footrope/overfished declaration
2002 2010 		# Block Design 3 RCA
2005 2010 		# Block Design 4 Flatfish trawl

1995 1999 2000 2010 	# Block Design 5 trip limits + footrope
1995 2001 2002 2010 	# Block Design 6 trip limits + RCA
2000 2001 2002 2010 	# Block Design 7 footrope + RCA
2000 2004 2005 2010 	# Block Design 8 footrope + flatfish trawl

2000 2001 2002 2004 2005 2010 # Block Design 9 footrope + RCA + flatfish trawl
1995 1999 2000 2001 2002 2010 # Block Design 10 trip limits + footrope + RCA
1995 1999 2000 2004 2005 2010 # Block Design 11 trip limits + footrope + flatfish trawl
1979 1994 1995 1999 2000 2010 # Block Design 12 roller gear + trip limits + footrope
1979 1999 2000 2010	      # Block Design 13 roller gear + footrope/overfished declaration


# Mortality and growth specifications
0.5 	# Fraction female at birth
1	# M setup: 0=single Par,1=N_breakpoints,2=Lorenzen,3=agespecific;_4=agespec_withseasinterpolate
2	# Number of M breakpoints
6 14	# Ages at M breakpoints
1 	# Growth model: 1=VB with L1 and L2, 2=VB with A0 and Linf, 3=Richards, 4=Read vector of L@A 
1	# Age for growth Lmin
80	# Age for growth Lmax
0.0 	# SD constant added to LAA (0.1 mimics v1.xx for compatibility only) 
0 	# Variability about growth: 0=CV~f(LAA) [mimic v1.xx], 1=CV~f(A), 2=SD~f(LAA), 3=SD~f(A)
1 	# maturity option: 1=length logistic, 2=age logistic, 3=read maturity at age for each growth pattern
2 	# First age allowed to mature
1       # maturity option
0  	# hermaphro
3	# mg parm offset option: 
1	# mg parm adjust method 1=do V1.23 approach, 2=use logistic transform between bounds approach

# Mortality and growth parameters
# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd  	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
# Females
0.04	0.08	0.06	0.06	0	50	-50	0	0	0	0	0.5	0	0	#M1_natM_young
0	0.9	0.45	0.4	-1	50	3	0	0	0	0	0.5	0	0	#M1_natM_old_as_exponential_offset(rel_young)
2	9	3.8	4	-1	50	2	0	0	0	0	0.5	0	0	#M1_Lmin
50	70	59.0	60	-1	50	2	0	0	0	0	0.5	0	0	#M1_Lmax
0.02	0.21	0.14	0.14	-1	50	2	0	0	0	0	0.5	0	0	#M1_VBK
0.02	0.21	0.14	0.15	-1	50	2	0	0	0	0	0.5	0	0	#M1_CV-young
-3	3	-1.3	-1.3	-1	50	2	0	0	0	0	0.5	0	0	#M1_CV-old_as_exponential_offset(rel_young)
# Males
-3	3	0	0	0	50	-50	0	0	0	0	0.5	0	0	#M2_natM_young_as_exponential_offset(rel_morph_1)
-3	3	0	0	0	50	-50	0	0	0	0	0.5	0	0	#M2_natM_old_as_exponential_offset(rel_young)
-3	3	0	0	0	50	-50	0	0	0	0	0.5	0	0	#M2_Lmin_as_exponential_offset
-3	3	-0.12	0	-1	50	2	0	0	0	0	0.5	0	0	#M2_Lmax_as_exponential_offset
-3	3	0.24	0	-1	50	2	0	0	0	0	0.5	0	0	#M2_VBK_as_exponential_offset
-3	3	0.04	0	-1	50	2	0	0	0	0	0.5	0	0	#M2_CV-young_as_exponential_offset(rel_CV-young_for_morph_1)
-3	3	-1.3	0	-1	50	2	0	0	0	0	0.5	0	0	#M2_CV-old_as_exponential_offset(rel_CV-young)
# Weight-Length and maturity parameters (L in cm, W in kg)
# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd  	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
# Females
0	1	1.55E-05 1.55E-05 0	50	-50	0	0	0	0	0.5	0	0	#Female wt-len-1
2	4	3.03	3.03	0	50	-50	0	0	0	0	0.5	0	0	#Female wt-len-2
40	41	40.5	40.5	0	50	-50	0	0	0	0	0.5	0	0	#Female mat-len-1
-3	3	-0.25	-0.25	0	50	-50	0	0	0	0	0.5	0	0	#Female mat-len-2
-3	3	1.0	1.0	0	50	-50	0	0	0	0	0.5	0	0	#Female eggs/gm intercept
-1	1	0.0	0.0	0	50	-50	0	0	0	0	0.5	0	0	#Female eggs/gm slope
# Males
0	1	1.55E-05 1.55E-05 0	50	-50	0	0	0	0	0.5	0	0	#Female wt-len-1
2	4	3.03	3.03	0	50	-50	0	0	0	0	0.5	0	0	#Female wt-len-2

# Distribute recruitment among growth pattern x area x season
0	999	1	1	0	50	-50	0	0	0	0	0.5	0	0	# GP 1
0	999	1	1	0	50	-50	0	0	0	0	0.5	0	0	# Area 1
0	999	1	1	0	50	-50	0	0	0	0	0.5	0	0	# Season 1
# Cohort growth (K) deviation parameter
-1	1	1	1	0	50	-50	0	0	1980	1983	0.5	0	0
# Seasonal effects on biology parameters (0=none)
 0 0 0 0 0 0 0 0 0 0

# Spawner-recruit parameters
6	# S-R function: 1=B-H w/flat top, 2=Ricker, 3=standard B-H, 4=no steepness or bias adjustment
# Lo	Hi	Init	Prior	Prior	Prior	Param
# bnd	bnd	value	mean	type	SD	phase
 7	11	8.5	8.5	-1	50	1	# Ln(R0)
 0.21	0.99	0.511	0.4	0	50	-6	# Steepness
 0	2	0.5	0.4	0	50	-50	# Sigma R
 -5	5	0	0	0	50	-50	# Environmental link coefficient
 -5	5	0	0	0	50	-50	# Initial equilibrium offset to virgin
 0 	2 	0 	1 	0 	50 	-50    	# Autocorrelation in rec devs
0 # index of environmental variable to be used
0 # env target parameter: 1=rec devs, 2=R0, 3=steepness
1 # rec dev type: 0=none, 1=devvector (zero-sum), 2=simple deviations (no sum constraint)

# Recruitment residuals
1960	# Start year recruitment residuals
2010	# End year recruitment residuals
1	# Phase

1 # Read 11 advanced recruitment options: 0=no, 1=yes
0	# first year for early rec devs
-4 	# phase for early rec devs
5	# Phase for forecast recruit deviations
1 	# Lambda for forecast recr devs before endyr+1
1959 	#_last_yr_nobias_adj_in_MPD
1960 	# first year of full bias correction (linear ramp up from this year minus the plus-age to this year)
2010 	# last year for full bias correction in_MPD
2011 	#_first_recent_yr_nobias_adj_in_MPD
1.0  	# max bias adjustment
0	# placeholder
-5	# Lower bound rec devs
5	# Upper bound rec devs
0 # read intitial values for rec devs

# Fishing mortality setup
0.2 	# F ballpark
1999 	# F ballpark year
1 	# F method:  1=Pope's; 2=Instan. F; 3=Hybrid (recommended)
0.9 	# max F or harvest rate, depends on F_Method

# Initial F setup by fishing fleet
# Lo	Hi	Init	Prior	P_type	SD	Phase
0	1	0	0.01	0	50	-50 # 1_CA_S_trwl
0	1	0	0.01	0	50	-50 # 2CA_N_trwl
0	1	0	0.01	0	50	-50 # 3OR_trwl
0	1	0	0.01	0	50	-50 # 4WA_trwl
0	1	0	0.01	0	50	-50 # 5CA_S_nontrwl
0	1	0	0.01	0	50	-50 # 6CA_N_nontrwl
0	1	0	0.01	0	50	-50 # 7WAOR_nontrwl
0	1	0	0.01	0	50	-50 # 8CA_S_rec
0	1	0	0.01	0	50	-50 # 9CA_N_rec
0	1	0	0.01	0	50	-50 # 10WAOR_rec
0	1	0	0.01	0	50	-50 # 11atseahake
0	1	0	0.01	0	50	-50 # 12_NWFSC/research

# Catchability (Q_setup)
#
#Den-dep env-var extra_se Q_type		
0	0	0	0	#	1CA_S_trwl
0	0	0	0	#	2CA_N_trwl
0	0	0	0	#	3OR_trwl
0	0	0	0	#	4WA_trwl
0	0	0	0	#	5CA_S_nontrwl
0	0	0	0	#	6CA_N_nontrwl
0	0	0	0	#	7WAOR_nontrwl
0	0	0	0	#	8CA_S_rec
0	0	0	0	#	9CA_N_rec
0	0	0	0	#	10WAOR_rec
0	0	0	0	#	11_atseahake
0	0	0	0	#	12_NWFSC
0	0	0	0	#	13_Early_tri
0	0	0	0	#	14_pre_recruit
0	0	0	0	#	15_WAtrl_mirror
0	0	0	0	#	16_NWFSC_mirror
0	0	0	0	#	17_Late_tri
0	0	0	0	#	18_Tri_mirror

# Selectivity section
# Size-based setup 
# A=Selex option: 1-24
# B=Do_retention: 0=no, 1=yes
# C=Male offset to female: 0=no, 1=yes, 2=Female offset to male
# D=Mirror selex (#)
# A   B C D
  24  0 2 0	# 1CA_S_trwl
  24  0 2 0	# 2CA_N_trwl
  24  0 2 0	# 3OR_trwl
  24  0 2 0	# 4WA_trwl
  24  0 2 0	# 5CA_S_nontrwl
  24  0 2 0	# 6CA_N_nontrwl
  24  0 2 0	# 7WAOR_nontrwl
  24  0 2 0	# 8CA_S_rec
  24  0 2 0	# 9CA_N_rec
  24  0 2 0	# 10WAOR_rec
  24  0 2 0	# 11atseahake
  24  0 2 0	# 12_NWFSC/research
  24  0 2 0	# 13_Early_triennial
  32  0 0 0	# 14_pre_recruit
  5   0 0 4	# 15WA_trwl_mirror
  5   0 0 12	# 16_NWFSC_mirror
  5   0 0 13	# 17_Late_triennial
  5   0 0 13	# 18_triennial_mirror
# Age-based setup
  10 0 0 0	# 1CA_S_trwl
  10 0 0 0	# 2CA_N_trwl
  10 0 0 0	# 3OR_trwl
  10 0 0 0	# 4WA_trwl
  10 0 0 0	# 5CA_S_nontrwl
  10 0 0 0	# 6CA_N_nontrwl
  10 0 0 0	# 7WAOR_nontrwl
  10 0 0 0	# 8CA_S_rec
  10 0 0 0	# 9CA_N_rec
  10 0 0 0	# 10WAOR_rec
  10 0 0 0	# 11atseahake
  10 0 0 0	# 12_NWFSC/research
  10 0 0 0	# 13_Early_triennial
  10 0 0 0	# 14_pre_recruit
  10 0 0 0 	# 15WA_trwl_mirror
  10 0 0 0	# 16_NWFSC_mirror
  10 0 0 0	# 17_Late_triennial
  10 0 0 0	# 18_triennial_mirror
# Selectivity and retention parameters
# Lo	Hi	Init	Prior	Prior	Prior	Param	Env	Use	Dev	Dev	Dev	Block	block
# bnd	bnd 	value	mean	type	SD	phase	var	dev	minyr	maxyr	SD	design	switch
# 1CA_S_trwl double normal
20	60	40	50	-1	50	4	0	0	0	0	0.5	0	2	# PEAK
-9.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.3	4.2	-1	50	5	0	0	0	0	0.5	0	2	# Asc WIDTH exp
0.0	9.0	2.5	2.6	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-1.0	5	-1	50	5	0	0	0	0	0.5	0	2	# FINAL (logistic)
# Female offsets
10	60	40	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

# 2CA_N_trwl double normal
20	60	43	50	-1	50	4	0	0	0	0	0.5	0	0	# PEAK
-9.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	3.9	2.0	-1	50	5	0	0	0	0	0.5	0	0	# Asc WIDTH exp
0.0	9.0	2.7	2.4	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	2.0	5	-1	50	5	0	0	0	0	0.5	0	0	# FINAL (logistic)
# Female offsets
10	60	45	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-3OR_trwl double normal
20	60	50	50	-1	50	4	0	0	0	0	0.5	12	2	# PEAK
-9.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.0	4.0	-1	50	5	0	0	0	0	0.5	12	2	# Asc WIDTH exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	12	1	5	-1	50	4	0	0	0	0	0.5	12	2	# FINAL (logistic)
# Female offsets
10	60	50	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-4WA_trwl double normal
20	60	50	50	-1	50	4	0	0	0	0	0.5	13	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.5	4.5	-1	50	5	0	0	0	0	0.5	13	2	# Asc WIDTH exp
0.0	9.0	4.4	4.4	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-3.3	5	-1	50	5	0	0	0	0	0.5	13	2	# FINAL (logistic)
# Female offsets
10	60	50	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-5CA_S_nontrwl double normal
20	60	34	50	-1	50	4	0	0	0	0	0.5	2	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.3	4.1	-1	50	5	0	0	0	0	0.5	2	2	# Asc WIDTH exp
0.0	9.0	4.3	4.3	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-1.8	5	-1	50	5	0	0	0	0	0.5	2	2	# FINAL (logistic)
# Female offsets
10	60	35	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-6CA_N_nontrwl double normal
15	60	40	50	-1	50	4	0	0	0	0	0.5	10	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.7	4.2	-1	50	5	0	0	0	0	0.5	10	2	# Asc WIDTH exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	4.99	0.9	-1	50	-5	0	0	0	0	0.5	10	2	# FINAL (logistic)
# Female offsets
10	60	40	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-7WAOR_nontrwl double normal
15	60	49	50	-1	50	4	0	0	0	0	0.5	7	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	4.7	5.8	-1	50	5	0	0	0	0	0.5	7	2	# Asc WIDTH exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	4.0	5	-1	50	5	0	0	0	0	0.5	7	2	# FINAL (logistic)
# Female offsets
10	60	53	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-8CA_S_rec double normal
15	60	30	50	-1	50	4	0	0	0	0	0.5	8	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	3.9	4.0	-1	50	5	0	0	0	0	0.5	8	2	# Asc WIDTH exp
0.0	9.0	3.7	3.7	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-3.5	5	-1	50	5	0	0	0	0	0.5	8	2	# FINAL (logistic)
# Female offsets
10	60	30	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-9CA_N_rec double normal
15	60	28	50	-1	50	4	0	0	0	0	0.5	0	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	3.1	3.1	-1	50	5	0	0	0	0	0.5	0	2	# Asc WIDTH exp
0.0	9.0	4.4	4.4	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-2.3	5	-1	50	5	0	0	0	0	0.5	0	2	# FINAL (logistic)
# Female offsets
10	60	28	44	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-10WAOR_rec double normal
15	60	31	50	-1	50	4	0	0	0	0	0.5	2	2	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	3.2	3.2	-1	50	5	0	0	0	0	0.5	2	2	# Asc WIDTH exp
0.0	9.0	3.3	2.3	-1	50	5	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	-2.4	5	-1	50	5	0	0	0	0	0.5	2	2	# FINAL (logistic)
# Female offsets
10	60	31	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#fishery-11atseahake double normal
15	60	48	50	-1	50	4	0	0	0	0	0.5	0	0	# PEAK
-4.0	4.0	-4	-4	0	50	-50	0	0	0	0	0.5	0	0	# TOP (logistic)
0.0	9.0	3.6	3.7	-1	50	5	0	0	0	0	0.5	0	0	# Asc WIDTH exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# Desc WIDTH exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT (logistic)
-5.0	5.0	4.0	5	-1	50	5	0	0	0	0	0.5	0	0	# FINAL (logistic)
# Female offsets
10	60	48	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#survey-12_NWFSC double normal
20	65	60	50	-1	50	4	0	0	0	0	0.5	0	0	# PEAK	value
-4.0	4.0	-4.0	-4	-1	50	4	0	0	0	0	0.5	0	0	# TOP	logistic
0.0	9.0	8.8	4.0	-1	50	4	0	0	0	0	0.5	0	0	# WIDTH up exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# WIDTH dn exp
-9.0	5.0	-8.0	-9.0	-1	50	4	0	0	0	0	0.5	0	0	# INIT	logistic
-5.0	5.0	4.5	5	-1	50	4	0	0	0	0	0.5	0	0	# FINAL (logistic)
# Add female offsets
10	60	55	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage

#survey-13_Early triennial double normal
20	65	62	50	-1	50	4	0	0	0	0	0.5	0	0	# PEAK	value
-4.0	4.0	-3.6	-4	-1	50	4	0	0	0	0	0.5	0	0	# TOP	logistic
0.0	9.0	7.4	4.0	-1	50	4	0	0	0	0	0.5	0	0	# WIDTH	exp
0.0	9.0	4.0	4.0	0	50	-7	0	0	0	0	0.5	0	0	# WIDTH	exp
-9.0	5.0	-9.0	-9.0	0	50	-50	0	0	0	0	0.5	0	0	# INIT	logistic
-5.0	5.0	4.53	5	-1	50	-4	0	0	0	0	0.5	0	0	# FINAL (logistic)
# Female offsets
10	60	55	50	0	50	-50	0	0	0	0	0.5	0	0	# female dogleg
-4	0	0	0	0	50	-50	0	0	0	0	0.5	0	0	# female offset at minage
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at dogleg
-4	0	0	0	0	50	-6	0	0	0	0	0.5	0	0	# female offset at maxage
### Mirrors, leave fixed ###
#15_Wa trawl mirror for second age key
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Min mirror bin
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Max mirror bin
#16_NWFSC mirror for marginal ages
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Min mirror bin
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Max mirror bin
#17_Late_triennial
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Min mirror bin
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Max mirror bin
#17_triennial mirror for marginal ages
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Min mirror bin
-2	0	-1	0	0	50	-50	0	0	0	0	0.5	0	0	# Max mirror bin
############################

1	# Selex block setup: 0=Read one line apply all, 1=read one line each parameter
# Lo	Hi	Init	Prior	P_type	SD	Phase
20	60	46	50	-1	50	4 # OR trawl peak 1979-1994
20	60	46	50	-1	50	4 # OR trawl peak 1995-1999
20	60	41	50	-1	50	4 # OR trawl peak 2000-2006
0.0	9.0	4.0	4.0	-1	50	5 # OR trawl ascending width 1979-1994
0.0	9.0	4.0	4.0	-1	50	5 # OR trawl ascending width 1995-1999
0.0	9.0	3.7	3.9	-1	50	5 # OR trawl ascending width 2000-2006
-5.0	12.0	0.2	5	-1	50	5 # OR trawl final 1979-1994
-5.0	9.0	0.2	5	-1	50	5 # OR trawl final 1995-1999
-5.0	9.0	0.15	5	-1	50	5 # OR trawl final 2000-2006


20	60	41	50	-1	50	4 # WA trawl peak 1979-1999
20	60	41	50	-1	50	4 # WA trawl peak 2000-2006
0.0	9.0	3.6	4.6	-1	50	5 # WA trawl ascending width 1979-1999
0.0	9.0	3.6	4.6	-1	50	5 # WA trawl ascending width 2000-2006
-5.0	5.0	4.5	5	-1	50	5 # WA trawl final 1979-1999
-5.0	5.0	4.5	5	-1	50	5 # WA trawl final 2000-2006

20	60	24	50	-1	50	4 # S CA nontrawl peak 2000-2006
0.0	9.0	1.6	1.3	-1	50	5 # S CA nontrawl ascending width 2000-2006
-5.0	5.0	-4.5	5	-1	50	5 # S CA nontrawl final 2000-2006

20	60	33	50	-1	50	4 # N CA nontrawl peak 1995-1999
20	60	41	50	-1	50	4 # N CA nontrawl peak 2000-2001
20	60	33	50	-1	50	4 # N CA nontrawl peak 2002-2006
0.0	9.0	3.5	4.2	-1	50	-4 # N CA nontrawl ascending width 1995-1999
0.0	9.0	4.8	4.2	-1	50	5 # N CA nontrawl ascending width 2000-2001
0.0	9.0	3.9	4.2	-1	50	5 # N CA nontrawl ascending width 2002-2006
-5.0	5.0	0.1	5	-1	50	5 # N CA nontrawl final 1995-1999
-5.0	5.0	-0.3	5	-1	50	5 # N CA nontrawl final 2000-2001
-5.0	5.0	-2.9	5	-1	50	5 # N CA nontrawl final 2002-2006

15	60	33	50	-1	50	4 # OR/WA nontrawl peak 2000-2001
15	60	58	50	-1	50	4 # OR/WA nontrawl peak 2002-2006
0.0	9.0	2.9	5.8	-1	50	5 # OR/WA nontrawl ascending width 2000-2001
0.0	9.0	5.2	5.8	-1	50	5 # OR/WA nontrawl ascending width 2002-2006
-5.0	5.0	-1.6	5	-1	50	5 # OR/WA nontrawl final 2000-2001
-5.0	5.0	4.8	5	-1	50	5 # OR/WA nontrawl final 2002-2006

20	60	31	50	-1	50	4 # S CA rec peak 2000-2001
20	60	30	50	-1	50	4 # S CA rec peak 2002-2006
0.0	9.0	4.0	4.0	-1	50	5 # S CA rec ascending width 2000-2001
0.0	9.0	3.1	4.0	-1	50	5 # S CA rec ascending width 2002-2006
-5.0	5.0	-4.5	5	-1	50	5 # S CA rec final 2000-2001
-5.0	5.0	-4.8	5	-1	50	5 # S CA rec final 2002-2006

20	60	30	50	-1	50	4 # OR/WA rec peak 2000-2006
0.0	9.0	3.2	3.2	-1	50	5 # OR/WA rec ascending width 2000-2006
-5.0	5.0	-3.6	5	-1	50	5 # OR/WA rec final 2000-2006

1 # Selex parm adjust method 1=do V1.23 approach, 2=use new logistic approach
0 # Tagging flag: 0=none,1=read parameters for tagging

### Likelihood related quantities ###
# variance/sample size adjustment by fleet
1 # Do variance adjustments 
#1   2    3     4     5    6    7    8    9    10   11   12   13    14    15   16   17   18   #
0.00 0.00 0.00  0.00  0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.50 0.50  0.93  0.00 0.00 0.50 0.00 # constant added to survey CV # Changed 13 from 0.02, 12 from 0.09, and 13 from 0.0 - all to 0.50
0.00 0.00 0.00  0.00  0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00  0.00  0.00 0.00 0.00 0.00 # constant added to discard SD
0.00 0.00 0.00  0.00  0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00  0.00  0.00 0.00 0.00 0.00 # constant added to body weight SD
0.90 1.00 1.00	1.00  0.82 1.00	1.00 0.88 0.82 0.90 0.73 1.00 1.00  1.00  1.00 1.00 1.00 1.00 # multiplicative scalar for length comps
1.00 0.98 1.00	1.00  1.00 1.00	1.00 1.00 1.00 1.00 0.36 1.00 1.00  1.00  1.00 1.00 0.90 1.00 # multiplicative scalar for agecomps
1.00 1.00 1.00	1.00  1.00 1.00	1.00 1.00 1.00 1.00 1.00 1.00 1.00  1.00  1.00 1.00 1.00 1.00 # multiplicative scalar for length at age obs

# removed for SSv3.20: 30   	# DF For discard T-distribution (discard_like)
# removed for SSv3.20: 30   	# DF For meanbodywt T-distribution (DF_for_meanbodywt_like)
1	# Max number of lambda phases: read this number of values for each component below
1	# SD offset (CPUE, discard, mean body weight, recruitment devs): 0=omit log(s) term, 1=include

16 # N changes to default Lambdas = 1.0
# Component codes:  
#  1=survey
#  2=discard
#  3=mean body weight
#  4=length frequency
#  5=age frequency
#  6=Weight frequency
#  7=size at age
#  8=catch
#  9=initial equilibrium catch
#  10=rec devs
#  11=parameter priors
#  12=parameter deviations
#  13=Crash penalty
#  14=Morph composition
#  15=Tag composition
#  16=Tag return
# Component fleet/survey  phase  value  wtfreq_method
 4 1 1 0.5 1 # Len data half fleet 1
 4 2 1 0.5 1 # Len data half fleet 2
 4 3 1 0.5 1 # Len data half fleet 3
 4 4 1 0.5 1 # Len data half fleet 4
 4 7 1 0.5 1 # Len data half fleet 7
 4 11 1 0.5 1 # Len data half fleet 11
 5 1 1 0.5 1 # Age data half fleet 1
 5 2 1 0.5 1 # Age data half fleet 2
 5 3 1 0.5 1 # Age data half fleet 3
 5 4 1 0.5 1 # Age data half fleet 4
 5 7 1 0.5 1 # Age data half fleet 7
 5 11 1 0.5 1 # Age data half fleet 11
 5 15 1 0.5 1 # Age data half fleet 15
 5 11 1 0.5 1 # Age data half fleet 11
 5 16 1 0 1 # Ghost age data zero fleet 16 NWFSC mirror
 5 18 1 0 1 # Ghost age data zero fleet 18 Triennial mirror

0 # extra SD

999 # end file marker
