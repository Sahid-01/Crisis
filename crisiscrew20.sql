-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 08:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crisiscrew20`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `assigned_tasks_view`
-- (See below for the actual view)
--
CREATE TABLE `assigned_tasks_view` (
`assignee_id` int(11)
,`volunteer_firstName` varchar(255)
,`volunteer_lastName` varchar(255)
,`task_name` varchar(255)
,`task_description` text
,`message` text
);

-- --------------------------------------------------------

--
-- Table structure for table `assignee`
--

CREATE TABLE `assignee` (
  `assignee_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignee`
--

INSERT INTO `assignee` (`assignee_id`, `task_id`, `resource_id`, `id`, `message`) VALUES
(1, 1, 1, 1, 'Please complete this task by the end of the day.'),
(2, 2, 2, 1, 'This is an urgent task. Please prioritize.');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `name`, `description`, `location`, `date`, `address`) VALUES
(1, 'Annual Charity Gala', 'Fundraising event for local charities', 'City Convention Center', '2023-05-20', '123 Main Street, Cityville'),
(2, 'Tech Conference 2023', 'Conference on the latest technology trends', 'Tech Park Auditorium', '2023-06-15', '456 Tech Avenue, Techtown'),
(3, 'Community Cleanup Day', 'Volunteer event to clean up the neighborhood', 'City Park', '2023-07-10', '789 Green Lane, Greenvale'),
(4, 'Art Exhibition Opening', 'Opening of a new art exhibition', 'Art Gallery Center', '2023-08-05', '101 Art Street, Artville'),
(5, 'Community Festival', 'Annual community festival', 'Cityville', '2023-09-20', 'City Park, Cityville'),
(6, 'Food Drive', 'Food collection drive for the needy', 'Cityville', '2023-10-15', 'Community Center, Cityville'),
(9, 'Sports', 'This is fjklsd', 'bangalore', '2024-03-01', 'CMRIT college');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`resource_id`, `task_id`, `name`, `description`) VALUES
(1, 1, 'Fire extinguisher', 'Fire extinguisher for emergencies'),
(2, 1, 'water', 'Water hose for firefighting'),
(3, 1, 'Fire blanket', 'Fire blanket for safety'),
(4, 1, 'First aid kit', 'First aid kit for medical emergencies'),
(5, 2, 'Rescue Equipment', 'Rescue Equipment for evacuations'),
(6, 2, 'Flashlights', 'Flashlights for visibility'),
(7, 2, 'Communication Devices', 'Communication Devices for coordination');

-- --------------------------------------------------------

--
-- Table structure for table `task_event`
--

CREATE TABLE `task_event` (
  `task_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `task_description` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_event`
--

INSERT INTO `task_event` (`task_id`, `event_id`, `task_description`, `name`) VALUES
(1, 1, 'Set up event banners', 'Banner Setup'),
(2, 1, 'Coordinate transportation', 'Transport Coordination'),
(3, 1, 'Manage guest list', 'Guest List Management'),
(4, 1, 'Create event schedule', 'Schedule Creation'),
(5, 2, 'Set up stage equipment', 'Stage Setup'),
(6, 2, 'Prepare catering services', 'Catering Preparation'),
(7, 2, 'Coordinate security arrangements', 'Security Coordination'),
(8, 2, 'Manage event registration', 'Registration Management'),
(9, 3, 'Set up event signage', 'Signage Setup'),
(10, 3, 'hello hi how ', 'Audiovisual Coordination'),
(15, 9, 'xitto', 'Carry Post');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('sowadrahman', 'kikhobor'),
('admin', 'admin'),
('tanvir', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `skills` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `firstName`, `lastName`, `email`, `contact`, `username`, `password`, `address`, `location`, `gender`, `bloodGroup`, `DOB`, `skills`) VALUES
(1, 'John', 'Doe', 'john@example.com', '1234567890', 'john_doe', '1234', '123 Main St', 'Cityville', 'male', 'O+', '1990-01-01', 'First Aid, Fire Safety'),
(2, 'Jane', 'Doe', 'jane@example.com', '9876543210', 'volunteer', '1234', '456 Oak St', 'Townsville', 'female', 'A-', '1992-03-15', 'CPR, Disaster Management'),
(3, 'Sarah', 'Smith', 'sarah@example.com', '9876543210', 'sarah_smith', '5678', '789 Oak St', 'Townsville', 'female', 'B+', '1995-06-20', 'First Aid, CPR'),
(4, 'Michael', 'Johnson', 'michael@example.com', '1234567890', 'michael_johnson', '9012', '456 Elm St', 'Cityville', 'male', 'AB-', '1993-09-10', 'Disaster Management, Fire Safety'),
(5, 'John', 'Doe', 'john@example.com', '5555555555', 'john_doe', '1234', '123 Maple St', 'Villagetown', 'male', 'O+', '1990-03-15', 'First Aid'),
(6, 'Emily', 'Williams', 'emily@example.com', '7777777777', 'emily_williams', '5678', '789 Birch St', 'Suburbia', 'female', 'A-', '1997-12-05', 'CPR, First Responder'),
(7, 'David', 'Brown', 'david@example.com', '3333333333', 'david_brown', '9012', '101 Pine St', 'Hometown', 'male', 'B-', '1988-04-30', 'Fire Safety, Disaster Management'),
(8, 'Jessica', 'Anderson', 'jessica@example.com', '9999999999', 'jessica_anderson', '5678', '456 Cedar St', 'Metroville', 'female', 'AB+', '1992-08-25', 'First Aid, CPR'),
(9, 'William', 'Jones', 'william@example.com', '1111111111', 'william_jones', '1234', '555 Oak St', 'Villageton', 'male', 'O-', '1991-02-18', 'Disaster Management'),
(10, 'Olivia', 'Davis', 'olivia@example.com', '8888888888', 'olivia_davis', '5678', '789 Redwood St', 'Smalltown', 'female', 'A+', '1998-11-07', 'First Aid, CPR'),
(11, 'Daniel', 'Miller', 'daniel@example.com', '4444444444', 'daniel_miller', '9012', '987 Spruce St', 'Countryside', 'male', 'A-', '1996-05-12', 'CPR, First Responder'),
(12, 'Sophia', 'Martinez', 'sophia@example.com', '6666666666', 'sophia_martinez', '5678', '321 Birch St', 'Countyville', 'female', 'B+', '1994-10-02', 'Fire Safety'),
(13, 'sahid', 'aftab', 'sahid.aftab2016@gmail.com', '8861929686', 'sahia21cs', 'sahid', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2024-02-22', 'Fire Suppression Techniques'),
(19, 'sahid', 'aftab', 'sahid.aftab2016@gmail.com', 'sa', 'sa', '11', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2024-03-01', 'Fire Suppression Techniques'),
(20, 'sahil', 'Jadhav', 'sahil@example.com', '1235454987', 'sahilvalu', '1234', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2024-03-01', 'Fire Suppression Techniques, Emergency Evacuation Planning, Incident Command System (ICS)'),
(21, 'shivan', 'Rana', 'sahihfai@cafs.com', '123456789', 'Shira', '12345', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2024-03-01', 'Fire Suppression Techniques, Emergency Evacuation Planning'),
(22, 'sahid', 'aftab', 'sahid.aftab2016@gmail.com', '8861929686', 'sahid10', '12345', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2024-03-01', 'Fire Suppression Techniques'),
(23, 'sahid', 'aftab', 'sahid.aftab2016@gmail.com', '123567899', 'luci', 'luci', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2003-07-19', 'Fire Suppression Techniques'),
(24, 'sahid', 'aftab', 'sahid.aftab2016@gmail.com', '123567899', 'luci', 'luci', 'AECS Layout\\r\\n521', 'bangalore', 'male', 'b+ve', '2003-07-19', 'Fire Suppression Techniques');

-- --------------------------------------------------------

--
-- Structure for view `assigned_tasks_view`
--
DROP TABLE IF EXISTS `assigned_tasks_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `assigned_tasks_view`  AS SELECT `a`.`assignee_id` AS `assignee_id`, `v`.`firstName` AS `volunteer_firstName`, `v`.`lastName` AS `volunteer_lastName`, `te`.`name` AS `task_name`, `te`.`task_description` AS `task_description`, `a`.`message` AS `message` FROM ((`assignee` `a` join `volunteers` `v` on(`a`.`id` = `v`.`id`)) join `task_event` `te` on(`a`.`task_id` = `te`.`task_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignee`
--
ALTER TABLE `assignee`
  ADD PRIMARY KEY (`assignee_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`resource_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `task_event`
--
ALTER TABLE `task_event`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignee`
--
ALTER TABLE `assignee`
  MODIFY `assignee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `task_event`
--
ALTER TABLE `task_event`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignee`
--
ALTER TABLE `assignee`
  ADD CONSTRAINT `assignee_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task_event` (`task_id`),
  ADD CONSTRAINT `assignee_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`),
  ADD CONSTRAINT `assignee_ibfk_3` FOREIGN KEY (`id`) REFERENCES `volunteers` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task_event` (`task_id`);

--
-- Constraints for table `task_event`
--
ALTER TABLE `task_event`
  ADD CONSTRAINT `task_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
