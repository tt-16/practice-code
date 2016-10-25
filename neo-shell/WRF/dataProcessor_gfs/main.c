#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <time.h>
#include <string.h>


//#define VALUE_MAX_SIZE 273
//#define VALUE_MAX_SIZE 289
//#define VALUE_MAX_SIZE 193 
#define VALUE_MAX_SIZE 97 
#define FORECAST_POINT_PER_WINDFARM_MAX 20	
#define WINDFARM_IN_CP_MAX 50
#define	LON_LAT_ALL_MAX 2048
#define FORCAST_POINT_TOTAL 100		//TOTAL MAX = define FORECAST_POINT_PER_WINDFARM_MAX * WINDFARM_IN_CP_MAX


struct WindFarmInfo
{
	char szWFName[128];
	char szWFLonLat[512];
	int pointNumArr[FORECAST_POINT_PER_WINDFARM_MAX];
	int pointTotal;

};

struct ResultSet
{
	int windfarmTotal;
	struct WindFarmInfo wfInfo[WINDFARM_IN_CP_MAX];
};

struct DataProcessParameter
{
	int pointNum;
	int wfTotal;
	char szLonLat[LON_LAT_ALL_MAX];
};

struct WeatherDataSet
{
	char times[VALUE_MAX_SIZE];
	double direction10[VALUE_MAX_SIZE];
	double speed10[VALUE_MAX_SIZE];
	double direction30[VALUE_MAX_SIZE];
	double speed30[VALUE_MAX_SIZE];
	double direction50[VALUE_MAX_SIZE];
	double speed50[VALUE_MAX_SIZE];
	double direction70[VALUE_MAX_SIZE];
	double speed70[VALUE_MAX_SIZE];
	double direction90[VALUE_MAX_SIZE];
	double speed90[VALUE_MAX_SIZE];
	
	double u10[VALUE_MAX_SIZE];
	double u30[VALUE_MAX_SIZE];
	double u50[VALUE_MAX_SIZE];
	double u70[VALUE_MAX_SIZE];
	double u90[VALUE_MAX_SIZE];

	double v10[VALUE_MAX_SIZE];
	double v30[VALUE_MAX_SIZE]; 
	double v50[VALUE_MAX_SIZE]; 
	double v70[VALUE_MAX_SIZE];
	double v90[VALUE_MAX_SIZE];
	
	double temperature10[VALUE_MAX_SIZE];
	double temperature30[VALUE_MAX_SIZE];
	double temperature50[VALUE_MAX_SIZE];
	double temperature70[VALUE_MAX_SIZE];
	double temperature90[VALUE_MAX_SIZE];
	
	double Humidity10[VALUE_MAX_SIZE];
	double Humidity30[VALUE_MAX_SIZE];
	double Humidity50[VALUE_MAX_SIZE];
	double Humidity70[VALUE_MAX_SIZE];
	double Humidity90[VALUE_MAX_SIZE];
	
	double pressure10[VALUE_MAX_SIZE];
	double pressure30[VALUE_MAX_SIZE];
	double pressure50[VALUE_MAX_SIZE];
	double pressure70[VALUE_MAX_SIZE];
	double pressure90[VALUE_MAX_SIZE];
	
	double precipitation[VALUE_MAX_SIZE];
	
	
 };
 
 
void getDate(char *dstr, char *format)
{
	time_t  timep;
	struct tm *s_tm;
	int i, hour, minute, second;

	time(&timep);
	timep = timep+8*3600;
	s_tm = gmtime(&timep);
//	hour = m_time->tm_hour+8;
//	minute = tm_time->tm_min; 
	//printf("getDate is %d-%02d-%02d_%02d:%02d:%02d \n\n",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour,s_tm->tm_min,s_tm->tm_sec);
	if( dstr != NULL )
	{
		if( strcmp(format,"%Y-%m-%d")==0 )
		{
		sprintf(dstr,"%02d-%02d-%02d",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday);
		}

		if( strcmp(format,"%Y-%m-%d_%H:%M:%S")==0 )
		{
		sprintf(dstr,"%d-%02d-%02d_%02d:%02d:%02d",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour,s_tm->tm_min,s_tm->tm_sec);
		}
		
		if( strcmp(format,"%Y%m%d_%H:%M:%S")==0 )
		{
		sprintf(dstr,"%d%02d%02d_%02d:%02d:%02d",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour,s_tm->tm_min,s_tm->tm_sec);
		}
		
		if( strcmp(format,"%Y%m%d")==0 )
		{
		sprintf(dstr,"%d%02d%02d",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday);
		}

		if( strcmp(format,"%Y%m%d%H%M%S")==0 )
		{
		sprintf(dstr,"%d%02d%02d%02d%02d%02d",1900+s_tm->tm_year,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour,s_tm->tm_min,s_tm->tm_sec);
		}
		
		
	}
}


