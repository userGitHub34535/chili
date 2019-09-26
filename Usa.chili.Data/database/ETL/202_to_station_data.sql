USE chili;

DROP PROCEDURE IF EXISTS chili.`202_to_station_data`;

DELIMITER $$
USE chili$$
CREATE PROCEDURE chili.`202_to_station_data`()
BEGIN

DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

-- Insert station data from ashford_202
INSERT INTO chili.station_data
(
    `StationId`,
    `TS`,
    `RecId`,
    `TableCode`,
    `Year`,
    `Month`,
    `DayOfMon`,
    `DayOfYear`,
    `Hour`,
    `Minute`,
    `Lat`,
    `Lon`,
    `Elev`,
    `Sign`,
    `Door`,
    `Batt`,
    `ObsInSumm_Tot`,
    `Precip_TB3_Tot`,
    `Precip_TX_Tot`,
    `Precip_TB3_Today`,
    `Precip_TX_Today`,
    `PTemp`,`IRTS_Trgt`,
    `IRTS_Body`,`SoilSfcT`,
    `SoilT_5cm`,`SoilT_10cm`,
    `SoilT_20cm`,`SoilT_50cm`,
    `SoilT_100cm`,
    `AirT_1pt5m`,
    `AirT_2m`,
    `AirT_9pt5m`,
    `AirT_10m`,
    `RH_2m`,
    `RH_10m`,
    `Pressure_1`,
    `Pressure_2`,
    `TotalRadn`,
    `QuantRadn`,
    `WndDir_2m`,
    `WndDir_10m`,
    `WndSpd_2m`,
    `WndSpd_10m`,
    `WndSpd_Vert`,
    `Vitel_5cm_a`,
    `Vitel_5cm_b`,
    `Vitel_5cm_c`,
    `Vitel_5cm_d`,
    `Vitel_10cm_a`,
    `Vitel_10cm_b`,
    `Vitel_10cm_c`,
    `Vitel_10cm_d`,
    `Vitel_20cm_a`,
    `Vitel_20cm_b`,
    `Vitel_20cm_c`,
    `Vitel_20cm_d`,
    `Vitel_50cm_a`,
    `Vitel_50cm_b`,
    `Vitel_50cm_c`,
    `Vitel_50cm_d`,
    `Vitel_100cm_a`,
    `Vitel_100cm_b`,
    `Vitel_100cm_c`,
    `Vitel_100cm_d`,
    `WndSpd_2m_Max`,
    `WndSpd_10m_Max`,
    `WndSpd_Vert_Max`,
    `WndSpd_Vert_Min`,
    `WndSpd_Vert_Tot`,
    `WndSpd_2m_WVc_1`,
    `WndSpd_2m_WVc_2`,
    `WndSpd_2m_WVc_3`,
    `WndSpd_2m_WVc_4`,
    `WndSpd_10m_WVc_1`,
    `WndSpd_10m_WVc_2`,
    `WndSpd_10m_WVc_3`,
    `WndSpd_10m_WVc_4`,
    `WndSpd_2m_Std`,
    `WndSpd_10m_Std`,
    `SoilType`,
    `eR`,
    `eI`,
    `Temp_C`,
    `eR_tc`,
    `eI_tc`,
    `wfv`,
    `NaCI`,
    `SoilCond`,
    `SoilCond_tc`,
    `SoilWaCond_tc`
)
SELECT 
    (SELECT station.Id FROM chili.station WHERE station.DisplayName = 'Ashford')
    `TS`,
    `RecId`,
    `TableCode`,
    `Year`,
    `Month`,
    `DayOfMon`,
    `DayOfYear`,
    `Hour`,
    `Minute`,
    `Lat`,
    `Lon`,
    `Elev`,
    `Sign`,
    `Door`,
    `Batt`,
    `ObsInSumm_Tot`,
    `Precip_TB3_Tot`,
    `Precip_TX_Tot`,
    `Precip_TB3_Today`,
    `Precip_TX_Today`,
    `PTemp`,`IRTS_Trgt`,
    `IRTS_Body`,
    `SoilSfcT`,
    `SoilT_5cm`,
    `SoilT_10cm`,
    `SoilT_20cm`,
    `SoilT_50cm`,
    `SoilT_100cm`,
    `AirT_1pt5m`,
    `AirT_2m`,
    `AirT_9pt5m`,
    `AirT_10m`,
    `RH_2m`,
    `RH_10m`,
    `Pressure_1`,
    `Pressure_2`,
    `TotalRadn`,
    `QuantRadn`,
    `WndDir_2m`,
    `WndDir_10m`,
    `WndSpd_2m`,
    `WndSpd_10m`,
    `WndSpd_Vert`,
    `Vitel_5cm_a`,
    `Vitel_5cm_b`,
    `Vitel_5cm_c`,
    `Vitel_5cm_d`,
    `Vitel_10cm_a`,
    `Vitel_10cm_b`,
    `Vitel_10cm_c`,
    `Vitel_10cm_d`,
    `Vitel_20cm_a`,
    `Vitel_20cm_b`,
    `Vitel_20cm_c`,
    `Vitel_20cm_d`,
    `Vitel_50cm_a`,
    `Vitel_50cm_b`,
    `Vitel_50cm_c`,
    `Vitel_50cm_d`,
    `Vitel_100cm_a`,
    `Vitel_100cm_b`,
    `Vitel_100cm_c`,
    `Vitel_100cm_d`,
    `WndSpd_2m_Max`,
    `WndSpd_10m_Max`,
    `WndSpd_Vert_Max`,
    `WndSpd_Vert_Min`,
    `WndSpd_Vert_Tot`,
    `WndSpd_2m_WVc_1`,
    `WndSpd_2m_WVc_2`,
    `WndSpd_2m_WVc_3`,
    `WndSpd_2m_WVc_4`,
    `WndSpd_10m_WVc_1`,
    `WndSpd_10m_WVc_2`,
    `WndSpd_10m_WVc_3`,
    `WndSpd_10m_WVc_4`,
    `WndSpd_2m_Std`,
    `WndSpd_10m_Std`,
    `SoilType`,
    `eR`,
    `eI`,
    `Temp_C`,
    `eR_tc`,
    `eI_tc`,
    `wfv`,
    `NaCI`,
    `SoilCond`,
    `SoilCond_tc`,
    `SoilWaCond_tc`
FROM chili.ashford_202;

IF `_rollback` THEN
    SELECT 'Failed and rolling back!';
    ROLLBACK;
ELSE
    SELECT 'Successful and committing the data change.';
    COMMIT;
END IF;

END$$

DELIMITER ;

