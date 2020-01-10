-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 10:04 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `showstudent` ()  select * from student$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `studentcount` ()  select count(*) as total from student$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `cid` varchar(20) NOT NULL,
  `class` int(11) DEFAULT NULL,
  `sec` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`cid`, `class`, `sec`) VALUES
('1A', 1, 'A'),
('1B', 1, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `sid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `contact` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`sid`, `name`, `addr`, `contact`) VALUES
(1, 'raj', 'mysore', 8585858585),
(2, 'abc', 'abc', 121212121212);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `name`, `dob`, `addr`, `class`) VALUES
(1, 'raj', '1999-03-10', 'hunsur', '1A'),
(2, 'sudeep', '2019-11-15', 'kanchibailu', '1A'),
(111, 'hiii', '2019-11-13', 'abc', '1A');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `addstulogs` AFTER INSERT ON `student` FOR EACH ROW insert into addstulog values(null,new.sid,'ADDED',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delstulog` BEFORE DELETE ON `student` FOR EACH ROW insert into delstulog values(null,old.sid,'DELETED',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sid`, `sname`) VALUES
(3, 'maths'),
(2, 'social');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sub` varchar(20) DEFAULT NULL,
  `phone` bigint(10) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `name`, `sub`, `phone`, `class`) VALUES
(111, 'ramesh', 'maths', 5645654664546, '1A');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `cid` varchar(20) DEFAULT NULL,
  `tt` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`cid`, `tt`) VALUES
