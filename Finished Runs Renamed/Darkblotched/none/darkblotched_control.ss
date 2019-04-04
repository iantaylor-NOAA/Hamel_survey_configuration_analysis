# Darkblotched 2013 control file
#	April 12 2013

# Morph setup
1	# Number of growth patterns
1	# N sub morphs within growth patterns

3 # Blocks
1 10 1 #1: blocks in each design 
2011 2012   #1:	Retention inflection and slope, to reflect IFQ
2000 	2001 	2002 	2002	2003 	2003	2004 	2004	2005 2005	2006 	2006	2007	2007	2008	2008	2009	2009 	2010 	2010 	#2: TWL retention asymptote to fit changes in discard ratios
1995 2004 	#3: AKSHLF selectivity for later period

# Mortality and growth specifications
0.5		# Fraction female at birth 
0			# M setup: 0=single Par,1=N_breakpoints,2=Lorenzen,3=agespecific;_4=agespec_withseasinterpolate
      # no additional input for selected M Option; read 1P per morph
1     # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=notimplemented; 4=notimplemented
2			# Age for growth Lmin
30		# Age for growth Lmax or 999 = Linf
0			# SD constant added to LAA (0.1 mimics v1.xx for compatibility only) 
0 		# CV_Growth_Pattern: 0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A)
3			# Maturity option: 1=length logistic, 2=age logistic, 3=read age-maturity matrix by growth_pattern
0.001739756	0.005167382	0.015234516	0.043959551	0.119591027	0.282761575	0.521345184	0.727124058	0.838074814	0.883280433	0.899554999	0.905148746	0.90704054	0.907676833	0.90789045	0.907962122	0.907986163	0.907994227	0.907996932	0.907997839	0.907998143	0.907998245	0.90799828	0.907998291	0.907998295	0.907998296	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297	0.907998297
2			# First age allowed to mature, from Nickols 1990
1     # fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0     # hermaphroditism  option: 0=none; 1=age-specific  fxn
1			# parameter_offset_approach (1=none, 2= M,G,CV_G As offset from female-GP1, 3=like SS2 V1.x)
2     # env/block/dev_adjust_method   (1=standard; 2=logistic transform keeps in Base parm bounds; 3=standard w/ no bound check)

# Maturity & Growth Parameters
#_LO    HI      INIT        PRIOR     PR_type SD   PHASE   env-var use_dev devmnyr devmxyr devstd  Block   Block_Fxn
# female growth
#	0.02  0.15    0.07       -2.38    	 3    	0.302   2    0    		0    		0    		0    		0    		0    		0    	# Owen prior Natural Mortality
	0.01	0.15	  0.05	  		0.08			-1		  99	 	 -3		 0	      0				0				0				0				0				0			# NatM
	1		 	20		  14.5	  		14.6			-1		  99	 	  2		 0	      0				0				0				0				0				0			# L_at_Amin
	20		60			42.44	  		42.5			-1		  99	 	  2		 0	      0				0				0				0				0				0			# L_at_Amax
	0.05	0.3		  0.2					0.2				-1			99		 	2		 0				0				0				0				0				0				0			# VonBert_K
	0.05	0.3			0.1					0.2				-1			99			3		 0				0				0				0				0				0				0			# CV_young
	0.03	0.3			0.046		 		0.1				-1			99		 -3		 0				0				0				0				0				0				0			# CV_old
# male growth as direct estimates (parameter offset approach = 1)
#	0.02  0.15    0.07       -2.48     	 3     	0.416   2    0    		0    		0    		0    		0    		0   		0    	# M Natural Mortality
	0.01	0.15	  0.05	  		0.08			-1		  99		  3		 0	      0				0				0				0				0				0			# NatM
 -3			3				0						0					-1			99		 -3		 0				0				0				0				0				0				0			# L_at_Amin (set equal to females)
	20		60			42.44	  		42.5			-1		  99		  2		 0	      0				0				0				0				0				0			# L_at_Amax
	0.05	0.3			0.2					0.2				-1			99		 	2		 0				0				0				0				0				0				0			# VonBert_K
 -3			3				0						0					-1			99		 -3		 0				0				0				0				0				0				0			# CV_young
	0.03	0.3			0.046				0.1				-1			99		 -3		 0				0				0				0				0				0				0			# CV_old