void getWindFarmStr(char *windFarmStr, char *windFarmName)
{
	if( strcmp(windFarmName,"huanghua") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_HHNPH");
	}
	else if( strcmp(windFarmName,"wangfu") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_wffd");
	}
	else if( strcmp(windFarmName,"manjing") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_MANJ");
	}
	else if( strcmp(windFarmName,"fuyu") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_fyfc");
	}
	else if( strcmp(windFarmName,"lumingshan") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_lms");
	}
	else if( strcmp(windFarmName,"yongfa") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_yongf");
	}
	else if( strcmp(windFarmName,"jiaxin") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_jiax");
	}
	else if( strcmp(windFarmName,"hengtai") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_hengt");
	}
	else if( strcmp(windFarmName,"bingfeng") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_bfcc");
	}
	else if( strcmp(windFarmName,"shenlong") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_SLYL");
	}
	else if( strcmp(windFarmName,"kangbao") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_kangb");
	}
	else if( strcmp(windFarmName,"jishan") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_jis");
	}
	else if( strcmp(windFarmName,"taobei") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_TAOB");
	}
	else if( strcmp(windFarmName,"beizheng") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_BEIZ");
	}
	else if( strcmp(windFarmName,"qianan") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_QIANA");
	}
	else if( strcmp(windFarmName,"heiyupao") == 0 )
	{
		strcpy(windFarmStr,"ECMWF_HYP");
	}
}
 
void getRelativeDate(char *outDate, char *format, const char *date, long  vector)
{
	time_t timep,timepNew;
	struct tm *s_tm;
	int i, year, mon, mday, hour, min, sec;
	char szDate[64], szTime[64], *tmpp, szTempDate[64];
	
	if( date!=NULL )
		strcpy(szTempDate,date);
	//Init tm
	time(&timep);
	s_tm = gmtime(&timep);
	
	//Get tm
	//Date = "2015-05-15_23:00:00"
	
	tmpp = strtok(szTempDate,"_");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	strcpy(szDate,tmpp);
	
	tmpp = strtok(NULL,"_");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	strcpy(szTime,tmpp);
	//printf("szDate is %s   |   szTime is %s \n",szDate,szTime);
	
	//GET Year
	tmpp = strtok(szDate,"-");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	year = atoi(tmpp);
	
	//GET Mon
	tmpp = strtok(NULL,"-");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	mon = atoi(tmpp);
	
	//GET MDay
	tmpp = strtok(NULL,"-");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	mday = atoi(tmpp);
	
	//GET Hour
	tmpp = strtok(szTime,":");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	hour = atoi(tmpp);
	
	//GET Min
	tmpp = strtok(NULL,":");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	min = atoi(tmpp);
	 
	//GET Sec
	tmpp = strtok(NULL,":");
	if( tmpp== NULL)
	{
		printf("strtok fault, const char *Date error");    		return;
	}	
	sec = atoi(tmpp);
	
	//update tm
	
	//printf("current date is %d-%d-%d_%d:%d:%d\n",s_tm->tm_year+1900,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour+8,s_tm->tm_min,s_tm->tm_sec);
	s_tm->tm_hour = hour;
	s_tm->tm_year = year-1900;
	s_tm->tm_mon  = mon-1;
	s_tm->tm_mday = mday;
	s_tm->tm_min  = min;
	s_tm->tm_sec  = sec; 
	
	//printf("current date is %d-%d-%d_%d:%d:%d\n",s_tm->tm_year+1900,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour+8,s_tm->tm_min,s_tm->tm_sec);
	//tm to s
	timep = mktime(s_tm);
	
	//update s
	timepNew = timep + vector +8*3600;
	//printf("timep=%d vector=%d\n",timep,vector);
	
	//s to tm
	s_tm = gmtime(&timepNew);
	if( outDate!=NULL )
	{
		sprintf(outDate,"%d-%02d-%02d_%02d:%02d:%02d",s_tm->tm_year+1900,s_tm->tm_mon+1,s_tm->tm_mday,s_tm->tm_hour,s_tm->tm_min,s_tm->tm_sec);
		//printf("current date is %s\n",outDate);
	}
	
}

