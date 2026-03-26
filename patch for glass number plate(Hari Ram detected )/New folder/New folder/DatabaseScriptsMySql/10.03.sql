Alter Table `EventLogs` ADD `_AttachedImages` longtext CHARACTER SET utf8mb4 NULL;
Alter Table `Category` ADD `ArcheivingInDays` int NOT NULL DEFAULT 30;
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
Alter Table `Paramter` ADD `NumberOfImagesToSave` int NULL DEFAULT 1;
Alter Table `Paramter` ADD `FrameIntervalBetweenImagesToSave` int NULL DEFAULT 5;
Alter Table `Paramter` ADD `MarkPlateAsViolationOnlyIfInsideRedLightViolationZone` tinyint(1) NULL;
Alter Table `Paramter` ADD `RedLightViolationZoneId` int NULL;
Alter Table `Paramter` ADD CONSTRAINT `FK_Parameter_Rectangle_RedLightViolationZoneId` FOREIGN KEY (`RedLightViolationZoneId`) REFERENCES `Rectangle` (`Id`) ON DELETE RESTRICT;
CREATE INDEX `IX_ExportVideo_CameraId` ON `ExportVideo` (`CameraId`);
CREATE INDEX `IX_Parameter_RedLightViolationZoneId` ON `Parameter` (`RedLightViolationZoneId`);