# female weight and maturity
  0			1				1.11E-05 		1.11E-05	-1			99		 -3		 0				0				0				0				0				0				0			# Wtlen coeff # estimated from NWFSC shelf-slope survey data 2003-2010 
  2			4				3.13512			3.13512		-1			99		 -3		 0				0				0				0				0				0				0			# Wtlen Exp		# estimated from NWFSC shelf-slope survey data 2003-2010 
  0			60			34.59				55				-1			99		 -3		 0				0				0				0				0				0				0			# Mat50%_Fem	# from 2005 assessment, from Nickol 1990 
 -3			3			 -0.6429		 -0.6429		-1			99		 -3		 0				0				0				0				0				0				0			# Mat_slope		# from 2005 assessment, from Nickol 1990
 -3			150000	101100			101100		-1			99		 -3		 0				0				0				0				0				0				0			# eggs/kg intercept, from E.J.Dick 2009 
  0			50000		44800				44800			-1			99		 -3		 0				0				0				0				0				0				0			# eggs/kg slope, from E.J.Dick 2009 
# male weight as direct assignment
  0			1				1.21E-05 		1.21E-05	-1			99		 -3		 0				0				0				0				0				0				0			# Wtlen coeff	# estimated from NWFSC shelf-slope survey data 2003-2010 
  2			4				3.10958			3.10958		-1			99		 -3		 0				0				0				0				0				0				0			# Wtlen Exp		# estimated from NWFSC shelf-slope survey data 2003-2010 
# stuff that we don't need for this model
	0     2       1           1         -1    	99   	 -5    0        0       0       0       0       0       0   	# Recruitment apportionment by growth pattern  
	0     2       1           1         -1    	99   	 -5    0        0       0       0       0       0       0   	# Rec app by Area                              
	0     2       1           1         -1    	99   	 -5    0        0       0       0       0       0       0   	# Rec app by Season                          
	0     2       1           1         -1    	99   	 -5    0        0       0       0       0       0       0   	# Cohort growth deviation                      

#_seasonal_effects_on_biology_parms
	0     0       0       		0       	0       0     	0    0       	0       0       #_femwtlen1, femwtlen2, mat1, mat2, fec1, fec2, Malewtlen1, malewtlen2, L1, K

3 #Recruitment Function 1 BH w/flat top, 2 Ricker, 3 BH, 4 none
# Recruitment Parms
# Low		High	Init	Prior PrType	SD			phase
	5			12		8.2		8		 -1				99			1			# R0		
	0.2		1			0.779	0.779	2				0.152	 -2			# h		
	0			2			0.75	0.75	-1			99		 -1			# sigma R		
 -5			5			0			0			-1			99	 	 -3			# Env link coeff	
 -5			5			0			0			-1			99	 	 -3			# Init Equilb offset to virgin
 -1			1			0			0			-1			99		 -1			# placeholder for Autocorrelation

0 # index of environmental variable to be used
0 # env target parameter: 0=none, 1=rec devs, 2=R0, 3=steepness

# Recruitment residuals
2       # rec dev type: 0=none, 1=devvector (zero-sum), 2=simple deviations (no sum constraint)
1960	# Start year recruitment residuals
2011	# End year recruitment residuals
3	# Phase

1 		# Read 11 advanced recruitment options: 0=no, 1=yes
1870  # first year for early rec devs
3 		# phase for early rec devs
5			# Phase for forecast recruit deviations
1 		# Lambda for forecast recr devs before endyr+1
 1960.754 #_last_early_yr_nobias_adj_in_MPD                   
 1990.399 #_first_yr_fullbias_adj_in_MPD                      
 2008.982 #_last_yr_fullbias_adj_in_MPD                       
 2013.077 #_first_recent_yr_nobias_adj_in_MPD                 
    0.877 #_max_bias_adj_in_MPD (1.0 to mimic pre-2009 models)