int strcpn(const char *s, const char *accept)
{
	int len, subLen, count=0; 
	const char *p,*psub;
	
	len = strlen(s);   
	subLen = strlen(accept);   
	//printf("s is %s\n len is %d\n accept is %s\n sublen is %d\n",s,len,accept,subLen);
	p = s;
	psub = accept;
	
	int i,j;
    for(i=0; *p!='\0'; i++,p++)
    {
		for(j=0; j<subLen; j++)
		{
			if(*p == *psub)
			{
				p++;
				psub++;
				
				if( j == subLen-1 )
					count++;
			}
			else
			{
				p = p-j;
				psub = accept;
			}
		}
	//	printf("current p is %c\n",*p);
	}
    return count;
}

void getGsData(char *infile, struct WeatherDataSet *array, struct DataProcessParameter *param, int maxSize)
{
	//open file
	char inputFile[128];
	strcpy(inputFile,infile);
	//printf("input file is :%s\n",infile);
	fflush(stdout);
	FILE *fpin;
	fpin = fopen(inputFile,"r+");
	if ( fpin == NULL )
	{
		printf("fopen %s failed\n",infile);
		return;
	}
	
	
	//input data
	char buf[LON_LAT_ALL_MAX]={0}, variable[64]={0}, szLonLat[LON_LAT_ALL_MAX]={0};
	int bReadEnable = 0;
	int meter = 0;
	int point = 1;
	int arri = 0;
	char *result = NULL;
	int i=0;
	int lineNum = 1;
	while( fgets(buf,LON_LAT_ALL_MAX,fpin)!=NULL )
	{
		//printf("DEBUG INFO is %s\n",buf);
		if( strstr(buf,"PointNum:") != NULL )
		{
			result = strtok(buf,":");
			result = strtok(NULL,":");
			if( result != NULL )
				param->pointNum = atoi(result);
			continue;
		}
		else if( strstr(buf,"lon-lat:") != NULL )
		{
			result = strtok(buf,":");
			result = strtok(NULL,":");
			if( result != NULL )
				strcpy(param->szLonLat,result);
			if(param->szLonLat[strlen(param->szLonLat)-1] == '\n')
			{
				param->szLonLat[strlen(param->szLonLat)-1]= '\0';
			}

			//printf("szLonLat is %s\n",param->szLonLat);
			continue;
		}
		else if( strstr(buf,"variable:") != NULL )
		{
			i++;
			result = strtok(buf,":");
			//printf("result is %s\n",result);

			result = strtok(NULL,":");
			strcpy(variable,result);
			//printf("variable is %s \n",variable);

			result = strtok(NULL,":");
			if( result != NULL )
				meter = atoi(result);
			//printf("meter is %d \n",meter);

			result = strtok(NULL,":");
			if( result != NULL )
			{
				//if( strcmp(result,"#1")== 0 )
				//	point = 1;
				//	
				//if( strcmp(result,"#2")== 0 )
				//	point = 2;

				result = result + 1;
				point = atoi(result);
				//printf("point is  %d \n",point);
			}

			continue;
		}
		else if( strstr(buf,"Printing Grid") != NULL )
		{
			arri = 0;
			bReadEnable = 1;
			//printf("%Printing Grid \n"); 
			continue;	
		}
		else if( buf[0]=='\n' )
		{
			//printf("arri length is %d\n",arri);
			arri = 0;
			bReadEnable = 0;
			//printf("%3d bReadEnable is %d \n",lineNum,bReadEnable);
			continue;
		}

		if(bReadEnable)
		{
			//printf("%s:%d:%d \n",variable,meter,point);
			if(variable[strlen(variable)-1] == '\n')
			{
				variable[strlen(variable)-1]= '\0';
			}

			if( strcmp(variable,"u") == 0 )
			{
				if ( meter==10 )
				{
					//printf("u10 point is %d \n",point);
					array[point-1].u10[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].u10[arri]);
					arri++;
				}
				if ( meter==30 )
				{
					array[point-1].u30[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].u30[arri]);
					arri++;
				}
				if ( meter==50 )
				{
					array[point-1].u50[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].u50[arri]);
					arri++;
				}
				if ( meter==70 )
				{
					array[point-1].u70[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].u70[arri]);
					arri++;
				}
				if ( meter==90 )
				{
					array[point-1].u90[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].u90[arri]);
					arri++;
				}
			}
			else if( strcmp(variable,"v") == 0 )
			{
				if ( meter==10 )
				{
					array[point-1].v10[arri] = strtod(buf,NULL);
					//printf("%lf \n",array[point-1].v10[arri]);
					arri++;
				}
				if ( meter==30 )
				{
					array[point-1].v30[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].v30[arri]);
					arri++;
				}
				if ( meter==50 )
				{
					array[point-1].v50[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].v50[arri]);
					arri++;
				}
				if ( meter==70 )
				{
					array[point-1].v70[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].v70[arri]);
					arri++;
				}
				if ( meter==90 )
				{
					array[point-1].v90[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].v90[arri]);
					arri++;
				}
			}
			else if( strcmp(variable,"temperature") == 0 )
			{
				if ( meter==10 )
				{
					array[point-1].temperature10[arri] = strtod(buf,NULL);
					//printf("%lf \n",array[point-1].temperature10[arri]);
					arri++;
				}
				if ( meter==30 )
				{
					array[point-1].temperature30[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].temperature30[arri]);
					arri++;
				}
				if ( meter==50 )
				{
					array[point-1].temperature50[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].temperature50[arri]);
					arri++;
				}
				if ( meter==70 )
				{
					array[point-1].temperature70[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].temperature70[arri]);
					arri++;
				}
				if ( meter==90 )
				{
					array[point-1].temperature90[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].temperature90[arri]);
					arri++;
				}
			}  
			else if( strcmp(variable,"Humidity") == 0 )
			{
				if ( meter==10 )
				{
					array[point-1].Humidity10[arri] = strtod(buf,NULL);
					//printf("%lf \n",array[point-1].Humidity10[arri]);
					arri++;
				}
				if ( meter==30 )
				{
					array[point-1].Humidity30[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].Humidity30[arri]);
					arri++;
				}
				if ( meter==50 )
				{
					array[point-1].Humidity50[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].Humidity50[arri]);
					arri++;
				}
				if ( meter==70 )
				{
					array[point-1].Humidity70[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].Humidity70[arri]);
					arri++;
				}
				if ( meter==90 )
				{
					array[point-1].Humidity90[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].Humidity90[arri]);
					arri++;
				}
			}
			else if( strcmp(variable,"pressure") == 0 )
			{
				if ( meter==10 )
				{
					array[point-1].pressure10[arri] = strtod(buf,NULL);
					//printf("%lf \n",array[point-1].pressure10[arri]);
					arri++;
				}
				if ( meter==30 )
				{
					array[point-1].pressure30[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].pressure30[arri]);
					arri++;
				}
				if ( meter==50 )
				{
					array[point-1].pressure50[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].pressure50[arri]);
					arri++;
				}
				if ( meter==70 )
				{
					array[point-1].pressure70[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].pressure70[arri]);
					arri++;
				}
				if ( meter==90 )
				{
					array[point-1].pressure90[arri] = strtod(buf,NULL);
					//printf("%lf ",array[point-1].pressure90[arri]);
					arri++;
				}
			}
			else if( strcmp(variable,"precipitation") == 0 )
			{
				array[point-1].precipitation[arri] = strtod(buf,NULL);
				//printf("%lf \n",array[point-1].precipitation[arri]);
				arri++;
			}
		}

		lineNum++;
		memset(&buf,0,100);
		//printf("DEBUG INFO: i=%d point=%d\n",i,point);
	}
	
	//calculate	Speed Data
	int a = 0, f = 0;
	for(f=0; f<param->pointNum; f++){
		//printf("test f=%d pointNum=%d\n",f,param->pointNum);
		for(a=0; a<maxSize; a++)
		{
			//char times[VALUE_MAX_SIZE];
			//double direction10[VALUE_MAX_SIZE];
			//double speed10[VALUE_MAX_SIZE];
			array[f].speed10[a] = sqrt(array[f].v10[a]*array[f].v10[a] + array[f].u10[a]*array[f].u10[a]);
			if(array[f].u10[a]<0)
			array[f].direction10[a] = acos(array[f].v10[a]/array[f].speed10[a]) * 57.3;
			else 
			array[f].direction10[a] = acos(array[f].v10[a]/array[f].speed10[a]) * 57.3+180;
			//printf("test direction10[%d] = %lf\n",a,array[f].direction10[a]);
			
			array[f].speed30[a] = sqrt(array[f].v30[a]*array[f].v30[a] + array[f].u30[a]*array[f].u30[a]);
			if(array[f].u30[a]<0)
			array[f].direction30[a] = acos(array[f].v30[a]/array[f].speed30[a]) * 57.3;
			else 
			array[f].direction30[a] = acos(array[f].v30[a]/array[f].speed30[a]) * 57.3+180;
			
			array[f].speed50[a] = sqrt(array[f].v50[a]*array[f].v50[a] + array[f].u50[a]*array[f].u50[a]);
			if(array[f].u50[a]<0)
			array[f].direction50[a] = acos(array[f].v50[a]/array[f].speed50[a]) * 57.3;
			else 
			array[f].direction50[a] = acos(array[f].v50[a]/array[f].speed50[a]) * 57.3+180;
			
			array[f].speed70[a] = sqrt(array[f].v70[a]*array[f].v70[a] + array[f].u70[a]*array[f].u70[a]);
			if(array[f].u70[a]<0)
			array[f].direction70[a] = acos(array[f].v70[a]/array[f].speed70[a]) * 57.3;
			else 
			array[f].direction70[a] = acos(array[f].v70[a]/array[f].speed70[a]) * 57.3+180;
			
			array[f].speed90[a] = sqrt(array[f].v90[a]*array[f].v90[a] + array[f].u90[a]*array[f].u90[a]);
			if(array[f].u90[a]<0)
			array[f].direction90[a] = acos(array[f].v90[a]/array[f].speed90[a]) * 57.3;
			else 
			array[f].direction90[a] = acos(array[f].v90[a]/array[f].speed90[a]) * 57.3+180;
		}
	}

	fclose(fpin);
}

