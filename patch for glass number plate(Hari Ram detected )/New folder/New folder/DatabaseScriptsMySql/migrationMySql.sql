CREATE TABLE `ActionData` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_ActionData` PRIMARY KEY (`Id`)
);

CREATE TABLE `ANPRInfo` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Key` longtext CHARACTER SET utf8mb4 NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_ANPRInfo` PRIMARY KEY (`Id`)
);

CREATE TABLE `AspNetRoles` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    `ParentName` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_AspNetRoles` PRIMARY KEY (`Id`)
);

CREATE TABLE `AspNetUsers` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `UserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `Email` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 NULL,
    `EmailConfirmed` tinyint(1) NOT NULL,
    `PasswordHash` longtext CHARACTER SET utf8mb4 NULL,
    `SecurityStamp` longtext CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumberConfirmed` tinyint(1) NOT NULL,
    `TwoFactorEnabled` tinyint(1) NOT NULL,
    `LockoutEnd` datetime(6) NULL,
    `LockoutEnabled` tinyint(1) NOT NULL,
    `AccessFailedCount` int NOT NULL,
    `Layout` longtext CHARACTER SET utf8mb4 NULL,
    `MobileLayout` longtext CHARACTER SET utf8mb4 NULL,
    `Language` longtext CHARACTER SET utf8mb4 NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `ProfileImagePath` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_AspNetUsers` PRIMARY KEY (`Id`)
);

CREATE TABLE `Category` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `CategoryName` longtext CHARACTER SET utf8mb4 NULL,
    `Priority` int NOT NULL,
    `Color` longtext CHARACTER SET utf8mb4 NULL,
    `ToBeDiscarded` tinyint(1) NULL,
    `ArcheivingInDays` int NOT NULL DEFAULT 30,
    CONSTRAINT `PK_Category` PRIMARY KEY (`Id`)
);

CREATE TABLE `CategoryData` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NoPlate` varchar(255) CHARACTER SET utf8mb4 NULL,
    `Details_string` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_CategoryData` PRIMARY KEY (`Id`)
);

CREATE TABLE `DeletedResourcesHistories` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ResourceId` int NOT NULL,
    `ResourceName` longtext CHARACTER SET utf8mb4 NULL,
    `DeletedDate` bigint NOT NULL,
    CONSTRAINT `PK_DeletedResourcesHistories` PRIMARY KEY (`Id`)
);

CREATE TABLE `EmailServer` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `SMTPServer` longtext CHARACTER SET utf8mb4 NOT NULL,
    `SMTPPort` int NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Password` longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_EmailServer` PRIMARY KEY (`Id`)
);

CREATE TABLE `Groups` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `GroupName` longtext CHARACTER SET utf8mb4 NULL,
    `ParentName` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Groups` PRIMARY KEY (`Id`)
);

CREATE TABLE `OffenceDetails` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `OffenceName` longtext CHARACTER SET utf8mb4 NULL,
    `Code` int NOT NULL,
    `AliasName` longtext CHARACTER SET utf8mb4 NULL,
    `ShortFormAliasName` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_OffenceDetails` PRIMARY KEY (`Id`)
);

CREATE TABLE `Rectangle` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `X` int NOT NULL,
    `Y` int NOT NULL,
    `Width` int NOT NULL,
    `Height` int NOT NULL,
    CONSTRAINT `PK_Rectangle` PRIMARY KEY (`Id`)
);