0			# placeholder
-5		# Lower bound rec devs
5		# Upper bound rec devs
0     # read intitial values for rec devs

# Fishing mortality setup 
0.2 		# F ballpark for tuning early phases
-1999 	# F ballpark year
3       #       F_Method:       1=Pope; 2=instan.       F;      3=hybrid        (hybrid is      recommended)
4     	#       max     F       or      harvest rate,   depends on      F_Method
#       no      additional      F       input   needed  for     Fmethod 1
#       if      Fmethod=2;      read    overall start   F       value;  overall phase;  N       detailed        inputs  to      read
#       if      Fmethod=3;      read    N       iterations      for     tuning  for     Fmethod 3
4       #       N       iterations      for     tuning  F       in      hybrid  method  (recommend      3       to      7)

# Initial Fishing Mortality Parameters
#LO  		HI    INIT  		PRIOR PR_type 	SD   	PHASE
0       1       0       0.01    -1       99      -1      # InitF_1TWL
0       1       0       0.01    -1       99      -1      # InitF_2BYCATCH

# Catchability Specification (Q_setup)
# A=do power: 0=skip, survey is prop. to abundance, 1= add par for non-linearity
# B=env. link: 0=skip, 1= add par for env. effect on Q
# C=extra SD: 0=skip, 1= add par. for additive constant to input SE (in ln space)
# D=type: <0=mirror lower abs(#) fleet, 0=no par Q is median unbiased, 1=no par Q is mean unbiased, 2=estimate par for ln(Q)
# 	   3=ln(Q) + set of devs about ln(Q) for all years. 4=ln(Q) + set of devs about Q for indexyr-1
# A   		 B   			C   			D		
0          0        0         0 # 1 TWL
0          0        0         0 # 2 BYCATCH
0          0        1         4 # 3 AKSHLF
0          0        0         2 # 4 AKSLP
0          0        0         2 # 5 NWSLP
#0          0        1         2 # 6 NWCBO
#
1 #_If q has random component, Then 0=read one parm For each fleet With random  q; 1=read a parm For each Year of index
#_Q_parms(if_any)
# Lo  Hi  Init    Prior   Prior_type Prior_sd   Phase
0     1   0.4     0.1     -1         99         3       # Q_extraSD_5_AKSHLF 
#0     1   0.4     0.1     -1         99         3       # Q_extraSD_8_NWCBO      

# bnd	bnd 	value	mean	type	SD	phase Early period
-10	2	-0.0003	0	-1	99	 1 # AKSHLF (log) base parameter (1980)
-4	4	 0	    0	-1	99	-5 # AKSHLF 1983 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 1986 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 1989 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 1992 deviation
# Late period
-4	4	 0	    0	-1	99	 1 # AKSHLF 1995 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 1998 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 2001 deviation
-4	4	 0	    0	-1	99	-5 # AKSHLF 2004 deviation

# Other catchability parameters
-10	2	-0.0003	0	-1	99	 1 # AKSLP (log) base parameter 
-10	2	-0.0003	0	-1	99	 1 # NWSLP (log) base parameter 
#-10	2	-0.0003	0	-1	99	 1 # NWCBO (log) base parameter 

# Selectivity Specification
#_size_selex_types
#_Pattn Discard Male    Special
24      1       0       0       # 1 TWL
15      0       0       1       # 2 BYCATCH
24      0       0       0       # 3 AKSHLF
24      0       0       0       # 4 AKSLP
24      0       0       0       # 5 NWSLP
#24      0       0       0       # 6 NWCBO
#_age_selex_types
#_Pattn Discard Male    Special
11      0       0       0       # 1 TWL         
11      0       0       0       # 2 BYCATCH  
11      0       0       0       # 3 AKSHLF      
11      0       0       0       # 4 AKSLP       
11      0       0       0       # 5 NWSLP       
#11      0       0       0       # 6 NWCBO       

