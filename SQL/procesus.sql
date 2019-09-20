-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2019 a las 05:38:30
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `procesus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(10) NOT NULL,
  `categoria` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(10) NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_reg_usuarios`
--

CREATE TABLE `estados_reg_usuarios` (
  `id` int(10) NOT NULL,
  `fk_documento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fk_id_estado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados_reg_usuarios`
--

INSERT INTO `estados_reg_usuarios` (`id`, `fk_documento`, `fk_id_estado`) VALUES
(1, '1114308556', 1),
(2, '1007476234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

CREATE TABLE `localizacion` (
  `id_localizacion` int(10) NOT NULL,
  `sede` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(10) NOT NULL,
  `documento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_id_rol` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `documento`, `fk_id_rol`) VALUES
(1, '1114308556', 1),
(2, '1114308556', 2),
(3, '1114308556', 3),
(4, '1007476234', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL,
  `cod_producto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_provedor` int(10) NOT NULL,
  `fk_categoria` int(10) NOT NULL,
  `fk_stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedor`
--

CREATE TABLE `provedor` (
  `id_provedor` int(10) NOT NULL,
  `nombre_provedor` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_usuarios`
--

CREATE TABLE `reg_usuarios` (
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_tipo_doc` int(10) NOT NULL,
  `documento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reg_usuarios`
--

INSERT INTO `reg_usuarios` (`nombre`, `fk_tipo_doc`, `documento`, `clave`) VALUES
('Gonzalo', 1, '1007476234', '1234'),
('Ruben', 1, '1114308556', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL,
  `rol` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Jefe'),
(2, 'Empleado'),
(3, 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(10) NOT NULL,
  `estado` int(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `fk_localizacion` int(10) NOT NULL,
  `documento` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_imagen`
--

CREATE TABLE `tabla_imagen` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tabla_imagen`
--

INSERT INTO `tabla_imagen` (`id`, `nombre`, `imagen`) VALUES
(1, 'usuario', 0x89504e470d0a1a0a0000000d4948445200000190000001900803000000b761c6fe0000000467414d410000b18f0bfc6105000000017352474200aece1ce900000300504c544547704c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffffefefefdfdfd010101fcfcfc020202030303fafafafbfbfb050505040404f9f9f9060606f8f8f8383838e5e5e50707070c0c0c0a0a0af6f6f6c6c6c6ededed737373848484e8e8e8f1f1f1eaeaea111111171717d7d7d72d2d2ddfdfdfe3e3e3626262f5f5f5f3f3f3ececec909090efefef272727707070d5d5d50f0f0f3434342424245555559a9a9a808080606060a8a8a8131313cdcdcd191919222222575757f7f7f79d9d9d2929291414147a7a7a3e3e3ea3a3a37d7d7daeaeae1e1e1e434343e1e1e1656565bebebe2f2f2f5e5e5edddddd3c3c3cc2c2c29393934d4d4dd3d3d34646468c8c8c1b1b1badadad999999b3b3b3a6a6a66f6f6f6d6d6d797979c1c1c1262626b5b5b5b9b9b91c1c1c4a4a4a525252505050151515b0b0b09b9b9b7575756b6b6b828282494949777777404040868686d1d1d1484848a0a0a0787878595959d8d8d89797978a8a8accccccc9c9c92b2b2b4141418787875a5a5a3232324b4b4bababab6868685c5c5c3a3a3a363636dbdbdb090909c8c8c87b7b7bc3c3c3a1a1a1888888949494202020cececebdbdbd5b5b5bbbbbbbcfcfcfc5c5c58f8f8fd9d9d96bc4a1df0000007074524e530003fa04fc02fbfefd0105f9f8f3d90d06f11708d1306da41ec72de0c157ed65214462411490bbf7ca68334fb71bad9d4ba90c2a10cd52e2d6c4f5ebe78deae447d73e5fb3e8240a9e499623197fb5b083a7a15c70777abd3516de889a6a828b5a8739742654bf4658853b377d93cf92d3254467000020004944415478daec9d7b6c53d71dc7cfb5afefc34ee2d8793f9b879d044293b03869080142c808b0b6e19d2681b252a02994ee77ecf8910790760a946a59bb9695760206d5ba76ac7bb46c93b60aa913eb6805139b600f6ddaa4495d2bba49fda3ff4dd3b673ae1d4848686e1cfb9e6bfb1e2989e338f6f5f9f8fbfbfdbebf737c8d50020c59b6586efdc2656675b90acbb76c7dc0bdb9b3b8a6a568a523bdda2489a6ea74c7caa296a6e207f30e3ebc754d7ba1b3ab2b93bbf56f168b2c23632c9c85858b4caad9eeca2facddd99f57dc570daa465ad1b2a5bb726b73f27bedd60815ce6250897e58386b58189eb29cf29deeceecd6c9a916558dc95bdb562fd990db9e53e65160c856b341250a18e64c0586abf0b18a5d9d2da6300741e07949a2732dce250f915293249e1704297c45c612f7a2f5394e054aa6d962ccb1fa30c559cdf4e797da73bf52d5a7cca664b309bca406c46c60245e30a5f1caaf453d1bb636ec517291953384a22a692830ca9a37d635952a2cd21416f347310d0b19bc600b53716477f70f2850cc069339eb29f2cdded0dfb3da41a74e88018b195494f0979e51ec6e764d3ea231ee3e1a1f5dd2a7c0e04d9445ac60dc860224829914a5a417f56c5f6cccf8dd9581ccbbfbb3d395b9e21561c418c6742802bd77a975b5bb32337c080685db499c7cb37a2a37ac0acf97ba326a8150281729fc20cbeb1b5c140a67545e8a2ce834dcdb3e49438111671ab78532e9564aeb6bcb385a6ca7ba4e2c563203f7973fde42c394246a208d59dc0a895fb4205eb13e9f2a359565c25909928e278ac97498887d133565315d2a3cadbd6a36966711245caae2204fbc2cb76e25ad6e798d95314b452cd17ad8d1f96863f8c8522f9393afca1d3454d904919938a6cb44b0910b19790d3496a61e91ac8ae2e5641e4c1263714c4b289249223229c8f5a41c0ee7c63e1221245e0fe2b8239b900ccfdfe72e4b156f229360602eac4fa7ae4c3fe2982e13da1eae5efa50660a3456a807ecdabf29924775a58ee9f6845e7ab0dc9ee46e512665aea7b69b68437bc711853b01e819e8256570d2aac48c907d6009f11cbc8e614c2984a93729ae701124c969ca3964dd427108fa0c5577ab83f72db2d3634f3e1b8850499504bc2901d43125740902c0b20a72f84916b7c8d329afaa26f248201c1124e4904dcb9a93ae046eec6e05a0fd2a48b041550290567520a9d4d1eb6ea5b603128f8772c8b41b6cdb9c9f1c4e91e40e7b6ea97e6d877a6392fe844b793a895e5a99db0b1219c754242dcd59c892d0469114f039f524778890b030a6e792a5fb13d995c86664dfde06b4724c781e0a12e2141d8f3b13b69b420ebb611f2950123958dd19b88851ac1948d04c6241ae1d0e10f824c111414244529d979f98d556734672648f9999e4be7b12d07ab8d699409492481eb74442fc9458979f509e84648fda3eda648724c331b98205b0720b799a09824496917385b2e6918c3c226f700058979f205b2148055259a3240f312979445cae095a6a95251efd7bc1ac6dd5600248521ab71a5ce429f67bf4ef12ada8b19b14572026358f70052c41cf019d6b8464b9923ee07948721c61914802b42dd275229191f911010431e9f531c5936cb0eb99487e15002fa6823e224478808242fd9a8ff255a4da8554e1115ebb12a174af2ec31687e44512882912aea62e94006ccfd45fbbd18a3c07c39e09526a28ef5784bcfbf5566d59d1da9e14ca1e77d844016a16eb8a88cca1dd1909b7c527a6d5565b838eb66e910319284d591ee1cd5b50ad1f4742786c1392be593247b5451cc92e4e2f1d79d99d0acd9239523b2192d7a5072232eaaaa3ee23957984d7ad00aa7ad913e190b33815cbddd91d49f65ad679c48cca9a401421c5714cae5b41510e5b8b68468519296a3f66efff425b074b221c3a5094d2e5d52cc556e97a764464d4d1063683c754222648af6597472a97131ea2c1636a6a2716b199158fc71ce4e10d1e330c896d80118f74e00d1e3389f0c00fb0c81f848764f098dd224a25dad757950e83c75d2d22087bb5cdec66d4b1dc88579fa791b45a2dab5f333ad066e4f3cfcf23adedda2d5971a8b0c8a877e7aa7e4b3bb42222a3b20c83c7dc44da166b95479c4f1af14a0d91beb55a74e365d4554c42a4d12f51d1d7ca76c69f888ce43aa3dfaeae1b2fc1be2fc49b08b97bb7f260c68cab2022c2a678afb373689bc143751e21d3b42bbe89dd8a0604900c1ef3c824b9f17c4f8f15ed2ea5fb4b8c9956cb83a796dd1abf78b536c32878e757fc0af0c587e245c4823c3d068ff9db91a6fc78b5b5e48329bc5f34ea52cb049bb2e2546a2d4ad25301c49988000fc4c781944bfa2b78070703816070243282c1602030a8438358127b89c8287f95be78048223c38159ff303c120ce88a083872624fc45ca5231e83c1e111e5c253132f9ffac15fae9d79fde38fff76e6da1ffe74eafc6b5f55fe103c3412d01191264fcc1dc823a097fa6a706498fe9838f2fab1975efde9c56f9cc0b7c689b16fbdffc93b7ffcf7cfdfa5b718d609134a645d6c2b2d2b2ad18b430f52697cffe69b3ffcecf95004836f68f43019a343bec92b2e8cffeaecb5d7e8ad833aa97e61672cdd08871afb4017a767a019fbf4af3ff9f33795890f8d8686fc7e9fcf1b193e9fdf3f141a1df5d23f1ebdf8bbeb1f46fe85b9442458be3f761a915156b75ece0d37f1cafb6354193e82c2e7c55e2fbe63906bbc3e8285aac57f7cfcf25bfa88593c2cf3c4accf28a36decb7b8d3177ae01faf1e55269ab2c03358dc49c54fc13d7be937c3cc75a21071c7eaf37a2ca8b29a75c0a2d9f9b72f7c5d996c9f773665ccc684c4307af1f9f7de8ddc05d3a0055f8e4dd09291b386718b374026f3f4e531659ae9446395c31bbe3dc927cf3c474412604a44808c3d310a5a2b18b71449c8f980e2f0cf0f47442864f8bdf8244532cc2e7091f9b3c1e6d8ac1fd6b2d507a95c27ae7f4a4a2a3581ea6ec18bfcf3d8d9b788a164a9111bc4e4f4b2ae3ea6169dc8e3dc38c6877d51e28820f18d62fc9f1b876098a93d2cdd13838cbe8ea9231c84f3bff4e3d010c651e38820f11324578e30acb7e8fa61e7c27934335e923a36b68068353d6e11aa477f3fc2b6d4ba6761594446ae0ce504bcacacc7d52b2497fb168c6312097126e3e79989846e435959b6202266b483ddae3852a59e394eac9d17c70047b80ac6c4979cf809334f4289742ec48c58518383590609c2f047117f8763342277f6eda71911a12f6dd39ae8bb8c1664dfc7ace40dc2d54bc495631c331c119110249fbd0c6c1616695e6f71466d0f39b41d04360984b8ea531795648e633ca829c117de86413644949e96395a1e396dac7a588370f3023e8c63cf43b9cb517cf45f6c523b2db41c51bfb7ca5c0f69ac789c3b49a6cd1b071e4acc1ac5a157d8f9f5cee8f6c4cba89d55c002b8f1060ec58987426408fbceb2aab44c50115d16b11730cae883f05e08fbe3c623ecdb317e865ddbf7dea888e4b2e141b2ed8d10310c71c3114e24a47efb11933c4283d6c3d108a4b7944d533100e7dec03e1ce741eb37ef3116b5167d234f5a631419c4cd8647106e9ea401c51b77223e1c3a07411612e1216ffe02696c65d2540cc2a90b349f631c7f8d0ce1936fc3080b222274ccdb837433e11180ab1769bd8bb1164488437c8e89464428986fd3a4bc95494287e14bc40f7ab501e2250f35fe35067d2dfa529fdffe6b0e5531eaba7f1447ff31ab43fc1e8b3e2399da27e7f32988665452cda6cb7b067bbd58231e4aa9e5c7ff64b45695abbe8122236b151b0f72f578bc0dc8cc52ebc59fb129b4b2edaa839615ad9158086410ae60af963cc244bef314933a0bb6a95d1891917d09dd89a5f5510ec331ac2d8e701ec17fd7bed2a20d94a65e950d140e0d00af7d460fc2f9316d035664231d7ef188f695165d18d9aa4e2232f2508130b0843fa67b13b1e612f1e15f1c62506a0950a0aec76841b560121904ac737eed05126e6ae1bf6abf818eb6e177aadbf0d0d54d3f9d44738b3e31ae4dcb6426113ffedf7719d8430196a93b9fd67e160209c0751cf232e04183d6107e89415e176db0570d10f3267ac238cd797cf0291ec26c8010891c3fc2a0a72540951a2f52c8a6697299f6b03066436414bfc3a27f62824a1511ab9ec13ac8209c1e6391d16fbbc367b52f7da95daf9bbb7de24c07360209b1e21196c87f59347d25689cd3846c6472c2d18931ec65c683be6fd177f243ed17d8c92b7fc75c02c9ea63229017e82e138640883edf64d2857738e7e89a5498986c6cf83f7be7021c657505e09b65b38f84472221c8a342041a449e53a8915a820395968a154b8b15eaab749499767aeebfffeefefbc80b4820104c78481202292485803c545e8a8864d009d04aa541408aa84d655aa838edd0f151107aeffd37c90612e4953d679d3dc33030030bffffed79de73cf598eaa20aa8252588d51f5859f5d35ce8a63bd5162ac531c1b88d0d04a1415e97c35207172ab9423e2ff2d1daa9079a8efc3799483aa8e57db2196c0a6a328c8c2020a40b403081a226ff07468bbacd83703a1dddd0be52e8ecc431dc41c89789c259be133bbb5a922092cd51cc71c5909c07eae616b885491dd1881af1d9e6aeb58c4e98c1f8a701012cad239be8a2c5981d0eb6b831e5ddb184aa3164b391014a4ce407721a613998750f37540a75fb7e145e2d9cf2111e364ea0c776b0434c4c5f323df582a2b8cd35b3fa772b2077b239c4ce9b0e1afb2b91a5f5c3cf773149b95d2fa94a03896867163ca0ba79f9777d139019bb5e4158c732a1b8c6bc366cd94ab9f236fb1367297460288c63fc3184e9308c33ab492ae3bd9900c39c82ff23e7d33373809f1f1fd08e786762b64f66cc566c93b9e2867e90bcf89374142dcfcb9b5181d5a89c266b5e244122622b874f18dcc29211164a9306bc1518ceb223698dca5150f32321321091116abc6a0901686aa2775084ec4eeb027cf68c589f4436836311b7a0d8d08101fbf0859082fc1024fb6a2211331144498ec653cc88988c1ab506eb8596144d72b0b27991867b73ae45551d290f31508a9a1dd6e1f7de549eed38073a970e176eea302c4cdbf5889324acb0a775f11f44e4301e281b2dd340a2766dc5b928362b31c30ec0a202948d7a0572ca203c4c50b4e205d93ce4cba8cc7773aa1cc99f1c2a6a554a25e09245883314940befaa72fabbcffca8a34b8e1047791012252c3c55840665e76363518673a6f00de21e3d35598f52ecaec6bf1ee0786a7864ed6e53184f61f05a49207e90031f85c9c61e476481ed2e2286478329686d4f06c3a40821897db4c0d490c2f3026a8a01707c83f2801c9e61bb180c02361a7541dd8548ca3901890f04c24a3f9643d9ef5bd1fa5b228817c103359521cf083e686b90eecbbc92895c598530f77227735d9ac24f63092c5a217f6d6216988b0593f6cea608c67181d8ba1c4f028b5c41069078f157a38431d8cf1ec8151581ae285f748954e0c9cd289d290c71a9d481c1b7b07920b91332f734915170fe20119fd64c889c8a6771bd248710fbcb09c54f9fd2c202d72b35b61264b0a99acdf6174c88580acd94fe980ea4219da46500b8c304d9693f51f8cd100a44487d967281de16eaf46dbe2668381b72b22f1ac67672c9f2e556417a5268733680a229cc87dfd54b21ec79e018703e9bf2182cc636432439117ee4269036a2472a7ca44e2d89dd0116d536100fee7d2a834ca69bc1c6f15a85d2e4d30c3ac27d07cba8c7b776ea5d34a5af03ae02d9eb44077d905ef6423c7a345bdd287d4e61309b34490f5e101bcb5eb761bdc2bbdbad3bc0b8da8226fd1b98e700e1077ae5b2173900012cfba59f07c3a0827ba8aca851d17af47dc262d53c3b1c2a3c7b3344844dc3e1c80770aa85c695bb70d307717771461968c7b7f89e8d355aebe9bcaa5cfc232bce5de20efb63dac8ea70620fa749589fc85cab5e806ac4296a92116983c416ec71b8fe9d3a5cd3aeca6313880ef4105620ef265ac7f0a3800d5667d5c4863b4c69c9da8164be8c53d0f0820b78fb6635a2c19f8e613f0ea42432e01ae8830ab9b9ad36bc306b2cf856fb394c5d2718124429a0072375aedbd495e9e4f6180192fc67e0f8922ee9551af155743c4f7f24d0a40f2756c9365814902c834dc204bc9410a433057a3bf061b4c4f6271dd71832c331729c11f135bba10fd3558e1a12e2ca9370120508e3f48f9b88efe161c90d25f8db2c607525b803a7551d3dcebfe093a3e903143d884740a40601ef630febd59f82f4124227d597fb0e303d1a1b854432bc26b9acb957d0af328a411880d7a8abc908282481509622e7459afe35b2c1966f563691434447c3b8b73b1fcba0c794b4f619e848469c8b7d84f6968880eab78106b2998c1eb09182c15f7a6b229348078e0e50b385bc1a4829414e316de9b81fc864d22e243fc50c723bd9ad8e421fec9e39867e92d807c9f0d200244d7b3fe84e145646f434305058fae129161ec112240e4f4c502844d6dc26f192768182c0964281b4f0588b01a4770d677efa5c24300f936eb4d060840203ff20bee357ea988cc0b70400f36900e101d5e581a5922f21fd33691e12150a4b00c421a02b04dad8d88200f1f3f0694807466bd480181dff3c82d1391fe9cbf944724c23281dcc3c65002a2c3acaf644d4b8b108f205f5e4b23476f04f23d964c4a433c50b635525546a91f0567c94458269064d68996c9f2c09682c8945064c92458498a8740319aa5d30222887c128c44c62e7776f3b994ec950292ce2cc480e83a946bed9fb1ab586e1e1072e826100b731003225fd1aa762f33aa8f5f468d875c34c9ecd480c897344fded668bf584b53f6ea23723c040a3b399365ca8b9af4ec5abbf1702bfd2027d264a5930402878d76cb10553e28fd074520e9d4c2de26595dcab3dba5f82b3e32c883e5f4ec5528ec4d260944c45a5bb6ca991b5a3bb873833f5f49928740d18956e9248c88178af3b9fb96bb76554f5c2ef2739da6c9ba835a71b1590250b49ecb2becb70e89667ed84b6fd3cacfc38164122bbf878b173cff5ac26f613d5e337f1ccba3ca4395df47910522cb1a3bfe2095e496d82d0956641f973601b17a490b2029a48e705b91bcbfcde1f21afbcd22913844f261ec2da2e9ce4d9147b80fd1060290f31ae73ef74d46c0321714c947c309dacfea80a9ac3b71205ec83a7949a40e37136fc9524990f392e31564bd472390a1ecb7d435c4e38195cb0a6f0289b456e22f97d61703711e20e78d3f4e1d886cd8829c5df3b9cbb811572271186e9ebdfe94f8209df893ca56d229f48180477cb1732e960ab7ac1209ed3ab24021222458b7f794ae3e853c90496c5c140051a6c6f3f1c6c2c6ecee1a34453369c85f961edf910514ee7f5c0390543696c4859d6b4a4aa0baf24bf5865deaf69bf63534425b17f2571f1296caa347c133da6df02c992b6dd750de923f951dd9bd4492d07c6e57ab9a62b270fb148d3997f6ecd08172e6d1526c90c66e8b120d699615f3f27397a897ef337c6eb74b95bb4c71b9dc6e9f618e2e5f57d8b06767743d99baf439a1234415105d7edb3f7fe5b3fdcf2d68540a97cf086667070d5fd3d4ad820fcfd56f2b8328d20d1388bc16ddb517449986e85ee59fd71eadbb5875fe8b9282b0d1f14641c985ed677695bf7e4045025e3dba9ecc01770c6149f75218ad71dd4cfc660c5bb132e744cde277e79edcb8f1e4dcbac53507cf96559b31803fa047dd633920a33f8b1b118540cce4c49fd56a66e1c9f2073c51f9485618dc454e7eb742d48aeef17a03017fa304025e8f1ebd4f638361498ca5a20f308b49c8a75be0712789117f31312511fa30c6ba610fc18c49a386748467e498d844470c0895bc709000f28b8c280db3be71e280cc1972d4f8e0680eb3be4962851e0fcabd9213634e844a9035a28b5c8f900a9618100a4012e129b5c6702ce292b698b408b2faa80d3bddecb1cc9004102b0c17409cac6fe79857a7e1d3ef7b5401193938e6d56964213dcc65b8ce01a85bc162d214644d4e12fa2198dc15f3ea3482ac99a1e5c43f8ad57b69f8f43e6a39b108b37ac588e0f370c09834a5214e76dbd49857a7a020a37eac7cba20321175b5e48d88aeeb5ffb07a2ece8d0024399d3298124b02951533cd1758fb7f9bcdce3cf9b3daba2a2a8ba7ac386431b3654175554cc9a9d97d5fc0774af275ab888a8f70996a4d6a97760c393210ace44746f63ef425e51eddae237161fdbb3f9cd73bb4b162cf5994d40eea50bb62effea8f6f2ddbb7ede08eb5b545ff0e610b44413b907021e9e342fbede3d98c14ea5e5df7fa150cff9ae24d1fbcb8fecb57832dda475d4a5ab495ba4bf6ff77d527ef15bf9d67ea12f1461401a4d720e5d399345c3f11168cae78fc6a10f8c24f2b0fd7bf961bea56340c9fea230d6b24359b496537a9cf30425d8c85f9efefabc95923ff7ec04ff93e8215062630e54298b05cd3e86a8847a9c6a12d751f9d2f311b7ab38d50a3f5d52f86b8dc3e23db50bf5db4bd7eee1bb552d1fc1eba1ad25d6521a61379b6134d27a22bebff69f9e6ffa8ab216ec1e23a2e49ab8bd0828a72310b1aaa0eef9438483a14bb1d2ca92117a29c08d9826fe0f4aebf2f92e6c71df4b96f648680e4e7f605d5c6f6dc86bd7f9e4df339455af8a8998530553de94db2392bebf4fbafce5766ca7753d3034c55518a327f6b1549260ee8dccc43d8ae014269fe4fde990757555f71fc9734c9cd2b04090112640c3b8140054a8865b18ba3403ba0d6b442e962a72ac3d4ce78ce7df7ddf75e12200b862dac82d520954550b184c25816616028c2b089c27451ea401a3b942545640a58616a7fbf7b5fc8f6eebdefdd77f7f7d319ff637cf7c359bee7777ee738c76749dae1da9e3f55487faf155ee6c4cf848615f6a70456d7ef979838688032fdf8a3ee7a2c6621c559ce79b7c372a1ea2ddb3e93b329deb8e933721a2687f90b3babc039afa45908e9d3ca427c64606f87346709ec15c1f653a79bbf9fc113b3224f41d99f79fbcb5b2c4639c34c38c8eedb9cf4ca79d634475888c05e92cfdd5647fd4a803773e6221fa0de70f7c75bcb9cf1789d6353675af1a03eebc94c0710a19f27f8c199c588e561f3c7c406a8d85f55ffaf6a70c0fe29fae51f6c03c4470ac7d9feb24d14a074d7a117290e13ada3f5f0ac40398fe11357aaec8f25f4d30f206d8e8f7ccf6e0b11a0ec9d17cad94c13deb2ed087e8ac4fffafc6afb3dd6f89cf6400681cd26125c79872a8590dfc2cdead21c14fa9fa5af54da5f37697f06d808844d5ad8f73a73227e8b17dd47e69ae1d2a6523b75491adcd70148d7f176f92c915ac7bf8f4a9a03ed582c294dfec3c6fdb3ed9afd476561c6940e40c8087bea8b024dadfef9962c3bec5a4e2c07ad83afda5479e4d2e0b19c8e4046da525fa43836fd7e953ce8d2be05f7b2e70a5fd86ccfd0a054e8df910719986fbdcf124a4168fa0231cca36d34ee3209fbf1ab2bd7ac178a5c6666c1e8362a241244265b7e4b455df6c50d8873ac0ee52a73190f6db55c957019f05851140b21c320d55a13a13caeaf407f08d1761c91f01e0ee0ea1b95d6c6768e63afa13b1a888ff4ed6d7558bff8472a3c780798471b59d2f891d522647c61ab4a6fab82d68316f7cbfdad06d9fa2f87e06859f5f2e285322b45492ae4e644b110a9e9da329f459dc2da13f2147174d491e7917fbad3324dc271a9d4637d2d8a81a493bc21565de4d2b0796e21fa79c7f18834ace0a22b8255b13d0dbadc1b69c8ea40e471e86489890461e34bb2b7721c0f59945023a93f69c9e04c662093a34610764bd5cf9296522108578f4ac11c1d7ad8286cbcb3032ce80b662da425771bb2dae759390f5bd0c1487df3ae0a53b61919bca7aae6b0158124038614450be972f3c9d3d44238b3dd5570016fe18eee4436b935549b1d4858bbc9200503614164346b98e3cce5b1e4205ab1eb36712309f0787badd94432e1915f298410c9447221cd5413116159a37403e178206c7bb11fcf6f35d56b7134840c8e9af3364b11f652c4d48ba8fd15ec77f2cee71159915473ce548dc8416a49f49cb799482f13a308fd614d738c5a2965151134730525fdd433527c440d484ff36208b5fdc3cdabd2dc71e4dbc405a2696e8b7eeac7891a10428a1e30eb564484e05f1c582bd15424616cb8661211faa5c7e5a9e2a0f1deacee932054de741d8f0891fa5a73922d0a2497689dbe05a6984810aadf92c239baecb0ab443cfdb61944588e55a809848c32e36582086beadd925e45e93ac5e34b8c2722e5bc5db5814c3721cfa23c2ebb948774b71bc0db9b0c8f23acaef87d6d1ea4eba386b79f0850f59e5b79341339f1a1e144d2a05791468e259d7e46df530950fd1f0cf02ee5210b92301edf68ac1e6177e92531f0f0917ba6197b4f2540e9198907baf6b0fe073cb8c658221930e61bca65acd64466197d4ff50f875d9debacfe7e32db6003793a161e14c84f0c7d931b846de877390f894818f71a692219d07d624c40480ae90f19869948291c41ded5feaa5543ca3ac33a4d392e039e54a9f3b655eb036742aa417abd14ce85d1ef7e1e921e413c6cd0fb378e19485e6c06c2ae458632b56e049132d8badaf501a4e58204df3c65908dd0effb0bc59bc22889d6584a9033227e6ca9734027b561a956002be61a21d939d6fcd32d160dd26c22fd532133712202bcfd5fcff088141a1b6f192110e9a78d358244c2c85863ee721b1cddeea38348082f57269e6bd14fdb2587c47152487167230ce4159a2bf29ee1119123378c0820d027d688de4c6470c2557801fe1ef6f35ee21129c67f690090ee2924aee323cf754a98c8f6dde8217fd5926a2dde996800e1602421f1127922419f25c2716f0890f64402f86982930632e1d17412f7c9cb4ae8a6aa0cd6a1c7fc558b8d34249069d18f9ac915121de73789689132b8b4c88b0612296b35e957231ca4c2203d3cc8c06fe9ef2b1561c91d9797dc554d64b9ee1e53a609bf3391a4eb2152acfba68a26eaaf79481146b9643fa4b77d8e95dd7bc6aed1dbbe4e18059df4994810ce053ceab09acb8cf3f515b598c39a39509f81a4905f67eb735a22dcaa639210d1ab4402b8e2a21e221ccdb03a17c7533469ffc64d9fd3121a708e77793022e5fa4a28ec1ae4672485e805d26d88be4c6b1f86780ff36099560857c60f8445f419137503215f27b30af4547dd72c75c3939c849dd6e6788930899ef9a398af41a286915cf60c345e221f7b3980341309e119317e4d0833f505f496b7eb0fc4dfc8b83384bcc77930a715c01df11b48768f84805013e9c3c5596414e136f2e87d20f49f3ba571a7583fd62541daa891fbe38b224158ef4f02039189cc8f278a301e6313c4211519bf0d714591aaa5d2cc0cef03a13f72e1a6b81c16b2b51c5e00000cb54944415457d08318704ae2e9092a850598140622ffca33b1ab430e58aba2216772ec44447879b7d753ded645c69aabb116e2198f877388012ecb47f2622ffb96c15e0c278781c889d6c1184d442af2269861b5e4bec32033b6c01e84b915c96220b289fcf6fd9888706ccacc506378302bfb295b961b938d346079b2f090d5e11f8418322d8e4dba7c8218e1b06413299a16139120ec59e4ddaa7b74139913437329c76625779fa2bf86d57192d67313620b237b93c9402255dfd99a26c21448d648bd4577a5f66b6d7d28c2c5797e3f9f4440a4a5af97346f73590d6baa913c988dfc20861e14f1008630c94e39d66b5d8c3003b9dfa080de72eee9a52dd8d7ae4a2efb9052dfb07fae3a10f6d9ba4c311807e57b6fbea68dacc30026dd09e1cd320d7fc5751e605482d59ac8b35a5723b535986c0622a9c3d031ad8c77a8f13c229d73aa44fe9c0c65f78e89167b7aa8c623159e27e69caeb9aa44c4f3496820528d7171ad2a8fe145e618483a99328495193985deb8bf22cf27a3cbc230ee527e7790015d461ba708db5f1f164e605d280a36b2ac0e43987c5916fdd12bf628f24883ac7ec62a90b66a6464814a5fd0b1b34ca7f349c6a31c975f551120d03f912e136d222a8a5d84cd9fe31c4caed209fdc1e7772ade8918afd03b7aada79447008a70f228fd0b934cc545fa73cf6e512a9d300319e1f399c983660b29b992d451a8f66e3c2e35bd27cb152e1fc017b62bf0e0188fe19388b94068aa35693033112522d5efb96b126c42f6417fe5898d4a3c986f1fd3cd6c1ed2b0a0ee2c5629c511b889e84f8a4639b6656483d206318e0d8cebfd8cf93c189189bd95935f01605bc82bd34dd47904105f527ab6230990fce956f060447a4c501688f4acafc1107abdd99afec479f3414d1066f733bce4ae18471eca572122c08edd0e5fd86240f828c785bf53e551506c96408fbad02d4b45b20761cb0bd62e46b73e7c84b04eb1254b12e89925e60a90f6448615b04b764522b5f52c25f426115eda2c727cbb62738324d0fb58671f91e9349d9864e794fae5c4eb7e0c783290c8e9d5816a251eb24a1b6a55fc688923b3d28053b11138b558924ebce770d07fe7ad07651e2ce5fd39b126c16a737e99a96223d4bd1efb1c5db80e4133bba2e6b1f45550891fd45ff524b69cfb3254e2083d950de8e681d64ac512dc50ab3678294db20f7bceb39d55f508c0cac56c6cba5788c843e057cd571d8495c1e2876d67d838b68992539eb0b1ec5df48c4894e68d63e31ee5a61f8e8d47ceec631f8f74f2dd7c552265507de34d8f884479d97ac387ca937b251e052524dd671b9114f2d004d5c6079a8aec3b8b010fbc50a0ee2a8c9f3581ca2465163fb28badd51f1daf100b67a8ce2f1583b0fd267a61183f8de6f52f8328aa768ce6f7b3529f472732b1bb947bab1889f8c1727977ba8bf787f07e5cb87eb6f2cb034ebaffe83ddd5efb880c449909a04684fe9d3af9da5d4de5cae0c1febf2faf05e536774e7a2235e619abf579f46afc377f08aa82846525fbbe925422ba722918d5822b9a406564992c078777233e429c4024e529965fa8f7c6aff9df2274e190399ebdecc4799f2cd1181c4ee5e08849cee021556d7a5289a8f55a61eb514ac45d4579b9d08e8dfbb45f10c2549f53785022e964d8235a4482201ca9434994f0ee09e6e588bbaf57aabe9192fa77b3fa139f6378486fdea68fd17a172a0ab0f9400d86c22e89246c3d4539ce6b5806ea3cd83ec22eb6a7bb1d89e48dd27a3f22504df5513d3512bf3b16dc33657efa7d2a05052d7f357cb499fda27a89e44c95d35f15264111665f7a97e55bce5e4bc5daf8596ef5c51b552004d55f73d27f9f2f729a7dc86514322b5b4a7ed5230954bd71ded9aa848f8ccf59f14ead86b702a63e3a0f25f6cb418564abc718d0f45b5427561da940c7ca1279ab3de2eaeb1487a0e1ade88fed3280101f71e6f191a2c93425d79841c77e63d5f5e5888e9c45ceeea0e8ff54c5ffdbbbf6d8a6ca28feb5bd6defdad1756bf7e80c746cecc160631310b6c166dc401287f216c9983c068831e6dbdaaeebba5186226c538393c863283302d9001f3c8ce81ff3858f6024a08848668460d4a00643c46882c473bedb761ba9f476cfdbaee79f76b7ddedbddfeffece39bf7bbe7bbecb8728f5fb742da88fec52c9c22190647901e5c474aa696d831c586a9385d08fd6c0f15c7bff8cb8fe25a3e61229e3c122c9e379f40e73b67ae4c087ae5f8121a8930e244c7780b7bab9f508f5d7060b6bb53c35e648e1e695bf6c6b4a2a36ebf24b1227b0e4d72f1c380692f05c387fa1ce5659f9f996fdd46f3f19383938c505a552ccae7c645b2b7454ebbf9929ca924da73bb683e31afe60e2be495277f2e7d7fc080ff7bd5d2d2d1a4f82010f8215cc8a05c2fd5f1190d85d6dc720bc0bcaa46ab83c15a80e2047f3e5d7ff0038fc7b2b4c254b12259aedfa08ed3222338f610d98fdf92d2bfa8623bfbded5163438f4995f761ee2bc70f00144effbd96d4203ed2571b882c82048b41a4ab28a177ae24f6908af4a95ffe6ac431c1e64e4309095e0116141d953b3a7edf8407e3170ee194f26289f4c3f96df92f31170a9a44cc7a3ca8dfffd9814363b30c154d181aa8392a9b36b73c4b2915d7ab0fb447f4e208a967bb3e2da9444e394e7ca7f20387af34234d30c60f7a9047015883cd8b9eb9b9f5a0e866fa9457517e6d22094a834ba8783a15936f7513c5f5dd7b2f204dea06b592c5a684d639e05de3e65b17a8c8e5a4d4acf041972d0a4a76b8837b4c6a3495ab281587881de3c9bbd7cf5e439e6c700c8af3628ecab101b9b1edd43747218cdbede21ab8831494d3c8b2d944a924c16a1a42d695082411d9191b734eeb9ee31fedc3785253631bd8c57419356aeaf0edc5ae73ae7accbc4577a6467aacbd8748aff21150baa5207727eb30128a8e247626cb0e74eeba7a0c07ce61b30c4ced844daeb2a19faa6c3cfbed79d674ac56243958f4e06951dc38229391e036d0b259e591c273452241b1dad974cdd6972f6c79abb1bb605425a4c4557d90199effc5fcf6d4e1a33b5b0343c37df4a9b383449afb9d014126c7bb15aee85516aaedcc956cdabfe75cd70f3d5c8ec533b855228a4caceed7c3e59d38b9cbf541ab80b9e8e58ad4c291d3073385730901c3b3b8cf4445aa926ea2588541b3373c77f4eb93cf6f6ff776d804d763b3592c164b954fc34fe00b362f12b6f617af5dbd7e7e7f8350feabae0e681916541ed498a30c3229e8d7463fc953d12de47dd8537bdef9e9c39bdb1a77b4f72207c60587a3060c5e5055f6fc6c4353e3b18b672fb7b85a7babd040e08043a63ab38c849e29e38c40927e408256bfb3b3e5cd4b1fffbb6ff7898dcd4d4ffb684b6b696f6ade7862f7df9b4f7dd576fccb1ffbb3f439c20139bb6e892104e1c07964518ba7529025812e33d6edc2ba2583f5d04e57e7e9573ffdbeedc6ad4b7b3bbafe7ca3ab63efa5976eb47df649cb2b9dae8367bc9313ecf66a6b5fd611c630aed282b32a8f093567d523e17a6411c4126d7f5802a8386bebfdab07abb3bed669afb6f6991d6a3587702c490889d4ea7f48029a2a6b791eb08453abfbe3b80460ec4e676d6d6d3db38606e11536389d7d25452f3878d081535743a6ab8920a16b4a8024664d1a5678021026436b82ec800cc4549c05ec5092d03625e42b5129d9de797f928403dfa4e54c21c17cdb2aa0e84e1493cba2f1ec7969b1843d0805dca0f9f199fa90d181e2ca572466b12e128640c54b86268806aa0ef9b27909dec31c5136a1a488f6230f1e70727010c7e9acb4854a32220d5d57ec4ad328d0ef5a6e9869c2b22a80233d23751591d6a337437c739e18d6948180076dc20f1b4d5865163407d5cd5908815c212323d79498e457144f02d7a59673c3e1ba04570581bc20de8cb5728d928c6c8bc00b5291583c1fb22e353794f244ed161c701dd0f46c73a6c17d7d840d3d1789aa58919befed9137e821454dbb3ba6ab1e4a9e3c858c705f757b110b1d85216602fa2e349e1f44a2b05dc32fb03f0ae247971ad82184c9e1439c10fdaaf519d15a8609c7c64c3d18d28f43f147e5d1c699290632322547209655bc60fa2c060a2757f103e7be848881b392008c425dae39293cd6a2a9123b7e8e69198b29bc56aee2fa8b0a62c1a9e45aacc6d2f4bb32e2e3967aa450d8c444790caf11b12bd6e766cc6003ca45f61516162f38b9369261410ba7663f5a9ca9613f128e1a01612264a00929c9e5f179ee50cf6911165e9417130237b22252256c99619abfde3cf601b67b8d42191ee3c0532f859e0d9b2221f3dee479f3f3a679069b53a9541c07c8f04cb7f436dc0a1fe2573cdf2f32e5ae34e72c4dd0b3ddea15b23035face1499c65d40bd3f6676ecd8e4b965138d8562ddd598e91327959bd76556944609fb906964613f35202aa57b02a73e6a5c565262cae8b827664eca4e331975d30aa2f3d3e5bc5a9e9e3f6a4c91ce687a387bceccb9718f8d4d4cca1a17a5f78cbf4c161c58fc07aa04517c22f48cad0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `id_tipo_doc` int(10) NOT NULL,
  `nombre_doc` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_doc`
--

INSERT INTO `tipo_doc` (`id_tipo_doc`, `nombre_doc`) VALUES
(1, 'Cedula'),
(2, 'Cedula-Extranjera');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `FKcategoria772489` (`fk_producto`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estados_reg_usuarios`
--
ALTER TABLE `estados_reg_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKestados_re765155` (`fk_id_estado`),
  ADD KEY `FKestados_re151527` (`fk_documento`);

--
-- Indices de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  ADD PRIMARY KEY (`id_localizacion`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `FKpermiso88983` (`fk_id_rol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FKproducto724159` (`fk_stock`),
  ADD KEY `FKproducto483340` (`fk_categoria`),
  ADD KEY `FKproducto34098` (`fk_provedor`);

--
-- Indices de la tabla `provedor`
--
ALTER TABLE `provedor`
  ADD PRIMARY KEY (`id_provedor`);

--
-- Indices de la tabla `reg_usuarios`
--
ALTER TABLE `reg_usuarios`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `FKreg_usuari188129` (`fk_tipo_doc`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `FKstock604615` (`fk_localizacion`);

--
-- Indices de la tabla `tabla_imagen`
--
ALTER TABLE `tabla_imagen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  ADD PRIMARY KEY (`id_tipo_doc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_reg_usuarios`
--
ALTER TABLE `estados_reg_usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  MODIFY `id_localizacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provedor`
--
ALTER TABLE `provedor`
  MODIFY `id_provedor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_imagen`
--
ALTER TABLE `tabla_imagen`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  MODIFY `id_tipo_doc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FKcategoria772489` FOREIGN KEY (`fk_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `estados_reg_usuarios`
--
ALTER TABLE `estados_reg_usuarios`
  ADD CONSTRAINT `FKestados_re151527` FOREIGN KEY (`fk_documento`) REFERENCES `reg_usuarios` (`documento`),
  ADD CONSTRAINT `FKestados_re765155` FOREIGN KEY (`fk_id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD CONSTRAINT `FKpermiso88983` FOREIGN KEY (`fk_id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FKproducto34098` FOREIGN KEY (`fk_provedor`) REFERENCES `provedor` (`id_provedor`),
  ADD CONSTRAINT `FKproducto483340` FOREIGN KEY (`fk_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `FKproducto724159` FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`);

--
-- Filtros para la tabla `reg_usuarios`
--
ALTER TABLE `reg_usuarios`
  ADD CONSTRAINT `FKreg_usuari188129` FOREIGN KEY (`fk_tipo_doc`) REFERENCES `tipo_doc` (`id_tipo_doc`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FKstock604615` FOREIGN KEY (`fk_localizacion`) REFERENCES `localizacion` (`id_localizacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
