Alter Table `Parameter` ADD `DrivingWithoutSeatBelt` tinyint(1) NULL DEFAULT FALSE;
Alter Table `Parameter` ADD `DrivingWhileOnTheMobile` tinyint(1) NULL DEFAULT FALSE;
Alter Table `EventLogs` ADD `NoSeatBelt` tinyint(1) NOT NULL DEFAULT FALSE;
Alter Table `EventLogs` ADD `IsDrivingWhileOnTheMobile` tinyint(1) NOT NULL DEFAULT FALSE;
ALTER TABLE `EventLogs` ADD `IsNotValid` tinyint(1) NOT NULL DEFAULT FALSE;
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

CREATE INDEX `IX_ChallanDetails_EventLogsId` ON `ChallanDetails` (`EventLogsId`);