('1A', 0x89504e470d0a1a0a0000000d49484452000001ed0000026e0803000000aaa6aa220000009f504c54450071bbffffff006cb9006fbaf5fafd5fa0d14893cb72aad5097ec1006ab80068b8e2ebf46fa4d277a5d20074bd91bbddedf4fa3e87c42082c32579becbdced9dc6e38ab7db4f90c87bb2dad7eaf5f0f6fa0064b6b7cce5e3f0f85895cb478dc8b5d3ead5e1ef348dc85299cdd2e6f390bfe0a9cbe5bfd6ea2886c568a0d0abc8e386afd7c2ddee0060b48bb9dda2c8e49dbadc005bb3a1bede8cc1e16699cc1435b52700001bc549444154789ced9d0d7ba2badab635c12ad445156b5b75d13ad5aaadeee97ae69dffffdb5e11a47c240806a2f1beceb58f63cf4c91869cde21df69b5011d5a974e00d0086c5302b62901db94806d4ac03625609b12b04d8902dbfeeedfa7cebbd703c6b079ef3cfdfbe857b73def7bae6d330e8c8231db1df697956c4fbfbcd95e740b18c85ef9cc5b4f4bdb7e7cb561da68385f4ccad99e761d76e9d40245f645fa8b55c2b6ffca10d83700b73f73d5b59ceda587c0be11ecb76c699eb53d81ecdbc1def885b6071bc8be21d8eba0c0b6b580ec9bc2fe2cb0dd85ec1bc37e90da5ea2997d6bf0d14462dbfa4468df1cac23b1bd465fe90d329b886ddf21b46f10bb2bb4edcf2e9d30d000bcb714d97eb22f9d30d004ec4b60db7ac55bfb26610b81ed8907dbb7892bb08d1af9adf2532bffb1fd85d7f68de2ccf3b65149bb55ec8fbc6df491df2aec256fbb03db370aebc2361d609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94b80edbdc6074e7950ad7609bf70cc63349f735d8b6efdb06e31aa4fb1a6c3b66dbd69b594ac0b62a88ed6a186e5b6f662901dbaa20b6ab61b86dbd99a5046cab82d8ae86e1b6f5669612b0ad0a62bb1a86dbd69b594ac0b62ab05d0dc36da324af84e1b6f5669612b0ad0a6c5703b67501dbaae0bd5d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b65581ed6a186e1b2579250cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b65581ed6a186e1b2579250cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5560bb1a86db46495e09c36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5560bb1a86db46495e09c36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15d8ae86e1b6519257c270db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15d8ae86e1b6519257c270db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b6ab61b86d94e49530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b6ab61b86d94e49530dcb6decc52829eed0777542b06853641db4f36af15bd79a5063ddb0f9a9fee9a806d4ac03625609b12b04d09d8a6046c5302b66b83d9eab0669befb05d17bcffa24eb7d9ae39d8ae0b7b5243e2066fb05d2bb01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c6cd70c6c07c0b61ab05d0ed88e81ed9a81ed00d85603b6cb01db31b05d33b01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c6cd70c6c07c0b61ab05d0ed88e81ed9a81ed00d85603b6cb01db31b05d33b01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c01dbf64dd866b05d2e0ddb078dbc36949fbcfba4ce4baf99c4455c83ed16b335d258f0b03a682a715112afc136d0046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b0ad1b1efcc779f007edc0b64638633673dd51afe7f5466eb0688271adceafc5361750e5dae4c7aae5e089bb15fea62abf8539b6b7e87ead778f8fcbe564b97cdcadbf1e3a9bd6ccd667fc4a6cf3611e5776b1e0da182f881aceca078d5b74b76246652ded637af4dc9d4fdb22261fafbde6962ba5b912dbcc1a64b19ec559c0dd65eeda187f3259eed6f37ffff437ae534639f726f2bb9da05f2a9f38b7f9e26b29347d14fee7ddd112e0d7619b33411e486dfb453977c49a2e3f169e7b2a6ab8278eb83274cbe413e36f1f53eb646ae7cf2d0db97eb3b6c34c5c6fbde2a8e1dea0f4ddb294b0cd9cc5aae4dde6cfcd97e7b76d7bcf6035e405cfd3a86dceefd627c33ac61abb4d67fccddbde33efc8a3a641db9c6dcac67584ffe9a8e5e32928d86e5bab1e93f86ece36b7bb956f6d3d29676521246c076674db669bc7336ef9a09e974550b1dd1e8ba3bb29dbcee69c54ce6545504d90b1ddde093b439ab1cdeddf92cf4cfde5e3faebfbe161fcb8bccf36fee64df79dd3b1dd5ebb821baad8decaf289db4fc20ff8dfdbd7a1eb3887dd7e1cd77bddae933f5e96ee9c3b97ebb01d746d07ffd9ddc4c397b1bddebc67b8eb74c78ff7bec8e1ee94ed173b4844384ad592fff1f817a91bf69dffe5d6b2eb72c612dd7b3cf8abdb591f13d0bcec6bb11d8d4d54b6fdaf931da9606c1f36acf7b6fd93dfadee232f286bbb8e4111fe9097bd5aec5bfda24f307bf37078a0c1b0f96cbf16db516afea96adb165f13587787abec8bb19fbb3c63bb8667e06c9c556dad875c5effe2cc1d0fdad337323da7716a6ab21d5ec86def2bdd95e5e79e2c6dbb8e0777baed0c93c5893e516e6f565a32fd866d07d7f2d7f41eaa0fd9eb6b8f6df69a2d50c6a3d3f9596db0fc6c6edbf6fe8e6eaa93c31f666e5a776c732fd36218f46717989224e1d66db7f8685714dc35c736b7536daa7dfbfafd9aa67dddbced7d21998ab64c9159736cb397b4eca5774db209d86eb1cf64556d917eb87a639b0fd3ed7cffba6453b0ddb2bf12777d4c7fa2d6d8e62c3d2169d2bb2ed9246c732f71d7fb1e4fffac46db763f25dbd2d05f520d0ab65bb34445cdfa9b7aba3a6df35ebafbeeeeda64d3b06d27eb4edbc66cb374bfca9fab934dc3367f4ed4d3be0b4a72a55a1a67a97e95e5f534b36368d8f61245ec2ed506ab31b6ed74eb4b47bf775568d84e76a84d5a72db2ab1cd47a90af9ea0a65d3b0dde2891e2ecb6d26b6d96752f620db457b15d0b06dff9bb86f816d95d8b6e749db1f750c9ed60e11db7f12f7ed3512db7c94946d9d7fa32621623b399b64d3486ca7a6ddb4c75719da546c2763fbbd91d8b67f257ec55492f64b43c476b2a7bc20b6cf7ff0f4b8f6e325b6d9280111dbc951e782f7f6f9e56f2ae5edee7516e4346cf3640bac3d4afda8aed84e4d2a966e2b716148d86e253b3e8adadb6787246f25bb5696b373efd330246ca77a4e8bfad2ce7f703719dad7d9d86e51b1fd9ab8edba895111fe9eb4fdf71a7b4d0348d84e8d578c9b18f14cb5b673135baf0612b69de4b4d37f0a6c9f1ddb4eb2dbf4b1f9055d6742c2364fdc75f05c50929ffde0ceafc4aff8f75a0b7212b653d37e276e03ef6dce934b52720b52ae0602b6f928395dec3bbd914d3db1cd7bc99eb4ebdd279680edf478c55dd1ea81dcfae0926b79f97b721ef9fbb5beb609d8e66e72f1809fd9a32a657bfcfc5a8ae76c5f19eb247e87d583ed72a969601d989ddab4ac701d98352d85b5f4324963fda4ed525be5d4b33572456edd7666ed7cf11acfb2dce76c27d36d95e937753d39a3d31f3f931bb7cd9df47e37e3eca39d657b92b56d6f133ff54bd8e6effe44caf8f4e7cfe4b66ddba3f4de93d3e27d5734dabe2bb8fdbcb1d1f11bb6cd99ddc96c0b9e1f77aec736fb2ff9d3129b95c276ab4edb9cdbee5d66e57c7b9dcfc69a623b697b59c6f6bbf4e6b09d44b883d6cf4f0fe78ad84eeb6e9bda93216020681ac1b649b679d8f44db45e5c77f4feb2ceed2ab9e753501034f0debe47495e3235556d5bfe2e60befa3eb05acd774bd9c698c27e51d4d20cb25d01f126c635b5b793b6a7b05d32358dd9b65ec43bd4a56caf9f4af1d0cd0e60a77b57f0de2e999ac66cf725dd99e95191995d8adcbd521bf958a2bd92b3bf16b19dd9dda046db3b4fda52ab677cfb2e5129b4362564f1599affddfd7c5f60fb87eab6ad07f9613c358d6f6f926fff73f65b610b82b61b28c9072bb76050aaa6d81e25e7ae943a152e0349dbb5c7b6ff6758b881705d734e93b6bfcef8d290b45d6f6c4f1ffb45717db85b4d734e937be70a8fb438016c2bd9f677aba78d73f249ea8aed8fc4afce75be9480a4edaa25797eb6893f59aec72f9d376fc4cb9c8b59536cb34ef29bf65a3d0361bb4c3ff9ffcdb238c1993ca58fdfae29b6539b6b9eb30e0cb6eb5be329a7ae75606e721466527d8d2749dbc9fee637fdb6cf8f6d9e1a5fad3eeb14b60d8aed164b9d0af5a7f28d28dab64d8dedcce13193cac14ddeb6645dec75dae6bdd4e1449f55ef44d276723ef0056c2bdccd494d82f3cbb4fe9290b49d98df651915db7b5d49db8253054f7d9ca0edc42e76b27d61af34b6b99d9a04939bde72028ab65962173b5f925f571adbe9dd35dbedef6a29a3689b2796762c25cba1ae34b65bfc393dcdb5da28f7add80e4e990e39d99bc9ddc4f6253bc9ee25d71adbe92df8f6adb04abbafdc886df7ee87532381a9edfb65cf7cadb1dd6299b966df55d6e6de88ed51a27c3bb5b3542aebbf24a9b8d6d84e1f4455f5cb7323b693b33a4e8d04f26122affe93e4d5d5c676e6ac89767b7a57fe7e37623b39abe3d41eedc95decacbe71b1cd5ba9c326f68dc845e91bde88ede44618d94d4fb224f7989bcaf6aab95edb2d965d13e04b6736e73e7a1bb653b33a8abfebbc9798837f2f9b5076bd25f9feeb9a6e73efa35bb4d25044f22d60b0edd4ac8ee2e7488d89ac65e5c015c776766ca41dbc909c527bee94698da8d3bc6d37b9379dec657cb832b58b9d7452f635c776e6acef03abd1e9ec646eb23a6fb0edf4aefc7e41937b962a06a5fdccd71cdbb9fed38065c73931cdd9dea4da6e26db4e8ff3afa53d4ce94124f99cecab8eed56cbcdd4cb0ffa9e5b72df9c8dfae902c164db9c2567d6b7972de1ddb9b3488d213dc9576e5d756cef6f987d751f042e9870c49b737bb45d662f36d87676e4f77123786eced32f3c5f3ed5a749db0eab86f071df049b80b4adfb97a1cb536b8139b399fbf691bfda68dbe9f399f6ad92a7919de942767a99f2afe088a5066daf3efbd5f044b7647792ed1e96abed6233720e13de9d19f33adbef6c58df806dfe9679fcc187c70f6362c1fe47fbff777f6716fb1455e61ab4ddb62a22cea94c6196c41adcdfff7a9caf568ff7f77eaefa7e13b65b763ff74493efeddf37af3772bdd76dae5e631575a83769bb2a929cb217e76d0d1361b8ed9633163c94e5fbf7938968ababc2da9201b65b6ca8a2db74db9ce59ba17256850b6b4cb0dd62eeeaf4a765986ebbc505bd0e32be8b273d18617befeb49f65a3e89f1b6f7ba5f45edd03cd6cb898132336cef1fb897dd66b51c56db7cdbfbdfb429f3f4fee2d4cefd86d80ec2fb6572fa164926f3876dfff3f359f199e4689c73caf9e2f144e9361d9f1e4230c6f6beb6e2f6850d6a118375c773830e1756eaa08af3d039c39833be288a6f6bbe28b1a0a66edba29eafb29cca296ef3eebcccfb7bb7f51cd6e8912207f4ce27e7ac35fcb8173fbe3ff678995f5cb7edfb7247c708399d53fb6fb8d7953c7188359877bd539b01d584eed503c1dee19bee6a374965c074f9b5759d725fed7a6db75a3d05ca6c9eb47f627bb39d2f05c6adc9fa6bfbce9d6c4772635c62adc8fefbee7ac3d7eeefefdd6e176c89f33c1c898788849f76e7bb98a71ac6284b9ef8263acaa9749a6d3e1abe75ba1fe3d57cbd5bcf57e38f976ee775d8739936d301975a1914f48fdbf66184a0c42292f4470f1f0bb9da1333f3844f1ca63dd819f7304ea0d174c075ad0303cd02db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac0362544b68b8e4d062663bfe46d4b8fbe0686c39ef2b61f0cda071a54c1fec8dbae61437f709538ebbcedb5ee4dd28126667edef66403db37091fb5f3b6db7f514dbb495847647b8c17f74dc2d622db83c2437281a1706f22b28ddeb49b846ddb42db8f8d9d120b2e06777cb16d74a7dd203f9de459db7e99330b8149f0e14066bbbdd2738c28d00567f3b6d436caf21be367f84b64db7a87ee1bc25e4c8b6cb707d07d3bd8cf9943e5b3b6dbfe065d6ab701b79ffdf609db6dab839ada2dc07937e7366fbb6d3d38a89a9b0eb7f938af56607b5f9a7f72bcbd8d86b99f038158a1ed767bbe98d90cd31b4c847366db8b47a15689ed7d7c8f5f7bdcb6d9de393005b617ddf25ec7538954a9ed3d93f99fede7e20e18c3a2bffd9a4fe4468b6c0758c0244ed83c651bdc12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6c48fed877e1d7cfebadcb3dc1eebcf5a9c7c1feff763fbce6635e0880fa2026731766a71121ff1f8637b51cbf17e0cb66b645c8f13d83602d8a6046ceba3c4716a0d03db5a98ee56ff6dfb9f9ffd7fb6ffad9617730edbc53cbdbf05bcf745071247dc8597bc48245afef86ee41e4eac65c131a8dc1d75d605b76b10d82ee4be179e29ccecb5fc227eb8c67e15dab6e69d56fa30eae0768ef75070186a63c07621dff6311d0bf945ad834af657647b3e6c31d1b1e39c8dc6fa0b74d82ec48b4d39bef422b9edc73b5b7ac43c77de964d265d046c173199c509b17f4baf92da1e8f1279101d609e7cb6debcd1d4e781ed22ba769c103e9406b7c4f6b4338bddee5ffceee6f9f9f579d8db57d3e27f75be9a7e8234b05d803f0cc4b8bd3025d27a9ad8f674117f55d8acf7b25efa83c174e04f1e7ff79c9f57b9dee886ed02be0ebebcff373aa4e45d7699d0b6b5892b78a36de605bdfc3c96e85cfe1d6a02d82ee0f008fb223cacab49eb6922db56f7f8f8ce42f0082b37fa31dfe86c79c3b61cff5047639df6cb214ced17c97522db4f516473f7437cef4d14dd76bff674cb816d39bf43c9e3f6e341bbb49e26b0bd8caa625cfa629e448d3bce3596e5b02d65fa1616e0f7fb7770e8535283cedb9e3e870fcf5db9ca49545593d707ea07b6a5ac0f16f9a67d2c97d99df8c2bcedef4836ff167fe2c04358d873a6af5e0edb52c27a96bdddff71ed86612eeefccad9b67a51d8768aee3f788eaeea6beb42856d198330b45b41596c85853a13d7a872b6c7ce21ed7c24ef6d0d98473934d2364002db32be0fcaa2aa595861e39e505fd676f4dd68b18713bf222c02f86c5c67ba8b806d19877eb4961d3e991fbe63d91fd19559db51b9cf4fc6ecd8e1b6337afe47db8b1bb625ec460765b35df8d7bbc3d3b03bd12b366b3b6a6b4bcafd0413be7959df6bec5e816d09db43f2b917fdf5dff0698ef253646c5b514bda115d7b59605bcc3454663f457f8f3a4384b5ec8cedfba88ec62f3ce550006c8b5985ca46719b2beaf716bd8b33b6c751415ed8fcba0cb02d267a4fffcc35db85131b44f5b48cede87b619faa915f00d816b20cabd5f6eae79fa2e6d27bbe5295b11d56e6b5f67f9705b6853c8475343bf1ea8d3a3a05934fd3b6a3373eef699f75761ad8163178cbd7c996a33041f9c9a769db93f0ba82994d9703b645acc3ae339efce5d6df30de5bb97a5adaf62eb2fd7c7d5572d816d209c5bea5ded1aba8aefd94bd3a633b7ce5b3574d69ad026c0b1884d3c632fddc56f8af7c98ada7a56dcf23db7f3525b60ab02dcd14ce336576276a5a65bbb533b6a3bf7eea496b25603bcff435b49d9d54f2180577f6df61db64dbbfa2b90bd98949f1f4834ccc8b6da3243fe3ce17b0dd8d064472fd28612b3cf1b42169db6bbcb7cfbff3056c8705b6fd4fee079356544f4b37a5512737d8763820c25dc18065f44c76ba8c4fdb5e1edbdb531d89ad066ce7f80c13def3077e864134bc759887fa43da76b4b2047d69e7dc59bbed28365bad91806881477af2a9785404fde467dc59bbed877869260f34f2e37fe1ff659ff7f0cc69db8ba887156360d5efacdd764fb6994202ee251b6119dbbfa3c132e18cc5cb02db1976b3d3893a2c0efb21637b174e7b393d09b1dd9ecef5eea605db19faa5929daaa7656c47bdecbc77fa97adf9e8ad3bd737e914b6d31c975e324742f454c9c9a7d939a7d193cf4e57d39e58b09b96e3152d17ab13d84ef3759c54f64b42d43e4b768367e793ff17bdb865ebbd63a20ef996235ee35d3fb09de63d0c6d57fa3a5d47fd693fb35173b68ffd2bb9a1d12cd1304bd1ee5cf502db29262797790c865151ff53e5cead037b8ee6219e5af113cd4ecd74d634086ca708b7cc2a6c2b47eb7eb817877f6e8d6734199dbf17779efad1060eb6b67db4603b4914b885bd9ed1529096137f2372b6a76ea4b1b8f6750c6defbe86a49702b6937c45c35f85f5abe8c17e766ac8efcd100d8d265fee79e6d15b3b3fd1ad31603b81f559a6edf4755c647fbc2a6fdb3fb6e3dee41535df3d76dae91b3e81ed04f751bf4871adc91f666252b0a7d27754dcb33bd9abdb8f36e26931f906aab503db098e3ddc275670c5efdb287045fba5bd1d5dde89cb89c9f078c19bc67170d8fee1b8f0baf06dbb671905ee71f2a9c8f6f238b8c2462b41db7dee1d73a7608fadfa81ed1fe6226d22a27d0cf95bf857e1c7e6c7ad8ab9b3c9f6843f7e3ac71fdababad10ec0f60f5109ed9cecb5fe1335b95b612120fe923cc53b53733e7cf9292e06abd778db726e672634360c6cc7dc873353520b3bc5c44327dbc35f2545c24fd6726e3bf67bffe5f7d3cbc29b393fff6e6f1b791229b01d13f580159d2072e433554f93bd001e7ef69d0f8c339bedff97fc27bbab7965206cc71c03b644b56917cd66720e931aa4affbe55bd277eed146ba0f9a80ed98253fdd6b1ae386a90b5be6f2ca9ddfb525be399b75f44f5384ed23dba843b4d4ab346a99b75830a9a1a82a7fdff7ecfc1151dc761797d85f0bb623fcdeff6601ff2b65e1179b855707931aa23f4a960b4cfe2c9863331ec3ec99f77499bdd460fb881551ed6aabcc27a7bbdf9db7a1e7f57a9e377cfb1c4f2eb56d036cebc2f2fdc964e25f74bd106c5302b629d19cedbbf00462451cd8ae91b1538b1381ed877feaa0af6d160f05d6fd5aa4c40309ada25f066e0cd8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4afc7f3f6fcc663f7529f40000000049454e44ae426082),
('1B', 0x89504e470d0a1a0a0000000d49484452000001ed0000026e0803000000aaa6aa220000009f504c54450071bbffffff006cb9006fbaf5fafd5fa0d14893cb72aad5097ec1006ab80068b8e2ebf46fa4d277a5d20074bd91bbddedf4fa3e87c42082c32579becbdced9dc6e38ab7db4f90c87bb2dad7eaf5f0f6fa0064b6b7cce5e3f0f85895cb478dc8b5d3ead5e1ef348dc85299cdd2e6f390bfe0a9cbe5bfd6ea2886c568a0d0abc8e386afd7c2ddee0060b48bb9dda2c8e49dbadc005bb3a1bede8cc1e16699cc1435b52700001bc549444154789ced9d0d7ba2badab635c12ad445156b5b75d13ad5aaadeee97ae69dffffdb5e11a47c240806a2f1beceb58f63cf4c91869cde21df69b5011d5a974e00d0086c5302b62901db94806d4ac03625609b12b04d8902dbfeeedfa7cebbd703c6b079ef3cfdfbe857b73def7bae6d330e8c8231db1df697956c4fbfbcd95e740b18c85ef9cc5b4f4bdb7e7cb561da68385f4ccad99e761d76e9d40245f645fa8b55c2b6ffca10d83700b73f73d5b59ceda587c0be11ecb76c699eb53d81ecdbc1def885b6071bc8be21d8eba0c0b6b580ec9bc2fe2cb0dd85ec1bc37e90da5ea2997d6bf0d14462dbfa4468df1cac23b1bd465fe90d329b886ddf21b46f10bb2bb4edcf2e9d30d000bcb714d97eb22f9d30d004ec4b60db7ac55bfb26610b81ed8907dbb7892bb08d1af9adf2532bffb1fd85d7f68de2ccf3b65149bb55ec8fbc6df491df2aec256fbb03db370aebc2361d609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94b80edbdc6074e7950ad7609bf70cc63349f735d8b6efdb06e31aa4fb1a6c3b66dbd69b594ac0b62a88ed6a186e5b6f662901dbaa20b6ab61b86dbd99a5046cab82d8ae86e1b6f5669612b0ad0a62bb1a86dbd69b594ac0b62ab05d0dc36da324af84e1b6f5669612b0ad0a6c5703b67501dbaae0bd5d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b65581ed6a186e1b2579250cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b65581ed6a186e1b2579250cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5560bb1a86db46495e09c36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5560bb1a86db46495e09c36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15d8ae86e1b6519257c270db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15d8ae86e1b6519257c270db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b6ab61b86d94e49530dcb6decc5202b655416c57c370db7a334b09d85605b15d0dc36debcd2c25605b15c476350cb7ad37b394806d5510dbd530dcb6decc5202b655416c57c370db7a334b09d85605b6ab61b86d94e49530dcb6decc52829eed0777542b06853641db4f36af15bd79a5063ddb0f9a9fee9a806d4ac03625609b12b04d09d8a6046c5302b66b83d9eab0669befb05d17bcffa24eb7d9ae39d8ae0b7b5243e2066fb05d2bb01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c6cd70c6c07c0b61ab05d0ed88e81ed9a81ed00d85603b6cb01db31b05d33b01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c6cd70c6c07c0b61ab05d0ed88e81ed9a81ed00d85603b6cb01db31b05d33b01d00db6ac07639603b06b66b06b603605b0dd82e076cc7c076cdc076006cab01dbe580ed18d8ae19d80e806d3560bb1cb01d03db3503db01b0ad066c9703b66360bb66603b00b6d580ed72c0760c01dbf64dd866b05d2e0ddb078dbc36949fbcfba4ce4baf99c4455c83ed16b335d258f0b03a682a715112afc136d0046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b0ad1b1efcc779f007edc0b64638633673dd51afe7f5466eb0688271adceafc5361750e5dae4c7aae5e089bb15fea62abf8539b6b7e87ead778f8fcbe564b97cdcadbf1e3a9bd6ccd667fc4a6cf3611e5776b1e0da182f881aceca078d5b74b76246652ded637af4dc9d4fdb22261fafbde6962ba5b912dbcc1a64b19ec559c0dd65eeda187f3259eed6f37ffff437ae534639f726f2bb9da05f2a9f38b7f9e26b29347d14fee7ddd112e0d7619b33411e486dfb453977c49a2e3f169e7b2a6ab8278eb83274cbe413e36f1f53eb646ae7cf2d0db97eb3b6c34c5c6fbde2a8e1dea0f4ddb294b0cd9cc5aae4dde6cfcd97e7b76d7bcf6035e405cfd3a86dceefd627c33ac61abb4d67fccddbde33efc8a3a641db9c6dcac67584ffe9a8e5e32928d86e5bab1e93f86ece36b7bb956f6d3d29676521246c076674db669bc7336ef9a09e974550b1dd1e8ba3bb29dbcee69c54ce6545504d90b1ddde093b439ab1cdeddf92cf4cfde5e3faebfbe161fcb8bccf36fee64df79dd3b1dd5ebb821baad8decaf289db4fc20ff8dfdbd7a1eb3887dd7e1cd77bddae933f5e96ee9c3b97ebb01d746d07ffd9ddc4c397b1bddebc67b8eb74c78ff7bec8e1ee94ed173b4844384ad592fff1f817a91bf69dffe5d6b2eb72c612dd7b3cf8abdb591f13d0bcec6bb11d8d4d54b6fdaf931da9606c1f36acf7b6fd93dfadee232f286bbb8e4111fe9097bd5aec5bfda24f307bf37078a0c1b0f96cbf16db516afea96adb165f13587787abec8bb19fbb3c63bb8667e06c9c556dad875c5effe2cc1d0fdad337323da7716a6ab21d5ec86def2bdd95e5e79e2c6dbb8e0777baed0c93c5893e516e6f565a32fd866d07d7f2d7f41eaa0fd9eb6b8f6df69a2d50c6a3d3f9596db0fc6c6edbf6fe8e6eaa93c31f666e5a776c732fd36218f46717989224e1d66db7f8685714dc35c736b7536daa7dfbfafd9aa67dddbced7d21998ab64c9159736cb397b4eca5774db209d86eb1cf64556d917eb87a639b0fd3ed7cffba6453b0ddb2bf12777d4c7fa2d6d8e62c3d2169d2bb2ed9246c732f71d7fb1e4fffac46db763f25dbd2d05f520d0ab65bb34445cdfa9b7aba3a6df35ebafbeeeeda64d3b06d27eb4edbc66cb374bfca9fab934dc3367f4ed4d3be0b4a72a55a1a67a97e95e5f534b36368d8f61245ec2ed506ab31b6ed74eb4b47bf775568d84e76a84d5a72db2ab1cd47a90af9ea0a65d3b0dde2891e2ecb6d26b6d96752f620db457b15d0b06dff9bb86f816d95d8b6e749db1f750c9ed60e11db7f12f7ed3512db7c94946d9d7fa32621623b399b64d3486ca7a6ddb4c75719da546c2763fbbd91d8b67f257ec55492f64b43c476b2a7bc20b6cf7ff0f4b8f6e325b6d9280111dbc951e782f7f6f9e56f2ae5edee7516e4346cf3640bac3d4afda8aed84e4d2a966e2b716148d86e253b3e8adadb6787246f25bb5696b373efd330246ca77a4e8bfad2ce7f703719dad7d9d86e51b1fd9ab8edba895111fe9eb4fdf71a7b4d0348d84e8d578c9b18f14cb5b673135baf0612b69de4b4d37f0a6c9f1ddb4eb2dbf4b1f9055d6742c2364fdc75f05c50929ffde0ceafc4aff8f75a0b7212b653d37e276e03ef6dce934b52720b52ae0602b6f928395dec3bbd914d3db1cd7bc99eb4ebdd279680edf478c55dd1ea81dcfae0926b79f97b721ef9fbb5beb609d8e66e72f1809fd9a32a657bfcfc5a8ae76c5f19eb247e87d583ed72a969601d989ddab4ac701d98352d85b5f4324963fda4ed525be5d4b33572456edd7666ed7cf11acfb2dce76c27d36d95e937753d39a3d31f3f931bb7cd9df47e37e3eca39d657b92b56d6f133ff54bd8e6effe44caf8f4e7cfe4b66ddba3f4de93d3e27d5734dabe2bb8fdbcb1d1f11bb6cd99ddc96c0b9e1f77aec736fb2ff9d3129b95c276ab4edb9cdbee5d66e57c7b9dcfc69a623b697b59c6f6bbf4e6b09d44b883d6cf4f0fe78ad84eeb6e9bda93216020681ac1b649b679d8f44db45e5c77f4feb2ceed2ab9e753501034f0debe47495e3235556d5bfe2e60befa3eb05acd774bd9c698c27e51d4d20cb25d01f126c635b5b793b6a7b05d32358dd9b65ec43bd4a56caf9f4af1d0cd0e60a77b57f0de2e999ac66cf725dd99e95191995d8adcbd521bf958a2bd92b3bf16b19dd9dda046db3b4fda52ab677cfb2e5129b4362564f1599affddfd7c5f60fb87eab6ad07f9613c358d6f6f926fff73f65b610b82b61b28c9072bb76050aaa6d81e25e7ae943a152e0349dbb5c7b6ff6758b881705d734e93b6bfcef8d290b45d6f6c4f1ffb45717db85b4d734e937be70a8fb438016c2bd9f677aba78d73f249ea8aed8fc4afce75be9480a4edaa25797eb6893f59aec72f9d376fc4cb9c8b59536cb34ef29bf65a3d0361bb4c3ff9ffcdb238c1993ca58fdfae29b6539b6b9eb30e0cb6eb5be329a7ae75606e721466527d8d2749dbc9fee637fdb6cf8f6d9e1a5fad3eeb14b60d8aed164b9d0af5a7f28d28dab64d8dedcce13193cac14ddeb6645dec75dae6bdd4e1449f55ef44d276723ef0056c2bdccd494d82f3cbb4fe9290b49d98df651915db7b5d49db8253054f7d9ca0edc42e76b27d61af34b6b99d9a04939bde72028ab65962173b5f925f571adbe9dd35dbedef6a29a3689b2796762c25cba1ae34b65bfc393dcdb5da28f7add80e4e990e39d99bc9ddc4f6253bc9ee25d71adbe92df8f6adb04abbafdc886df7ee87532381a9edfb65cf7cadb1dd6299b966df55d6e6de88ed51a27c3bb5b3542aebbf24a9b8d6d84e1f4455f5cb7323b693b33a4e8d04f26122affe93e4d5d5c676e6ac89767b7a57fe7e37623b39abe3d41eedc95decacbe71b1cd5ba9c326f68dc845e91bde88ede44618d94d4fb224f7989bcaf6aab95edb2d965d13e04b6736e73e7a1bb653b33a8abfebbc9798837f2f9b5076bd25f9feeb9a6e73efa35bb4d25044f22d60b0edd4ac8ee2e7488d89ac65e5c015c776766ca41dbc909c527bee94698da8d3bc6d37b9379dec657cb832b58b9d7452f635c776e6acef03abd1e9ec646eb23a6fb0edf4aefc7e41937b962a06a5fdccd71cdbb9fed38065c73931cdd9dea4da6e26db4e8ff3afa53d4ce94124f99cecab8eed56cbcdd4cb0ffa9e5b72df9c8dfae902c164db9c2567d6b7972de1ddb9b3488d213dc9576e5d756cef6f987d751f042e9870c49b737bb45d662f36d87676e4f77123786eced32f3c5f3ed5a749db0eab86f071df049b80b4adfb97a1cb536b8139b399fbf691bfda68dbe9f399f6ad92a7919de942767a99f2afe088a5066daf3efbd5f044b7647792ed1e96abed6233720e13de9d19f33adbef6c58df806dfe9679fcc187c70f6362c1fe47fbff777f6716fb1455e61ab4ddb62a22cea94c6196c41adcdfff7a9caf568ff7f77eaefa7e13b65b763ff74493efeddf37af3772bdd76dae5e631575a83769bb2a929cb217e76d0d1361b8ed9633163c94e5fbf7938968ababc2da9201b65b6ca8a2db74db9ce59ba17256850b6b4cb0dd62eeeaf4a765986ebbc505bd0e32be8b273d18617befeb49f65a3e89f1b6f7ba5f45edd03cd6cb898132336cef1fb897dd66b51c56db7cdbfbdfb429f3f4fee2d4cefd86d80ec2fb6572fa164926f3876dfff3f359f199e4689c73caf9e2f144e9361d9f1e4230c6f6beb6e2f6850d6a118375c773830e1756eaa08af3d039c39833be288a6f6bbe28b1a0a66edba29eafb29cca296ef3eebcccfb7bb7f51cd6e8912207f4ce27e7ac35fcb8173fbe3ff678995f5cb7edfb7247c708399d53fb6fb8d7953c7188359877bd539b01d584eed503c1dee19bee6a374965c074f9b5759d725fed7a6db75a3d05ca6c9eb47f627bb39d2f05c6adc9fa6bfbce9d6c4772635c62adc8fefbee7ac3d7eeefefdd6e176c89f33c1c898788849f76e7bb98a71ac6284b9ef8263acaa9749a6d3e1abe75ba1fe3d57cbd5bcf57e38f976ee775d8739936d301975a1914f48fdbf66184a0c42292f4470f1f0bb9da1333f3844f1ca63dd819f7304ea0d174c075ad0303cd02db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac0362544b68b8e4d062663bfe46d4b8fbe0686c39ef2b61f0cda071a54c1fec8dbae61437f709538ebbcedb5ee4dd28126667edef66403db37091fb5f3b6db7f514dbb495847647b8c17f74dc2d622db83c2437281a1706f22b28ddeb49b846ddb42db8f8d9d120b2e06777cb16d74a7dd203f9de459db7e99330b8149f0e14066bbbdd2738c28d00567f3b6d436caf21be367f84b64db7a87ee1bc25e4c8b6cb707d07d3bd8cf9943e5b3b6dbfe065d6ab701b79ffdf609db6dab839ada2dc07937e7366fbb6d3d38a89a9b0eb7f938af56607b5f9a7f72bcbd8d86b99f038158a1ed767bbe98d90cd31b4c847366db8b47a15689ed7d7c8f5f7bdcb6d9de393005b617ddf25ec7538954a9ed3d93f99fede7e20e18c3a2bffd9a4fe4468b6c0758c0244ed83c651bdc12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6c48fed877e1d7cfebadcb3dc1eebcf5a9c7c1feff763fbce6635e0880fa2026731766a71121ff1f8637b51cbf17e0cb66b645c8f13d83602d8a6046ceba3c4716a0d03db5a98ee56ff6dfb9f9ffd7fb6ffad9617730edbc53cbdbf05bcf745071247dc8597bc48245afef86ee41e4eac65c131a8dc1d75d605b76b10d82ee4be179e29ccecb5fc227eb8c67e15dab6e69d56fa30eae0768ef75070186a63c07621dff6311d0bf945ad834af657647b3e6c31d1b1e39c8dc6fa0b74d82ec48b4d39bef422b9edc73b5b7ac43c77de964d265d046c173199c509b17f4baf92da1e8f1279101d609e7cb6debcd1d4e781ed22ba769c103e9406b7c4f6b4338bddee5ffceee6f9f9f579d8db57d3e27f75be9a7e8234b05d803f0cc4b8bd3025d27a9ad8f674117f55d8acf7b25efa83c174e04f1e7ff79c9f57b9dee886ed02be0ebebcff373aa4e45d7699d0b6b5892b78a36de605bdfc3c96e85cfe1d6a02d82ee0f008fb223cacab49eb6922db56f7f8f8ce42f0082b37fa31dfe86c79c3b61cff5047639df6cb214ced17c97522db4f516473f7437cef4d14dd76bff674cb816d39bf43c9e3f6e341bbb49e26b0bd8caa625cfa629e448d3bce3596e5b02d65fa1616e0f7fb7770e8535283cedb9e3e870fcf5db9ca49545593d707ea07b6a5ac0f16f9a67d2c97d99df8c2bcedef4836ff167fe2c04358d873a6af5e0edb52c27a96bdddff71ed86612eeefccad9b67a51d8768aee3f788eaeea6beb42856d198330b45b41596c85853a13d7a872b6c7ce21ed7c24ef6d0d98473934d2364002db32be0fcaa2aa595861e39e505fd676f4dd68b18713bf222c02f86c5c67ba8b806d19877eb4961d3e991fbe63d91fd19559db51b9cf4fc6ecd8e1b6337afe47db8b1bb625ec460765b35df8d7bbc3d3b03bd12b366b3b6a6b4bcafd0413be7959df6bec5e816d09db43f2b917fdf5dff0698ef253646c5b514bda115d7b59605bcc3454663f457f8f3a4384b5ec8cedfba88ec62f3ce550006c8b5985ca46719b2beaf716bd8b33b6c751415ed8fcba0cb02d267a4fffcc35db85131b44f5b48cede87b619faa915f00d816b20cabd5f6eae79fa2e6d27bbe5295b11d56e6b5f67f9705b6853c8475343bf1ea8d3a3a05934fd3b6a3373eef699f75761ad8163178cbd7c996a33041f9c9a769db93f0ba82994d9703b645acc3ae339efce5d6df30de5bb97a5adaf62eb2fd7c7d5572d816d209c5bea5ded1aba8aefd94bd3a633b7ce5b3574d69ad026c0b1884d3c632fddc56f8af7c98ada7a56dcf23db7f3525b60ab02dcd14ce336576276a5a65bbb533b6a3bf7eea496b25603bcff435b49d9d54f2180577f6df61db64dbbfa2b90bd98949f1f4834ccc8b6da3243fe3ce17b0dd8d064472fd28612b3cf1b42169db6bbcb7cfbff3056c8705b6fd4fee079356544f4b37a5512737d8763820c25dc18065f44c76ba8c4fdb5e1edbdb531d89ad066ce7f80c13def3077e864134bc759887fa43da76b4b2047d69e7dc59bbed28365bad91806881477af2a9785404fde467dc59bbed877869260f34f2e37fe1ff659ff7f0cc69db8ba887156360d5efacdd764fb6994202ee251b6119dbbfa3c132e18cc5cb02db1976b3d3893a2c0efb21637b174e7b393d09b1dd9ecef5eea605db19faa5929daaa7656c47bdecbc77fa97adf9e8ad3bd737e914b6d31c975e324742f454c9c9a7d939a7d193cf4e57d39e58b09b96e3152d17ab13d84ef3759c54f64b42d43e4b768367e793ff17bdb865ebbd63a20ef996235ee35d3fb09de63d0c6d57fa3a5d47fd693fb35173b68ffd2bb9a1d12cd1304bd1ee5cf502db29262797790c865151ff53e5cead037b8ee6219e5af113cd4ecd74d634086ca708b7cc2a6c2b47eb7eb817877f6e8d6734199dbf17779efad1060eb6b67db4603b4914b885bd9ed1529096137f2372b6a76ea4b1b8f6750c6defbe86a49702b6937c45c35f85f5abe8c17e766ac8efcd100d8d265fee79e6d15b3b3fd1ad31603b81f559a6edf4755c647fbc2a6fdb3fb6e3dee41535df3d76dae91b3e81ed04f751bf4871adc91f666252b0a7d27754dcb33bd9abdb8f36e26931f906aab503db098e3ddc275670c5efdb287045fba5bd1d5dde89cb89c9f078c19bc67170d8fee1b8f0baf06dbb671905ee71f2a9c8f6f238b8c2462b41db7dee1d73a7608fadfa81ed1fe6226d22a27d0cf95bf857e1c7e6c7ad8ab9b3c9f6843f7e3ac71fdababad10ec0f60f5109ed9cecb5fe1335b95b612120fe923cc53b53733e7cf9292e06abd778db726e672634360c6cc7dc873353520b3bc5c44327dbc35f2545c24fd6726e3bf67bffe5f7d3cbc29b393fff6e6f1b791229b01d13f580159d2072e433554f93bd001e7ef69d0f8c339bedff97fc27bbab7965206cc71c03b644b56917cd66720e931aa4affbe55bd277eed146ba0f9a80ed98253fdd6b1ae386a90b5be6f2ca9ddfb525be399b75f44f5384ed23dba843b4d4ab346a99b75830a9a1a82a7fdff7ecfc1151dc761797d85f0bb623fcdeff6601ff2b65e1179b855707931aa23f4a960b4cfe2c9863331ec3ec99f77499bdd460fb881551ed6aabcc27a7bbdf9db7a1e7f57a9e377cfb1c4f2eb56d036cebc2f2fdc964e25f74bd106c5302b629d19cedbbf00462451cd8ae91b1538b1381ed877feaa0af6d160f05d6fd5aa4c40309ada25f066e0cd8a6046c5302b62901db94806d4ac03625609b12b04d09d8a6046c5302b62901db94806d4afc7f3f6fcc663f7529f40000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$WulsM5L6J/8AY/LgIIEUHup0e4AWFYQXCVHTpz4jQowjFVAAAO9gW', '2019-11-20 11:15:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sname`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `sub` (`sub`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`cid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`sub`) REFERENCES `subject` (`sname`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`class`) REFERENCES `class` (`cid`) ON DELETE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;