CREATE TABLE `ResourceType` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ResourceTypeName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `HoverImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `DisconnectedImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `ClassName` longtext CHARACTER SET utf8mb4 NULL,
    `PerformanceIndicatorField` longtext CHARACTER SET utf8mb4 NULL,
    `KpiPositiveValue` longtext CHARACTER SET utf8mb4 NULL,
    `KpiNegativeValue` longtext CHARACTER SET utf8mb4 NULL,
    `IsMobile` tinyint(1) NOT NULL,
    `SaveGPSData` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ResourceType` PRIMARY KEY (`Id`),
    CONSTRAINT `AK_ResourceType_ResourceTypeName` UNIQUE (`ResourceTypeName`)
);

CREATE TABLE `SmsGateway` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Type` longtext CHARACTER SET utf8mb4 NULL,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NULL,
    `Password` longtext CHARACTER SET utf8mb4 NULL,
    `Format` longtext CHARACTER SET utf8mb4 NULL,
    `AccountSid` longtext CHARACTER SET utf8mb4 NULL,
    `AuthToken` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_SmsGateway` PRIMARY KEY (`Id`)
);

CREATE TABLE `SystemConfig` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Key` longtext CHARACTER SET utf8mb4 NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_SystemConfig` PRIMARY KEY (`Id`)
);

CREATE TABLE `Actions` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ActionDataId` int NOT NULL,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Email_Ids_string` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `Mobile_Numbers_string` longtext CHARACTER SET utf8mb4 NULL,
    `SmsAction_Message` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Actions` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Actions_ActionData_ActionDataId` FOREIGN KEY (`ActionDataId`) REFERENCES `ActionData` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `RuleSet` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ActionDataId` int NULL,
    `RuleSetsId` int NULL,
    `Condition` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_RuleSet` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_RuleSet_ActionData_ActionDataId` FOREIGN KEY (`ActionDataId`) REFERENCES `ActionData` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_RuleSet_RuleSet_RuleSetsId` FOREIGN KEY (`RuleSetsId`) REFERENCES `RuleSet` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetRoleClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `RoleId` int NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_AspNetRoleClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `UserId` int NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_AspNetUserClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserLogins` (
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderKey` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderDisplayName` longtext CHARACTER SET utf8mb4 NULL,
    `UserId` int NOT NULL,
    CONSTRAINT `PK_AspNetUserLogins` PRIMARY KEY (`LoginProvider`, `ProviderKey`),
    CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserRoles` (
    `UserId` int NOT NULL,
    `RoleId` int NOT NULL,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Id` int NULL DEFAULT 0,
    CONSTRAINT `PK_AspNetUserRoles` PRIMARY KEY (`UserId`, `RoleId`),
    CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserTokens` (
    `UserId` int NOT NULL,
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_AspNetUserTokens` PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
    CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `Category_CategoryData` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `CategoryId` int NOT NULL,
    `CategoryDataId` int NOT NULL,
    CONSTRAINT `PK_Category_CategoryData` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Category_CategoryData_CategoryData_CategoryDataId` FOREIGN KEY (`CategoryDataId`) REFERENCES `CategoryData` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Category_CategoryData_Category_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `EventLogs` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `EventName` longtext CHARACTER SET utf8mb4 NULL,
    `_EventProperties` longtext CHARACTER SET utf8mb4 NULL,
    `Category` longtext CHARACTER SET utf8mb4 NULL,
    `AnalyticType` longtext CHARACTER SET utf8mb4 NULL,
    `DetConf` double NOT NULL,
    `DetTime` bigint NOT NULL,
    `DeviceId` int NOT NULL,
    `FullImgPath` longtext CHARACTER SET utf8mb4 NULL,
    `PlateId` longtext CHARACTER SET utf8mb4 NULL,
    `PlateImgPath` longtext CHARACTER SET utf8mb4 NULL,
    `PlateNumber` longtext CHARACTER SET utf8mb4 NULL,
    `ViolationImgPath` longtext CHARACTER SET utf8mb4 NULL,
    `RedLightViolated` tinyint(1) NOT NULL,
    `SpeedViolated` tinyint(1) NOT NULL,
    `DriverImgPath` longtext CHARACTER SET utf8mb4 NULL,
    `Remark` longtext CHARACTER SET utf8mb4 NULL,
    `RecConf` double NOT NULL,
    `ReceivedTime` bigint NOT NULL,
    `VehicleColor` longtext CHARACTER SET utf8mb4 NULL,
    `CategoryDataId` int NULL,
    `Speed` float NOT NULL,
    `VehicleRegistrationType` longtext CHARACTER SET utf8mb4 NULL,
    `NoHelmet` tinyint(1) NOT NULL,
    `NumberOfRiders` int NOT NULL,
    `TrippleRiding` tinyint(1) NOT NULL,
    `Starred` tinyint(1) NOT NULL,
    `IsChallanRequested` tinyint(1) NOT NULL,
    `_AttachedImages` longtext CHARACTER SET utf8mb4 NULL,
    `NoSeatBelt` tinyint(1) NOT NULL,
    `IsDrivingWhileOnTheMobile` tinyint(1) NOT NULL,
    `IsNotValid` tinyint(1) NOT NULL,
    CONSTRAINT `PK_EventLogs` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_EventLogs_CategoryData_CategoryDataId` FOREIGN KEY (`CategoryDataId`) REFERENCES `CategoryData` (`Id`) ON DELETE SET NULL
);