# Length-based selectivity, retention and discard mortality section
#TWL
#Low	High	Init	Prior	PrType	SD	Phase	env	usedev	minyr	maxyear	sd	block	blswitch
 20		45		36		32		-1				99		 2			0				0				0				0				0				0				0						# PEAK
-6		4			2			0			-1				99		-3			0				0				0				0				0				0				0						# TOP:_width_of_plateau         
-1		9			4			4			-1				99		 2			0				0				0				0				0				0				0						# Asc_width                     										
-1		9			0.6		5.5		-1				99		-3			0				0				0				0				0				0				0						# Desc_width                    										
-999	9	 -999		 -2			-1				99		-2			0				0				0				0				0				0				0						# INIT:_selectivity_at_fist_bin 										
-5		9		  9		  5			-1				99		-3			0				0				0				0				0				0				0						# FINAL:_selectivity_at_last_bin										
#TWL retention			                                  			    		                      	      	      	  					
#_LO  HI    INIT  PRIOR PR_type SD   PHASE   env-var use_dev dev_min dev_max dev_std Block   Block_Fxn
15		70		27		35		-1				99		 2			0				0				0				0				0				1				2						#Inflection               
0.1		10		2			1			-1				99		 2			0				0				0				0				0				1				2						#Slope                    # 1 means that parm� = baseparm + blockparm
0.001	1			1			1			-1				99		-3			0				0				0				0				0				2				2						#Asymptotic retention     # 2 means that parm� = blockparm
0			0			0			0			-1				99		-3			0				0				0				0				0				0				0	          #Male offset To inflection
#AKSHLF
#_LO  HI    INIT  PRIOR PR_type SD   PHASE   env-var use_dev dev_min dev_max dev_std Block   Block_Fxn
10		45		21		23		-1				99	 	2				0				0				0				0				0				0				0						# PEAK                            
-6		4		 -6		 -1			-1				99	 -2				0				0				0				0				0				0				0						# TOP:_width_of_plateau           
-1		9			4			4			-1				99	 	3				0				0				0				0				0				0				0						# Asc_width                     											
-1		9			4			6			-1				99	 	4				0				0				0				0				0				3				2						# Desc_width                    											
-999	9		 -999	-4			-1				99	 -2				0				0				0				0				0				0				0						# INIT:_selectivity_at_fist_bin 											
-999	9		 -999	 -1			-1				99	 -3				0				0				0				0				0				0				0 					# FINAL:_selectivity_at_last_bin	
#AKSLP
#_LO  HI    INIT  PRIOR PR_type SD   PHASE   env-var use_dev dev_min dev_max dev_std Block   Block_Fxn
 10		45		23		28		-1				99		2				0				0				0				0				0				0				0						# PEAK                            
