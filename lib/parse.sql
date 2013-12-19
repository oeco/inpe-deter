BEGIN;
  delete from deter;
  insert into deter (year,month,day,area_ha,geometry) 
    select 
      
      -- year
      case 
        when sourceshp like 'Deter_20%' then substr(sourceshp,7,4)
        else substr(sourceshp,6,4)
      end 
      as year
      
      -- month 
      ,case
        when sourceshp like 'deter_2010430%' then '04'
        when length(trim(view_date)) > 0 then substr(view_date,6,2)
        when sourceshp like 'Deter_20%' then substr(sourceshp,11,2)      
        -- when data > 0 then substr(data,3,2)
        else substr(sourceshp,10,2)
      end
      as month

      -- day
      ,case
        -- when dia > 0 then cast(dia as integer) 
        when length(trim(view_date)) > 0 then substr(view_date,9,2) 
        -- when data > 0 then substr(data,1,2)  
        else substr(sourceshp,13,2)
      end
      as dia

      -- area in hectares
      , case
        when AREA > 0 then round(AREA / 10000,2) 
        -- else round(sprarea / 10000,2)
      end
      as area_ha,
      CastToMultiPolygon(geometry)
    from source;

    -- format numbers with zeroes for day and month
    update deter set day = substr('0'||day, -2, 2), month = substr('0'||month, -2, 2);
    update deter set area_ha_pt = replace(area_ha,'.',',');

COMMIT;