CREATE TABLE `Filter` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Condition` longtext CHARACTER SET utf8mb4 NULL,
    `ResourceTypeId` int NULL,
    CONSTRAINT `PK_Filter` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Filter_ResourceType_ResourceTypeId` FOREIGN KEY (`ResourceTypeId`) REFERENCES `ResourceType` (`Id`) ON DELETE RESTRICT
);

CREATE TABLE `Resources` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `_Properties` longtext CHARACTER SET utf8mb4 NULL,
    `ResourceName` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
    `ResourceImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `ResourceDisconnectedImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `ResourceHoverImagePath` longtext CHARACTER SET utf8mb4 NULL,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    `IsMobile` tinyint(1) NOT NULL,
    `FieldOfViewAngle` int NOT NULL DEFAULT 30,
    `ResourceAngle` int NOT NULL DEFAULT 0,
    `ResourceTypeName` varchar(255) CHARACTER SET utf8mb4 NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NULL,
    `Password` longtext CHARACTER SET utf8mb4 NULL,
    `UserId` int NULL,
    `Port` int NOT NULL DEFAULT 80,
    `Ip` longtext CHARACTER SET utf8mb4 NULL,
    `SetStatusByPing` tinyint(1) NOT NULL DEFAULT TRUE,
    `Longitude` double NOT NULL,
    `Latitude` double NOT NULL,
    `Location` longtext CHARACTER SET utf8mb4 NULL,
    `SerialNumber` longtext CHARACTER SET utf8mb4 NULL,
    `DistrictId` int NOT NULL,
    `RTOCircleNumber` int NOT NULL,
    `LiveViewUrl` longtext CHARACTER SET utf8mb4 NULL,
    `IsPtz` tinyint(1) NULL DEFAULT FALSE,
    `UseTranscoding` tinyint(1) NULL,
    `Snapshot` longtext CHARACTER SET utf8mb4 NULL,
    `checkViolation` tinyint(1) NULL,
    `speedLimit` float NULL,
    `ItmsId` int NULL,
    `ItmsResourceId` int NULL DEFAULT 0,
    `MqttPort` int NULL,
    `NginxPort` int NULL,
    `StreamingPort` int NULL,
    CONSTRAINT `PK_Resources` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Resources_Resources_ItmsId` FOREIGN KEY (`ItmsId`) REFERENCES `Resources` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Resources_ResourceType_ResourceTypeName` FOREIGN KEY (`ResourceTypeName`) REFERENCES `ResourceType` (`ResourceTypeName`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Resources_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE RESTRICT
);

