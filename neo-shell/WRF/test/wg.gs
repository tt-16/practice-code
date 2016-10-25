'open /wrf/LIBRARIES/RESULT/wangfu/20150716/test.ctl'
'set gxout print'
filename = "out.txt"
rc = write(filename, "")
rc = write(filename,"lon_lat:Huangh_117.57530100_38.58906018;Huangh_117.57530100_38.58906018;wangf_117.59937060_38.56585363;Center_114.2384891_41.12783249")
rc = write(filename,"PointNum:4")

*================================================================================*
*point#1*
'set lon 117.57530100'
'set lat 38.58906018'
'set t 5 293'

*  10m风速 *
'set lev 2'
'd u'
rc = write(filename, "variable:u:10:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:10:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:10:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:10:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:10:#1")
rc = write(filename, result)

*  30m风速 *
'set lev 4'
'd u'
rc = write(filename, "variable:u:30:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:30:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:30:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:30:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:30:#1")
rc = write(filename, result)

*  50m风速 *
'set lev 6'
'd u'
rc = write(filename, "variable:u:50:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:50:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:50:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:50:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:50:#1")
rc = write(filename, result)

*  70m风速 *
'set lev 8'
'd u'
rc = write(filename, "variable:u:70:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:70:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:70:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:70:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:70:#1")
rc = write(filename, result)

*  90m风速 *
'set lev 9'
'd u'
rc = write(filename, "variable:u:90:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:90:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:90:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:90:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:90:#1")
rc = write(filename, result)

'set lev 1'
*降雨量*
'd rainc+rainnc'
rc = write(filename, "variable:precipitation:10:#1")
rc = write(filename, result)

*=================================================================================*

*point#2*
'set lon 117.57530100'
'set lat 38.58906018'
'set t 5 293'

*  10m风速 *
'set lev 2'
'd u'
rc = write(filename, "variable:u:10:#2")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:10:#2")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:10:#2")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:10:#2")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:10:#2")
rc = write(filename, result)

*  30m风速 *
'set lev 4'
'd u'
rc = write(filename, "variable:u:30:#2")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:30:#2")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:30:#2")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:30:#2")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:30:#2")
rc = write(filename, result)

*  50m风速 *
'set lev 6'
'd u'
rc = write(filename, "variable:u:50:#2")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:50:#2")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:50:#2")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:50:#2")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:50:#2")
rc = write(filename, result)

*  70m风速 *
'set lev 8'
'd u'
rc = write(filename, "variable:u:70:#2")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:70:#2")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:70:#2")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:70:#2")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:70:#2")
rc = write(filename, result)

*  90m风速 *
'set lev 9'
'd u'
rc = write(filename, "variable:u:90:#2")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:90:#2")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:90:#2")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:90:#2")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:90:#2")
rc = write(filename, result)

'set lev 1'
*降雨量*
'd rainc+rainnc'
rc = write(filename, "variable:precipitation:10:#2")
rc = write(filename, result)

*=================================================================================*

*point#1*
'set lon 117.59937060'
'set lat 38.56585363'
'set t 5 293'

*  10m风速 *
'set lev 2'
'd u'
rc = write(filename, "variable:u:10:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:10:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:10:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:10:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:10:#1")
rc = write(filename, result)

*  30m风速 *
'set lev 4'
'd u'
rc = write(filename, "variable:u:30:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:30:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:30:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:30:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:30:#1")
rc = write(filename, result)

*  50m风速 *
'set lev 6'
'd u'
rc = write(filename, "variable:u:50:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:50:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:50:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:50:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:50:#1")
rc = write(filename, result)

*  70m风速 *
'set lev 8'
'd u'
rc = write(filename, "variable:u:70:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:70:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:70:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:70:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:70:#1")
rc = write(filename, result)

*  90m风速 *
'set lev 9'
'd u'
rc = write(filename, "variable:u:90:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:90:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:90:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:90:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:90:#1")
rc = write(filename, result)

'set lev 1'
*降雨量*
'd rainc+rainnc'
rc = write(filename, "variable:precipitation:10:#1")
rc = write(filename, result)

*=================================================================================*

*point#1*
'set lon 114.2384891'
'set lat 41.12783249'
'set t 5 293'

*  10m风速 *
'set lev 2'
'd u'
rc = write(filename, "variable:u:10:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:10:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:10:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:10:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:10:#1")
rc = write(filename, result)

*  30m风速 *
'set lev 4'
'd u'
rc = write(filename, "variable:u:30:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:30:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:30:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:30:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:30:#1")
rc = write(filename, result)

*  50m风速 *
'set lev 6'
'd u'
rc = write(filename, "variable:u:50:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:50:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:50:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:50:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:50:#1")
rc = write(filename, result)

*  70m风速 *
'set lev 8'
'd u'
rc = write(filename, "variable:u:70:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:70:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:70:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:70:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:70:#1")
rc = write(filename, result)

*  90m风速 *
'set lev 9'
'd u'
rc = write(filename, "variable:u:90:#1")
rc = write(filename, result)

'd v'
rc = write(filename, "variable:v:90:#1")
rc = write(filename, result)

'd tc'
rc = write(filename, "variable:temperature:90:#1")
rc = write(filename, result)

'd rh'
rc = write(filename, "variable:Humidity:90:#1")
rc = write(filename, result)

'd pressure'
rc = write(filename, "variable:pressure:90:#1")
rc = write(filename, result)

'set lev 1'
*降雨量*
'd rainc+rainnc'
rc = write(filename, "variable:precipitation:10:#1")
rc = write(filename, result)

*=================================================================================*

res = close(filename)
'quit'