void save2WPD(struct WeatherDataSet *array, struct WindFarmInfo *pWFInfo, int maxSize, char *prefix, char *timeStr)
{
	char outfile[128];
	//Get File Name Date
	char szFileNameDateStr[128];
	struct tm tm_time;
	char timeNameflag[64],timeflag[64];
	if(strcmp(timeStr,"0000")==0)
	{
		strcpy(timeflag,"12:00:00");
		strcpy(timeNameflag,"12");
	}
	else if(strcmp(timeStr,"0600")==0)
        {
                strcpy(timeflag,"18:00:00");
                strcpy(timeNameflag,"18");
        }
	else if(strcmp(timeStr,"1200")==0)
	{
		strcpy(timeflag,"00:00:00");
		strcpy(timeNameflag,"00");
	}
	else if(strcmp(timeStr,"1800")==0)
        {
                strcpy(timeflag,"06:00:00");
                strcpy(timeNameflag,"06");
        }

	//getDate(szFileNameDateStr,"%Y%m%d%H%M%S");
	getDate(szFileNameDateStr,"%Y%m%d");
	sprintf(outfile,"%s_%s%s%s.WPD",prefix,pWFInfo->szWFName,szFileNameDateStr,timeNameflag);
	
	//open file
	FILE *fpout;
	fpout = fopen(outfile,"w");
	if ( fpout == NULL )
	{
		printf("fopen %s failed\n",outfile);
		return;
	}
	//printf("output file is :%s\n",outfile);
	
	//Get date
	char szOutDateStr[128],szTitleDateStr[128],szTmpStr[128];
	getDate(szTmpStr,"%Y-%m-%d");
	if(strcmp(timeStr,"1200")==0)
	{
		sprintf(szOutDateStr,"%s_00:00:00",szTmpStr);
	}
	else if(strcmp(timeStr,"1800")==0)
        {
                sprintf(szOutDateStr,"%s_00:00:00",szTmpStr);
        }

	else if(strcmp(timeStr,"0000")==0)
	{
		sprintf(szOutDateStr,"%s_00:00:00",szTmpStr);
	}
	else if(strcmp(timeStr,"0600")==0)
        {
                sprintf(szOutDateStr,"%s_00:00:00",szTmpStr);
        }

	getDate(szTmpStr,"%Y%m%d");
	sprintf(szTitleDateStr,"%s_%s",szTmpStr,timeflag);
	//printf("current date is %s\n",szDateStr);
	
	//output data
	int t=0, f=0;
	char outstr[1024], outTimeStr[32];

	if( strlen(pWFInfo->szWFName) != 0)
	{
		sprintf(outstr,"// %s\n",pWFInfo->szWFLonLat);
		fputs(outstr,fpout);
	}
	sprintf(outstr,"<! Entity=weatherdata time=%s !>\n",szTitleDateStr);
	fputs(outstr,fpout);

	sprintf(outstr,"<weatherdata:%s_%s>\n",prefix,pWFInfo->szWFName);
	fputs(outstr,fpout);
	
	//sprintf(outstr,"@point Times  direction10  speed10  temperature10  humidity10  pressure10  precipitation10  direction30  speed30  temperature30  humidity30  pressure30  direction50  speed50  temperature50  humidity50  pressure50  direction70  speed70  temperature70  humidity70  pressure70 direction90  speed90  temperature90  humidity90  pressure90  \n");
	sprintf(outstr,"@point Times  direction10  speed10  temperature10  humidity10  pressure10  precipitation10  direction30  speed30  temperature30  humidity30  direction50  speed50  temperature50  humidity50  direction70  speed70  temperature70  humidity70  direction90  speed90  temperature90  humidity90    \n");
	fputs(outstr,fpout);
	
	for(f=0; f<pWFInfo->pointTotal; f++)
	{
		//printf("test array[%d].direction10[0]=%lf \n",pWFInfo->pointNumArr[f]-1,array[pWFInfo->pointNumArr[f]-1].direction10[0]);
		for(t=0; t<maxSize; t++)
		{
			getRelativeDate(outTimeStr,"",szOutDateStr,t*15*60+24*60*60);
			//getRelativeDate(outTimeStr,"",szOutDateStr,t*15*60);
			//sprintf(outstr,"#%d %s  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf\n",f+1,outTimeStr,array[f].direction10[t],array[f].speed10[t],array[f].temperature10[t],array[f].Humidity10[t],array[f].pressure10[t],array[f].precipitation[t],array[f].direction30[t],array[f].speed30[t],array[f].temperature30[t],array[f].Humidity30[t],array[f].pressure30[t],array[f].direction50[t],array[f].speed50[t],array[f].temperature50[t],array[f].Humidity50[t],array[f].pressure50[t],array[f].direction70[t],array[f].speed70[t],array[f].temperature70[t],array[f].Humidity70[t],array[f].pressure70[t],array[f].direction90[t],array[f].speed90[t],array[f].temperature90[t],array[f].Humidity90[t],array[f].pressure90[t]);
			sprintf(outstr,"#%d %s  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf  %.1lf\n",f+1,outTimeStr,array[pWFInfo->pointNumArr[f]-1].direction10[t],array[pWFInfo->pointNumArr[f]-1].speed10[t],array[pWFInfo->pointNumArr[f]-1].temperature10[t],array[pWFInfo->pointNumArr[f]-1].Humidity10[t],array[pWFInfo->pointNumArr[f]-1].pressure10[t],array[pWFInfo->pointNumArr[f]-1].precipitation[t],array[pWFInfo->pointNumArr[f]-1].direction30[t],array[pWFInfo->pointNumArr[f]-1].speed30[t],array[pWFInfo->pointNumArr[f]-1].temperature30[t],array[pWFInfo->pointNumArr[f]-1].Humidity30[t],array[pWFInfo->pointNumArr[f]-1].direction50[t],array[pWFInfo->pointNumArr[f]-1].speed50[t],array[pWFInfo->pointNumArr[f]-1].temperature50[t],array[pWFInfo->pointNumArr[f]-1].Humidity50[t],array[pWFInfo->pointNumArr[f]-1].direction70[t],array[pWFInfo->pointNumArr[f]-1].speed70[t],array[pWFInfo->pointNumArr[f]-1].temperature70[t],array[pWFInfo->pointNumArr[f]-1].Humidity70[t],array[pWFInfo->pointNumArr[f]-1].direction90[t],array[pWFInfo->pointNumArr[f]-1].speed90[t],array[pWFInfo->pointNumArr[f]-1].temperature90[t],array[pWFInfo->pointNumArr[f]-1].Humidity90[t]);
			fputs(outstr,fpout);
		}
	}
	 
	sprintf(outstr,"</weatherdata:%s_%s>\n",prefix,pWFInfo->szWFName);
	fputs(outstr,fpout);
	
	fclose(fpout);
}