-6		4		 -1		 -1			-1				99		2				0				0				0				0				0				0				0						# TOP:_width_of_plateau           
-1		9			2			4			-1				99		3				0				0				0				0				0				0				0						# Asc_width                     											
-1		9			2			4			-1				99		3				0				0				0				0				0				0				0						# Desc_width                    											
-999	9		 -999	 -4			-1				99	 -4				0				0				0				0				0				0				0						# INIT:_selectivity_at_fist_bin 											
-999	9		 -999	 -2			-1				99	 -3				0				0				0				0				0				0				0 					# FINAL:_selectivity_at_last_bin	
#NWSLP
#_LO  HI    INIT  PRIOR PR_type SD   PHASE   env-var use_dev dev_min dev_max dev_std Block   Block_Fxn
10		45		25		28		-1				99		2				0				0				0				0				0				0				0						# PEAK                          	
-6		4		 -6			1			-1				99	 -5				0				0				0				0				0				0				0						# TOP:_width_of_plateau         	
-1		9			3			4			-1				99		4				0				0				0				0				0				0				0						# Asc_width                     											
-1		9			.1		4			-1				99	  4				0				0				0				0				0				0				0						# Desc_width                    											
-999	9		 -999	 -4			-1				99	 -5				0				0				0				0				0				0				0						# INIT:_selectivity_at_fist_bin 											
-999	9		 -999		1			-1				99	 -4				0				0				0				0				0				0				0 					# FINAL:_selectivity_at_last_bin
##NWCBO
##_LO  HI    INIT  PRIOR PR_type SD   PHASE   env-var use_dev dev_min dev_max dev_std Block   Block_Fxn
# 8		45		18		20		-1				99		2				0				0				0				0				0				0				0						# PEAK                          	
#-6		4		 -6	 	 -1			-1				99	 -3				0				0				0				0				0				0				0						# TOP:_width_of_plateau         	
#-1		9		 -0.5		2			-1				99	  3				0				0				0				0				0				0				0						# Asc_width                     											
#-1		9			3			4			-1				99		4				0				0				0				0				0				0				0						# Desc_width                    											
#-999	9		 -999	 -3			-1				99	 -4				0				0				0				0				0				0				0						# INIT:_selectivity_at_fist_bin 											
#-999	9		 -999	 -4			-1				99	 -3				0				0				0				0				0				0				0 					# FINAL:_selectivity_at_last_bin	

# age sel: select all ages following user manual instructions:
# "If it is desired that age 0 fish be selected, then use pattern #11 and set the minimum age to 0.1"
# all ages selected for fleets 1 & 2
0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected
0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected
0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected
0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected
0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected
#0       1       0.1     0.1     -1       99     -3       0       0       0       0       0.5     0       0  # Min age selected
#0       100     100     100     -1       99     -3       0       0       0       0       0.5     0       0  # Max age selected

1	# Selex block setup: 0=Read one line apply all, 1=read one line each parameter

# Lo	Hi	Init	Prior	P_type	SD	Phase
#TWL retention inflection and slope, to reflect changes with IFQ
15		70		27		35		-1		99	 	2		#Inflection               
0.1		10		2			1			-1		99	 	2		#Slope  
#TWL Retention asymptote, to fit discard ratio
0 	 	1  	0.6   0.6  		-1  	99  	3
0 	 	1  	0.44  0.44  	-1  	99  	3
0 	 	1  	0.4   0.4  		-1  	99  	3
0 	 	1  	0.84  0.84   	-1  	99  	3
0 	 	1  	0.78  0.78  	-1  	99  	3
0 	 	1  	0.51  0.51  	-1  	99  	3
0 	 	1  	0.51  0.51  	-1  	99  	3
0 	 	1  	0.47  0.47  	-1  	99  	3
0 	 	1  	0.46  0.46   	-1  	99  	3
0 	 	1  	0.52  0.52   	-1  	99  	3
#AKSHLF selectivity parameters 1995-2004
-1		9		 5		 5		-1			99		4		# Desc_width                    										

1 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds)
0 # Tagging flag: 0=none,1=read parameters for tagging

### Likelihood related quantities ###
# variance/sample size adjustment by fleet
1 # Do variance adjustments
0 		 		0 0					0 				0	 				#0  				# const added to survey CV
0  		 		0	0  				0  				0  				#0   			# const added to discard sd
0  		 		0 0	 				0  				0  				#0   			# const added to body weight sd
0.1670494	1	0.2639248	0.5042809	0.4347276	#0.276025	# mult scalar for length comps
0.2675704	1	0.1684169	0.1924211	0.1440778	#0.1182449	# mult scalar for age comps
1  		 		1	1  				1  				1  				#1   			# mult scalar for length at age obs

2 # Max N lambda phases: read this N values for each item below
1	# SD offset (CPUE, discard, mean body weight, recruitment devs): 0=omit log(s) term, 1=include

2 # N changes to default Lambdas = 1.0
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
	4 				1 						1 			0.5 	1  					#TWL length comps
	5 				1 						1 			0.5 	1  					#TWL age comps

0 # extra SD pointer

999 # end of control file