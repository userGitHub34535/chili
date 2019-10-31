﻿// ********************************************************************************************************************************************
// Copyright (c) 2019
// Author: USA
// Product: CHILI
// Version: 1.0.0
// ********************************************************************************************************************************************

using Usa.chili.Common;
using Usa.chili.Data;
using Usa.chili.Domain;
using Usa.chili.Dto;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using System;
using Microsoft.EntityFrameworkCore;

namespace Usa.chili.Services
{
    public class StationDataService: IStationDataService
    {
        private readonly ILogger _logger;
        private readonly ChiliDbContext _dbContext;

        static StationDataService()
        {
        }

        public StationDataService(ILogger<StationDataService> logger, ChiliDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        public async Task<List<RealtimeDataDto>> ListRealtimeData() {
            DateTime now = DateTime.Now;

            return await _dbContext.Station
                .AsNoTracking()
                .OrderBy(x => x.DisplayName)
                .Select(x => new RealtimeDataDto {
                    StationId = x.Id,
                    StationName = x.DisplayName,
                    StationTimestamp = now,
                    AirTemperature = 90.1,
                    DewPoint = 1.1,
                    HeatIndex = 1.1,
                    WindChill = 1.2,
                    RealHumidity = 1.2,
                    WindDirection = 1.3,
                    WindSpeed = 1.4,
                    Pressure = 1.5,
                    YesterdayExtreme = new ExtremeDto {
                        AirTemperatureHighTimestamp = now.AddDays(-1),
                        AirTemperatureLowTimestamp = now.AddDays(-1),
                        DewPointHighTimestamp = now.AddDays(-1),
                        DewPointLowTimestamp = now.AddDays(-1),
                        RealHumidityHighTimestamp = now.AddDays(-1),
                        RealHumidityLowTimestamp = now.AddDays(-1),
                        WindSpeedMaxTimestamp = now.AddDays(-1),
                        AirTemperatureHigh = 65.3,
                        AirTemperatureLow = 80.6,
                        DewPointHigh = 1.5,
                        DewPointLow = 1.5,
                        RealHumidityHigh = 1.5,
                        RealHumidityLow = 1.5,
                        WindSpeedMax = 1.5,
                        Precipitation = 1.5,
                    },
                    TodayExtreme = new ExtremeDto {
                        AirTemperatureHighTimestamp = now,
                        AirTemperatureLowTimestamp = now,
                        DewPointHighTimestamp = now,
                        DewPointLowTimestamp = now,
                        RealHumidityHighTimestamp = now,
                        RealHumidityLowTimestamp = now,
                        WindSpeedMaxTimestamp = now,
                        AirTemperatureHigh = 65.3,
                        AirTemperatureLow = 80.6,
                        DewPointHigh = 1.5,
                        DewPointLow = 1.5,
                        RealHumidityHigh = 1.5,
                        RealHumidityLow = 1.5,
                        WindSpeedMax = 1.5,
                        Precipitation = 1.5,
                    }
                })
                .ToListAsync();
        }
    }
}