int windFarmIsExist(struct ResultSet *rs, char *wfName)
{
	int i,ret=-1;
	for(i=0; i<rs->windfarmTotal; i++)
	{
		if(strcmp(rs->wfInfo[i].szWFName,wfName)==0)
		{
			ret = i;
			return ret;
		}
	}
	return ret;
}

void getWindFarmInfos(const char *pCPLonLat, struct ResultSet *rs)
{
	char lonlatprefrom[LON_LAT_ALL_MAX][128];
	char lonlatall[LON_LAT_ALL_MAX], sublonlat[128];
	char *p, *sp;
	int i = 0;
	int defPointNum = 1;
		
	const int num = strcpn(pCPLonLat,";")+1;
	printf("windfarm and CenterPoint total is %d\n",num);
	strcpy(lonlatall,pCPLonLat);
	
	p = strtok(lonlatall,";");
	if(p!=NULL)
		strcpy(lonlatprefrom[0],p);
	printf("DEBUG INFO : lonlatorefrom[0] = \"%s\"  num=%d \n",lonlatprefrom[0],num);
	for(i=1; i<num; i++)
	{
		p = strtok(NULL,";");
printf("p string is %s\n",p);
		if(p!=NULL)
		{	
			strcpy(lonlatprefrom[i],p);
			printf("DEBUG INFO LONLAT:%s\n",lonlatprefrom[i]);
		}
		else
		{
			break;
		}
		printf("DEBUG INFO :i=%d  num=%d  \n",i,num);
	}
	printf("center lon lat is %s\n",lonlatprefrom[num-2]);

	int reIdx;	
	for(i=0; i<num; i++)
	{
		p = strtok(lonlatprefrom[i],"_");
		if(p!=NULL)
		{
				if(strcmp(p,"Center")==0)
				{
					continue;
				}

				reIdx = windFarmIsExist(rs,p);
				if (reIdx >= 0) //exist
				{
						//printf("current windfarm is exist index is %d\n",reIdx);
						p = strtok(NULL,"_");
						if(p!=NULL)
						{
								strcat(rs->wfInfo[reIdx].szWFLonLat," ");
								strcat(rs->wfInfo[reIdx].szWFLonLat,p);
						}

						p = strtok(NULL,"_");
						if(p!=NULL)
						{
								strcat(rs->wfInfo[reIdx].szWFLonLat," ");
								strcat(rs->wfInfo[reIdx].szWFLonLat,p);
						}

						rs->wfInfo[reIdx].pointNumArr[rs->wfInfo[reIdx].pointTotal]=defPointNum;
						defPointNum++;
						rs->wfInfo[reIdx].pointTotal+=1;
				}
				else
				{
						//printf("add new windfarm index is %d\n",rs->windfarmTotal);
						strcpy(rs->wfInfo[rs->windfarmTotal].szWFName,p);
						

						p = strtok(NULL,"_");
						if(p!=NULL)
						{
								strcat(rs->wfInfo[rs->windfarmTotal].szWFLonLat," ");
								strcat(rs->wfInfo[rs->windfarmTotal].szWFLonLat,p);
						}

						p = strtok(NULL,"_");
						if(p!=NULL)
						{
								strcat(rs->wfInfo[rs->windfarmTotal].szWFLonLat," ");
								strcat(rs->wfInfo[rs->windfarmTotal].szWFLonLat,p);
						}
						
						rs->wfInfo[rs->windfarmTotal].pointNumArr[rs->wfInfo[rs->windfarmTotal].pointTotal]=defPointNum;
						defPointNum++;
						rs->wfInfo[rs->windfarmTotal].pointTotal+=1;
						rs->windfarmTotal+=1;

				}
		}	
		else
		{
			break;
		}
		printf("test windfarm total is %d\n",rs->windfarmTotal);
		printf("test result : windfarmTotal is %d, pointTotal is %d, pointNumArr[0]=%d, pointNumArr[1]=%d\n",rs->windfarmTotal,rs->wfInfo[rs->windfarmTotal-1].pointTotal,rs->wfInfo[rs->windfarmTotal-1].pointNumArr[0],rs->wfInfo[rs->windfarmTotal-1].pointNumArr[1]);
		printf("tset lonlat :%s\n",rs->wfInfo[rs->windfarmTotal-1].szWFLonLat);
	}
	
	
}



