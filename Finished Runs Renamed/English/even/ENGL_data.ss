# Data-mod 2013: ENGLISH SOLE
########################################

### Global model specifications ###
1876	# Start year
2012	# End year
1   	# Number of seasons/year
12 	# Number of months/season
1	# Spawning occurs at beginning of season
1	# Number of fishing fleets
3	# Number of surveys
1	# Number of areas
FISHERY%SURVEY1%SURVEY2%SURVEY3
0.5417 0.5417 0.5417 0.5417 #fleet timing_in_season
1 1 1 1 # Area of each fleet
1 	# Units for catch by fishing fleet: 1=Biomass(mt),2=Numbers(1000s)
0.01  	# SE of log(catch) by fleet for equilibrium and continuous options
2 	# Number of genders
30 	# Number of ages in population dynamics

### Catch section ###
0  # Initial equilibrium catch (landings + discard) by fishing fleet
137 # Number of lines of catch
# Catch Year Season
1	1876	1
1	1877	1
1	1878	1
2	1879	1
2	1880	1
2	1881	1
3	1882	1
5	1883	1
5	1884	1
6	1885	1
7	1886	1
8	1887	1
10	1888	1
13	1889	1
15	1890	1
17	1891	1
21	1892	1
25	1893	1
31	1894	1
37	1895	1
43	1896	1
53	1897	1
63	1898	1
75	1899	1
90	1900	1
109	1901	1
130	1902	1
157	1903	1
189	1904	1
226	1905	1
271	1906	1
326	1907	1
391	1908	1
469	1909	1
564	1910	1
677	1911	1
813	1912	1
977	1913	1
1173	1914	1
1409	1915	1
2826	1916	1
3865	1917	1
3132	1918	1
2475	1919	1
1715	1920	1
2184	1921	1
3159	1922	1
3186	1923	1
4110	1924	1
4018	1925	1
3865	1926	1
4690	1927	1
4143	1928	1
4811	1929	1
3732	1930	1
1928	1931	1
3540	1932	1
3346	1933	1
2845	1934	1
3226	1935	1
3404	1936	1
3159	1937	1
2543	1938	1
2991	1939	1
3038	1940	1
2202	1941	1
2064	1942	1
3638	1943	1
2141	1944	1
1887	1945	1
4998	1946	1
3334	1947	1
6030	1948	1
3546	1949	1
5673	1950	1
4189	1951	1
3824	1952	1
2911	1953	1
2623	1954	1
2829	1955	1
3787	1956	1
4436	1957	1
5520	1958	1
5427	1959	1
4338	1960	1
4188	1961	1
4496	1962	1
4489	1963	1
4742	1964	1
5043	1965	1
5522	1966	1
5192	1967	1
5468	1968	1
3788	1969	1
3102	1970	1
2851	1971	1
3300	1972	1
3773	1973	1
3858	1974	1
4579	1975	1
5755	1976	1
3735	1977	1
4511	1978	1
4710	1979	1
4143	1980	1
3780	1981	1
3833	1982	1
3091	1983	1
2458	1984	1
2955	1985	1
3153	1986	1
3979	1987	1
3422	1988	1
3780	1989	1
2907	1990	1
3339	1991	1
2556	1992	1
2534	1993	1
1818	1994	1
1762	1995	1
1540	1996	1
1911	1997	1
1441	1998	1
1245	1999	1
1061	2000	1
1363	2001	1
1683	2002	1
1125	2003	1
1218	2004	1
1115	2005	1
1078	2006	1
789.4	2007	1
420.1	2008	1
415.5	2009	1
258.1	2010	1
198.1	2011	1
216.1	2012	1

14 # Number of index observations
# Units: 0=numbers,1=biomass,2=F; Errortype: -1=normal,0=lognormal,>0=T
# Fleet Units Errortype
1 1 0 # fleet 1: FISHERY
2 1 0 # fleet 2: SURVEY
3 1 0 # fleet 2: SURVEY
4 1 0 # fleet 2: SURVEY
#_year seas index obs se(log)
1980	1	2	5068.04	0.191990701	#Tri early
1983	1	2	11352.60	0.157586493	
1986	1	2	14077.63	0.136826903	
1989	1	2	13993.23	0.118986159	
1992	1	2	12412.52	0.144787134	
1995	1	3	15671.87	0.139753547	#Tri late
1998	1	3	20768.12	0.118109976	
2001	1	3	26072.37	0.123467305	
2004	1	3	44845.17	0.128683219	
2004	1	4	55079810.36	0.164037799
2006	1	4	24579264.35	0.161858748
2008	1	4	18718668.42	0.153094107
2010	1	4	21274752.39	0.150102455
2012	1	4	27024282.45	0.161539704

0 #_N_fleets_with_discard
0 #_N_discard_obs

0 #_N_meanbodywt_obs
30 #_DF_meanwt

## Population size structure
1 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
# binwidth for population size comp
# minimum size in the population (lower edge of first bin and size at age 0.00)
# maximum size in the population (lower edge of last bin)

-1 #_comp_tail_compression
1e-007 #_add_to_comp
0 #_combine males into females at or below this bin number

23 #_N_LengthBins
2	4	6	8	10	12	14	16	18	20	22	24	26	28	30	32	34	36	38	40	42	44	46
0 #_N_Length_obs
#Yr Seas Flt/Svy Gender Part Nsamp datavector(female-male)

27 #_N_age_bins
1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22  23  24  25  26  27
0 #_N_ageerror_definitions

0 #_N_Agecomp_obs
1 #_Lbin_method: 1=poplenbins; 2=datalenbins; 3=lengths
0 #_combine males into females at or below this bin number

0 #_N_MeanSize-at-Age_obs
0 #_N_environ_variables
0 #_N_environ_obs
0 # N sizefreq methods to read 
0 # no tag data 
0 # no morphcomp data 

999 # End data file

