#V3.24j-64bit
#_SS-V3.24j-64bit-safe;_11/14/2012;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.0
#_Start_time: Fri May 03 13:52:28 2013
#_Number_of_datafiles: 1

#_observed data: 
1892 #_styr
2012 #_endyr
1 #_nseas
 12 #_months/season
1 #_spawn_seas
1 #_Nfleet
2 #_Nsurveys
1 #_N_areas
FISHERY%Triennial%NWFSC
 0.5 0.5 0.5 #_surveytiming_in_season
 1 1 1 #_area_assignments_for_each_fishery_and_survey
 1 #_units of catch:  1=bio; 2=num
 0.01 #_se of log(catch) only used for init_eq_catch and for Fmethod 2 and 3; use -1 for discard only fleets
2 #_Ngenders
64 #_Nages
 0 #_init_equil_catch_for_each_fishery
121 #_N_lines_of_catch_to_read
#_catch_biomass(mtons):_columns_are_fisheries,year,season
 2.17992 1892 1
 2.17992 1893 1
 2.17992 1894 1
 0.560555 1895 1
 0.134944 1896 1
 0.137546 1897 1
 0.0778517 1898 1
 0.131678 1899 1
 0.185504 1900 1
 0.23932 1901 1
 0.293146 1902 1
 0.346972 1903 1
 0.400798 1904 1
 0.454614 1905 1
 0.50844 1906 1
 0.562266 1907 1
 0.616083 1908 1
 0.669908 1909 1
 0.723734 1910 1
 0.77756 1911 1
 0.831377 1912 1
 0.885203 1913 1
 0.939029 1914 1
 0.992855 1915 1
 3.0352 1916 1
 5.01343 1917 1
 10.2908 1918 1
 3.30777 1919 1
 4.11325 1920 1
 5.59221 1921 1
 4.55661 1922 1
 2.46793 1923 1
 4.33369 1924 1
 10.7927 1925 1
 10.7207 1926 1
 18.9751 1927 1
 17.7055 1928 1
 26.0266 1929 1
 36.919 1930 1
 41.9339 1931 1
 27.9235 1932 1
 25.9638 1933 1
 22.9144 1934 1
 34.893 1935 1
 40.0265 1936 1
 48.1827 1937 1
 55.2637 1938 1
 62.6985 1939 1
 140.316 1940 1
 188.619 1941 1
 341.398 1942 1
 1116.69 1943 1
 1936.51 1944 1
 3390.8 1945 1
 2201.01 1946 1
 1209 1947 1
 1076.04 1948 1
 951.841 1949 1
 961.393 1950 1
 855.028 1951 1
 1008.62 1952 1
 796.005 1953 1
 1147.37 1954 1
 975.55 1955 1
 1475.46 1956 1
 1610.52 1957 1
 1434.98 1958 1
 1588.92 1959 1
 1994.72 1960 1
 1963.13 1961 1
 2447.96 1962 1
 1900.84 1963 1
 1598.46 1964 1
 1573.93 1965 1
 4896.57 1966 1
 3016.48 1967 1
 3321.47 1968 1
 3821.11 1969 1
 2215.58 1970 1
 1674.71 1971 1
 2533.2 1972 1
 2347.89 1973 1
 1702.74 1974 1
 1428.23 1975 1
 4324.37 1976 1
 5087 1977 1
 8282.49 1978 1
 8047.55 1979 1
 7889.59 1980 1
 9298.11 1981 1
 9799.27 1982 1
 8931.04 1983 1
 5521.2 1984 1
 3769.61 1985 1
 5397.86 1986 1
 5268.11 1987 1
 6956.76 1988 1
 6181.38 1989 1
 5237.92 1990 1
 5285.16 1991 1
 8376.06 1992 1
 7708.45 1993 1
 7584.35 1994 1
 6857.31 1995 1
 8673.57 1996 1
 3151.1 1997 1
 4214.2 1998 1
 4816.41 1999 1
 5011.83 2000 1
 3387.2 2001 1
 2452.14 2002 1
 1490.02 2003 1
 1750.19 2004 1
 966.081 2005 1
 510.818 2006 1
 405.358 2007 1
 511.047 2008 1
 817.39 2009 1
 1026.61 2010 1
 1456.02 2011 1
 1646.36 2012 1

#
19 #_N_cpue_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_Fleet Units Errtype
1 1 0 # FISHERY
2 1 0 # Triennial
3 1 0 # NWFSC
#_year seas index obs err
 1980 1 2 8962.2 0.334859 # Triennial
 1983 1 2 13130.6 0.191636 # Triennial
 1986 1 2 9855.24 0.278644 # Triennial
 1989 1 2 6539.57 0.286905 # Triennial
 1992 1 2 8630.49 0.266746 # Triennial
 1995 1 2 2924.17 0.303716 # Triennial
 1998 1 2 21151.4 0.305318 # Triennial
 2001 1 2 5021.73 0.319567 # Triennial
 2004 1 2 17350.2 0.845518 # Triennial
#
# Original from the 2013 assessment
# 2003 1 3 21205.3 0.473755 # NWFSC
# 2004 1 3 19239.3 0.552662 # NWFSC
# 2005 1 3 23343.4 0.432208 # NWFSC
# 2006 1 3 9036.15 0.474466 # NWFSC
# 2007 1 3 16089 0.435602 # NWFSC
# 2008 1 3 14247 0.470159 # NWFSC
# 2009 1 3 7320.1 0.47381 # NWFSC
# 2010 1 3 37589.3 0.417057 # NWFSC
# 2011 1 3 25480.4 0.424339 # NWFSC
# 2012 1 3 14678 0.440904 # NWFSC
#
# Newly generated indices
#
# drop_half_IndexMedian				
2003	1	3	34282.51794	0.797565138
2004	1	3	22167.66968	0.732362125
2005	1	3	27209.49204	0.700786226
2006	1	3	14535.78217	0.813592485
2007	1	3	17304.92444	0.717097267
2008	1	3	18592.16776	0.668412619
2009	1	3	8700.853491	0.693361755
2010	1	3	53446.3186	0.692598178
2011	1	3	30197.29464	0.63286516
2012	1	3	18433.18051	0.810133565
#

0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal
#Fleet Disc_units err_type
0 #N discard obs
#_year seas index obs err
#
0 #_N_meanbodywt_obs
30 #_DF_for_meanbodywt_T-distribution_like

1 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
# no additional input for option 1
# read binwidth, minsize, lastbin size for option 2
# read N poplen bins, then vector of bin lower boundaries, for option 3

-1 #_comp_tail_compression
1e-007 #_add_to_comp
0 #_combine males into females at or below this bin number
33 #_N_LengthBins
 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66
0 #_N_Length_obs
#Yr Seas Flt/Svy Gender Part Nsamp datavector(female-male)

58 #_N_age_bins
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
0 #_N_ageerror_definitions
0 #_N_Agecomp_obs
1 #_Lbin_method: 1=poplenbins; 2=datalenbins; 3=lengths
0 #_combine males into females at or below this bin number
#Yr Seas Flt/Svy Gender Part Ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)

0 #_N_MeanSize-at-Age_obs
#Yr Seas Flt/Svy Gender Part Ageerr Ignore datavector(female-male)
#                                          samplesize(female-male)

0 #_N_environ_variables
0 #_N_environ_obs
0 # N sizefreq methods to read 

0 # no tag data 

0 # no morphcomp data 

999

ENDDATA