int main(int argc, char *argv[])
{

	printf("sarting ...");
	fflush(stdout);
	//argv
	int maxSize;
	char prefix[128], inputfile[128], timeStr[64];
	char *infile;
	infile=inputfile;
	//,szFileName[128],szWindFarmName[128],szWindFarmStr[128]

	if (argc==4)
	{	
		printf("argc is %d argv[0]=%s argv[1]=PREFIX:%s argv[2]=InputFileName:%s\n",argc,argv[0],argv[1],argv[2]);
		maxSize = VALUE_MAX_SIZE;
		strcpy(prefix,argv[1]);
		strcpy(timeStr,argv[2]);
		strcpy(inputfile,argv[3]);
		//sprintf(outfile,"%s%s00.WPD",szWindFarmStr,szFileNameDateStr);
	}
	if (argc==3)
	{	
		printf("argc is %d argv[0]=%s argv[1]=PREFIX:%s argv[2]=InputFileName:%s\n",argc,argv[0],argv[1],argv[2]);
		maxSize = VALUE_MAX_SIZE;
		strcpy(prefix,argv[1]);
		strcpy(timeStr,argv[2]);
		strcpy(inputfile,"out.txt");
		//sprintf(outfile,"%s%s00.WPD",szWindFarmStr,szFileNameDateStr);
	}
	else if (argc==2)
	{	
		printf("argc is %d argv[0]=%s argv[1]=PREFIX:%s\n",argc,argv[0],argv[1]);
		maxSize = VALUE_MAX_SIZE;
		//strcpy(szWindFarmName,argv[1]);
		//getWindFarmStr(szWindFarmStr,szWindFarmName);
		strcpy(prefix,argv[1]);
		strcpy(inputfile,"out.txt");
		//sprintf(outfile,"%s%s00.WPD",szWindFarmStr,szFileNameDateStr);
	}
	else
	{
		printf("argc is %d \n",argc);
		maxSize = VALUE_MAX_SIZE;	
		strcpy(inputfile,"out.txt");
		strcpy(prefix,"DEFPREFIX");
		//sprintf(outfile,"%s%s00.WPD",szFileName,szFileNameDateStr);
	}

	//open file
	struct WeatherDataSet dSet[FORCAST_POINT_TOTAL];
	struct WeatherDataSet *wdp;
	struct DataProcessParameter dpParam;
	struct ResultSet rs;
	
	memset(&dSet,0,sizeof(dSet));
	memset(&rs,0,sizeof(rs));
	memset(&dpParam,0,sizeof(dpParam));
	
	wdp = &dSet[0];
	
	//printf("inputfile is %s \n",inputfile);
	//printf("infile is %s\n",infile);
	fflush(stdout);

	getGsData(infile, wdp, &dpParam, maxSize);
	printf("in param lonlat is %s\n ",dpParam.szLonLat);
	fflush(stdout);
	
	int num = strcpn(dpParam.szLonLat,";");
	//printf("n is %d\n",num);
	getWindFarmInfos(dpParam.szLonLat,&rs);
	//printf("test rs : %d\n",rs.windfarmTotal);
	//printf("test rs : %s\n",rs.wfInfo[rs.windfarmTotal-1].szWFName);

	
	char WPDFileName[256];
	int n;
	for(n=0; n<rs.windfarmTotal; n++)
	{
		//printf("tset n=%d rs.wfInfo[rs.windfarmTotal - 1].szWFName is %s\n",n,rs.wfInfo[rs.windfarmTotal].szWFName);
		save2WPD(wdp, &rs.wfInfo[n], maxSize, prefix,timeStr);
	}
		
}