CREATE TABLE `Rule` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `RuleSetId` int NOT NULL,
    `Field` longtext CHARACTER SET utf8mb4 NULL,
    `Operator` longtext CHARACTER SET utf8mb4 NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Rule` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Rule_RuleSet_RuleSetId` FOREIGN KEY (`RuleSetId`) REFERENCES `RuleSet` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `PlateRoi` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Height` int NOT NULL,
    `Width` int NOT NULL,
    `X` int NOT NULL,
    `Y` int NOT NULL,
    `EventLogsId` int NOT NULL,
    CONSTRAINT `PK_PlateRoi` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_PlateRoi_EventLogs_EventLogsId` FOREIGN KEY (`EventLogsId`) REFERENCES `EventLogs` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `FilterRule` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Field` longtext CHARACTER SET utf8mb4 NULL,
    `Operator` longtext CHARACTER SET utf8mb4 NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    `FilterId` int NULL,
    CONSTRAINT `PK_FilterRule` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_FilterRule_Filter_FilterId` FOREIGN KEY (`FilterId`) REFERENCES `Filter` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `Node` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeNumber` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Type` int NOT NULL,
    `ActionJson` longtext CHARACTER SET utf8mb4 NULL,
    `FilterId` int NULL,
    `IsManual` tinyint(1) NOT NULL DEFAULT FALSE,
    CONSTRAINT `PK_Node` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Node_Filter_FilterId` FOREIGN KEY (`FilterId`) REFERENCES `Filter` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `ExportVideo` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ExportName` longtext CHARACTER SET utf8mb4 NULL,
    `StartTime` longtext CHARACTER SET utf8mb4 NULL,
    `EndTime` longtext CHARACTER SET utf8mb4 NULL,
    `ExportType` longtext CHARACTER SET utf8mb4 NULL,
    `ExportFormat` longtext CHARACTER SET utf8mb4 NULL,
    `Status` longtext CHARACTER SET utf8mb4 NULL,
    `CameraId` int NOT NULL,
    `ExportId` longtext CHARACTER SET utf8mb4 NULL,
    `ExportVideoUrl` longtext CHARACTER SET utf8mb4 NULL,
    `ErrorMessage` longtext CHARACTER SET utf8mb4 NULL,
    `ExportPercentDone` int NOT NULL,
    `UserId` int NOT NULL,
    `ExportInitiatedAt` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_ExportVideo` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ExportVideo_Resources_CameraId` FOREIGN KEY (`CameraId`) REFERENCES `Resources` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `ResourceAnalytics` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `DeviceId` int NOT NULL,
    `DeviceName` longtext CHARACTER SET utf8mb4 NULL,
    `Src` longtext CHARACTER SET utf8mb4 NULL,
    `SrcType` int NOT NULL,
    `LoopVideo` tinyint(1) NOT NULL,
    `AnalyticType` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_ResourceAnalytics` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ResourceAnalytics_Resources_DeviceId` FOREIGN KEY (`DeviceId`) REFERENCES `Resources` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `UserResources` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `UserId` int NOT NULL,
    `ResourcesId` int NOT NULL,
    CONSTRAINT `PK_UserResources` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_UserResources_Resources_ResourcesId` FOREIGN KEY (`ResourcesId`) REFERENCES `Resources` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserResources_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `Parameter` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Discriminator` longtext CHARACTER SET utf8mb4 NOT NULL,
    `ResourceAnalyticsId` int NOT NULL,
    `AlertInterval` int NOT NULL,
    `RLVDCameraId` int NULL,
    `ANPRCameraId` int NULL,
    `MinSize` int NULL,
    `MaxSize` int NULL,
    `MaxHeight` int NULL,
    `MaxWidth` int NULL,
    `MinHeight` int NULL,
    `MinWidth` int NULL,
    `RoiId` int NULL,
    `ProcessingInterval` int NULL,
    `State` longtext CHARACTER SET utf8mb4 NULL,
    `Country` longtext CHARACTER SET utf8mb4 NULL,
    `CamAssociated` tinyint(1) NULL DEFAULT FALSE,
    `AssociatedCamId` int NULL,
    `AssociatedAnalyticName` longtext CHARACTER SET utf8mb4 NULL,
    `FindVehicleColor` tinyint(1) NULL DEFAULT FALSE,
    `VehicleSide` int NULL,
    `HandleStateSpecialCase` tinyint(1) NULL DEFAULT FALSE,
    `TryCorrectingNumber` tinyint(1) NULL DEFAULT FALSE,
    `RejectPlatesBasedOnNumberLength` tinyint(1) NULL DEFAULT FALSE,
    `SaveExtraFullImageWithoutPlateBbox` tinyint(1) NULL DEFAULT FALSE,
    `StreamMarkedVideo` tinyint(1) NULL DEFAULT FALSE,
    `PlateNumberMinLengthThresh` int NULL,
    `PlateNumberMaxLengthThresh` int NULL,
    `Stage_1` longtext CHARACTER SET utf8mb4 NULL,
    `Stage_2` longtext CHARACTER SET utf8mb4 NULL,
    `DnnBackened` int NULL DEFAULT 0,
    `DnnTarget` int NULL DEFAULT 0,
    `FindVehicleRegistrationType` tinyint(1) NULL,
    `NumberOfImagesToSave` int NULL DEFAULT 1,
    `FrameIntervalBetweenImagesToSave` int NULL DEFAULT 5,
    `MarkPlateAsViolationOnlyIfInsideRedLightViolationZone` tinyint(1) NULL,
    `RedLightViolationZoneId` int NULL,
    `FrameInterval` float NULL,
    `DrawLaneRegion` tinyint(1) NULL DEFAULT FALSE,
    `DrawMeasurementRegion` tinyint(1) NULL DEFAULT FALSE,
    `CheckThresh` int NULL,
    `GreenLightRectId` int NULL,
    `RedLightRectId` int NULL,
    `YellowLightRectId` int NULL,
    `ShowLightRects` tinyint(1) NULL DEFAULT FALSE,
    `WriteLightState` tinyint(1) NULL DEFAULT FALSE,
    `DiscardRepetativeNumberPlates` tinyint(1) NULL DEFAULT FALSE,
    `TimeToKeepRepetativeNumberFor` int NULL DEFAULT 1,
    `DrivingWithoutSeatBelt` tinyint(1) NULL DEFAULT FALSE,
    `DrivingWhileOnTheMobile` tinyint(1) NULL DEFAULT FALSE,
    CONSTRAINT `PK_Parameter` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Parameter_Rectangle_RedLightViolationZoneId` FOREIGN KEY (`RedLightViolationZoneId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Parameter_Rectangle_RoiId` FOREIGN KEY (`RoiId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Parameter_ResourceAnalytics_ResourceAnalyticsId` FOREIGN KEY (`ResourceAnalyticsId`) REFERENCES `ResourceAnalytics` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Parameter_Rectangle_GreenLightRectId` FOREIGN KEY (`GreenLightRectId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Parameter_Rectangle_RedLightRectId` FOREIGN KEY (`RedLightRectId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Parameter_Rectangle_YellowLightRectId` FOREIGN KEY (`YellowLightRectId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT
);

CREATE TABLE `LaneDetails` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ANPRWithSpeedParameterId` int NOT NULL,
    `LaneName` longtext CHARACTER SET utf8mb4 NULL,
    `LaneCoef` double NOT NULL,
    `RegionWidth` double NOT NULL,
    `RegionHeight` double NOT NULL,
    CONSTRAINT `PK_LaneDetails` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_LaneDetails_Parameter_ANPRWithSpeedParameterId` FOREIGN KEY (`ANPRWithSpeedParameterId`) REFERENCES `Parameter` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `Co_ordinate` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `X` float NOT NULL,
    `Y` float NOT NULL,
    `LaneDetailsId` int NULL,
    `LaneDetailsId1` int NULL,
    CONSTRAINT `PK_Co_ordinate` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Co_ordinate_LaneDetails_LaneDetailsId` FOREIGN KEY (`LaneDetailsId`) REFERENCES `LaneDetails` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Co_ordinate_LaneDetails_LaneDetailsId1` FOREIGN KEY (`LaneDetailsId1`) REFERENCES `LaneDetails` (`Id`) ON DELETE RESTRICT
);

CREATE TABLE `FallbackInterval` (
    `Id` serial NOT NULL AUTO_INCREMENT,
    `ANPRId` int NOT NULL,
    `ConnectedTime` bigint NOT NULL,
    `DisconnectedTime` bigint NOT NULL,
    CONSTRAINT `PK_FallbackInterval` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_FallbackInterval_Resources_ANPRId` FOREIGN KEY (`ANPRId`) REFERENCES `Resources` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `ChallanDetails` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `EmailId` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL,
    `DeliveryStatus` longtext CHARACTER SET utf8mb4 NULL,
    `PaymentStatus` longtext CHARACTER SET utf8mb4 NULL,
    `EventLogsId` int NOT NULL,
    CONSTRAINT `PK_ChallanDetails` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ChallanDetails_EventLogs_EventLogsId` FOREIGN KEY (`EventLogsId`) REFERENCES public.`EventLogs` (`Id`) ON DELETE CASCADE
);

CREATE INDEX "IX_ChallanDetails_EventLogsId" ON public."ChallanDetails" ("EventLogsId");

CREATE INDEX `IX_FallbackInterval_ANPRId` ON `FallbackInterval` (`ANPRId`);

CREATE INDEX `IX_Resources_ItmsId` ON `Resources` (`ItmsId`);

CREATE INDEX `IX_Actions_ActionDataId` ON `Actions` (`ActionDataId`);

CREATE INDEX `IX_AspNetRoleClaims_RoleId` ON `AspNetRoleClaims` (`RoleId`);

CREATE UNIQUE INDEX `RoleNameIndex` ON `AspNetRoles` (`NormalizedName`);

CREATE INDEX `IX_AspNetUserClaims_UserId` ON `AspNetUserClaims` (`UserId`);

CREATE INDEX `IX_AspNetUserLogins_UserId` ON `AspNetUserLogins` (`UserId`);

CREATE INDEX `IX_AspNetUserRoles_RoleId` ON `AspNetUserRoles` (`RoleId`);

CREATE INDEX `EmailIndex` ON `AspNetUsers` (`NormalizedEmail`);

CREATE UNIQUE INDEX `UserNameIndex` ON `AspNetUsers` (`NormalizedUserName`);

CREATE UNIQUE INDEX `IX_AspNetUsers_UserName` ON `AspNetUsers` (`UserName`);

CREATE INDEX `IX_Category_CategoryData_CategoryDataId` ON `Category_CategoryData` (`CategoryDataId`);

CREATE INDEX `IX_Category_CategoryData_CategoryId` ON `Category_CategoryData` (`CategoryId`);

CREATE UNIQUE INDEX `IX_CategoryData_NoPlate` ON `CategoryData` (`NoPlate`);

CREATE INDEX `IX_Co_ordinate_LaneDetailsId` ON `Co_ordinate` (`LaneDetailsId`);

CREATE INDEX `IX_Co_ordinate_LaneDetailsId1` ON `Co_ordinate` (`LaneDetailsId1`);

CREATE INDEX `IX_EventLogs_CategoryDataId` ON `EventLogs` (`CategoryDataId`);

CREATE INDEX `IX_ExportVideo_CameraId` ON `ExportVideo` (`CameraId`);

CREATE INDEX `IX_Filter_ResourceTypeId` ON `Filter` (`ResourceTypeId`);

CREATE INDEX `IX_FilterRule_FilterId` ON `FilterRule` (`FilterId`);

CREATE INDEX `IX_LaneDetails_ANPRWithSpeedParameterId` ON `LaneDetails` (`ANPRWithSpeedParameterId`);

CREATE INDEX `IX_Node_FilterId` ON `Node` (`FilterId`);

CREATE INDEX `IX_Parameter_RedLightViolationZoneId` ON `Parameter` (`RedLightViolationZoneId`);

CREATE INDEX `IX_Parameter_RoiId` ON `Parameter` (`RoiId`);

CREATE UNIQUE INDEX `IX_Parameter_ResourceAnalyticsId` ON `Parameter` (`ResourceAnalyticsId`);

CREATE INDEX `IX_Parameter_GreenLightRectId` ON `Parameter` (`GreenLightRectId`);

CREATE INDEX `IX_Parameter_RedLightRectId` ON `Parameter` (`RedLightRectId`);

CREATE INDEX `IX_Parameter_YellowLightRectId` ON `Parameter` (`YellowLightRectId`);

CREATE UNIQUE INDEX `IX_PlateRoi_EventLogsId` ON `PlateRoi` (`EventLogsId`);

CREATE UNIQUE INDEX `IX_ResourceAnalytics_DeviceId` ON `ResourceAnalytics` (`DeviceId`);

CREATE UNIQUE INDEX `IX_Resources_ResourceName` ON `Resources` (`ResourceName`);

CREATE INDEX `IX_Resources_ResourceTypeName` ON `Resources` (`ResourceTypeName`);

CREATE INDEX `IX_Resources_UserId` ON `Resources` (`UserId`);

CREATE UNIQUE INDEX `IX_ResourceType_ResourceTypeName` ON `ResourceType` (`ResourceTypeName`);

CREATE INDEX `IX_Rule_RuleSetId` ON `Rule` (`RuleSetId`);

CREATE UNIQUE INDEX `IX_RuleSet_ActionDataId` ON `RuleSet` (`ActionDataId`);

CREATE INDEX `IX_RuleSet_RuleSetsId` ON `RuleSet` (`RuleSetsId`);

CREATE INDEX `IX_UserResources_ResourcesId` ON `UserResources` (`ResourcesId`);

CREATE INDEX `IX_UserResources_UserId` ON `UserResources` (`UserId`);

CREATE TABLE public."UsedPassword" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "HashPasswords" text[] NULL,
    "UserId" integer NOT NULL,
    CONSTRAINT "PK_UsedPassword" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_UsedPassword_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers" ("Id") ON DELETE CASCADE
);

