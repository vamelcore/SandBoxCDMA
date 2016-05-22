-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 29 2014 г., 11:06
-- Версия сервера: 5.5.37-35.1-log
-- Версия PHP: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `osmaster_sandbox_rsintercdma`
--

-- --------------------------------------------------------

--
-- Структура таблицы `akciya`
--

DROP TABLE IF EXISTS `akciya`;
CREATE TABLE IF NOT EXISTS `akciya` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_kateg` int(11) NOT NULL,
  `ID_tov` int(11) NOT NULL,
  `ID_oper` int(11) NOT NULL,
  `ID_tp` int(11) NOT NULL,
  `cena` varchar(100) NOT NULL,
  `voznag` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `beznal`
--

DROP TABLE IF EXISTS `beznal`;
CREATE TABLE IF NOT EXISTS `beznal` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_scheta` int(10) NOT NULL,
  `ID_prodaja` int(10) NOT NULL,
  `data` varchar(100) NOT NULL,
  `magazine` varchar(100) NOT NULL,
  `summa` varchar(100) NOT NULL,
  `izmenenie` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `diff_cena`
--

DROP TABLE IF EXISTS `diff_cena`;
CREATE TABLE IF NOT EXISTS `diff_cena` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_magazina` varchar(100) NOT NULL,
  `ID_tovara` varchar(100) NOT NULL,
  `new_cena` varchar(100) NOT NULL,
  `new_bonus` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `kassa`
--

DROP TABLE IF EXISTS `kassa`;
CREATE TABLE IF NOT EXISTS `kassa` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_prodaja` int(10) NOT NULL,
  `data` varchar(100) NOT NULL,
  `magazine` varchar(100) NOT NULL,
  `vkasse` varchar(100) NOT NULL,
  `inkas` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `sec_data` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazinu`
--

DROP TABLE IF EXISTS `magazinu`;
CREATE TABLE IF NOT EXISTS `magazinu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tab_show` varchar(5) NOT NULL,
  `perv_prod` varchar(5) NOT NULL,
  `terminal` varchar(5) NOT NULL,
  `add` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `magazinu`
--

INSERT INTO `magazinu` (`ID`, `name`, `tab_show`, `perv_prod`, `terminal`, `add`) VALUES
(1, '-----', '111', '0', 'no', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `operatoru`
--

DROP TABLE IF EXISTS `operatoru`;
CREATE TABLE IF NOT EXISTS `operatoru` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `oper` varchar(100) NOT NULL,
  `priznak` varchar(100) NOT NULL,
  `schet` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `operatoru`
--

INSERT INTO `operatoru` (`ID`, `oper`, `priznak`, `schet`) VALUES
(1, 'Интертелеком', 'Тарыфный план', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `otchet`
--

DROP TABLE IF EXISTS `otchet`;
CREATE TABLE IF NOT EXISTS `otchet` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_prodaja` int(10) NOT NULL,
  `data` varchar(100) NOT NULL,
  `magazin` varchar(100) NOT NULL,
  `ID_operatora` varchar(100) NOT NULL,
  `fio` varchar(100) NOT NULL,
  `nomer_abon` varchar(100) NOT NULL,
  `kontakt_nomer` varchar(100) NOT NULL,
  `paket` varchar(100) NOT NULL,
  `kluch_evdo` varchar(100) NOT NULL,
  `avans` varchar(100) NOT NULL,
  `oplata` varchar(100) NOT NULL,
  `ostatok` varchar(100) NOT NULL,
  `oborudov` varchar(100) NOT NULL,
  `sec_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_2chast`
--

DROP TABLE IF EXISTS `payment_2chast`;
CREATE TABLE IF NOT EXISTS `payment_2chast` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `poryadok` varchar(100) NOT NULL,
  `nomer` varchar(100) NOT NULL,
  `l_s` varchar(100) NOT NULL,
  `fio_abonenta` varchar(200) NOT NULL,
  `podklucheno` varchar(200) NOT NULL,
  `akciya` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `opisanie` varchar(200) NOT NULL,
  `data` varchar(100) NOT NULL,
  `data_otkl` varchar(100) NOT NULL,
  `region` varchar(200) NOT NULL,
  `tip` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `vtoraya_chast_voznag` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_dilers`
--

DROP TABLE IF EXISTS `payment_dilers`;
CREATE TABLE IF NOT EXISTS `payment_dilers` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `procent` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_neokup`
--

DROP TABLE IF EXISTS `payment_neokup`;
CREATE TABLE IF NOT EXISTS `payment_neokup` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nomer` varchar(100) NOT NULL,
  `l_s` varchar(100) NOT NULL,
  `fio_abonenta` varchar(200) NOT NULL,
  `podklucheno` varchar(200) NOT NULL,
  `akciya` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `opisanie` varchar(200) NOT NULL,
  `data` varchar(200) NOT NULL,
  `data_otkl` varchar(200) NOT NULL,
  `region` varchar(200) NOT NULL,
  `tip` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `uderjano` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_ottok`
--

DROP TABLE IF EXISTS `payment_ottok`;
CREATE TABLE IF NOT EXISTS `payment_ottok` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `region` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `abonent` varchar(200) NOT NULL,
  `lic_schet` varchar(100) NOT NULL,
  `nomer_tel` varchar(100) NOT NULL,
  `tp_pri_podkl` varchar(200) NOT NULL,
  `tip_tp` varchar(200) NOT NULL,
  `data_podkl` varchar(200) NOT NULL,
  `akciya` varchar(200) NOT NULL,
  `tp_pri_otkl` varchar(200) NOT NULL,
  `data_otkl` varchar(200) NOT NULL,
  `uderjat_za_ottok` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_podkl`
--

DROP TABLE IF EXISTS `payment_podkl`;
CREATE TABLE IF NOT EXISTS `payment_podkl` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nomer` varchar(100) NOT NULL,
  `l_s` varchar(100) NOT NULL,
  `fio_abonenta` varchar(200) NOT NULL,
  `podklucheno` varchar(200) NOT NULL,
  `akciya` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `opisanie` varchar(200) NOT NULL,
  `data` varchar(200) NOT NULL,
  `region` varchar(200) NOT NULL,
  `tip` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `proekt` varchar(200) NOT NULL,
  `gruppa_voznag` varchar(200) NOT NULL,
  `kateg_voznag` varchar(200) NOT NULL,
  `tip_voznag` varchar(200) NOT NULL,
  `systema_nalog` varchar(200) NOT NULL,
  `voznagrajdenie` varchar(100) NOT NULL,
  `dop_bonus` varchar(100) NOT NULL,
  `router` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_router`
--

DROP TABLE IF EXISTS `payment_router`;
CREATE TABLE IF NOT EXISTS `payment_router` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) NOT NULL,
  `cena` varchar(100) NOT NULL,
  `l_s` varchar(100) NOT NULL,
  `nomer_telefona` varchar(100) NOT NULL,
  `data_opl_scheta` varchar(100) NOT NULL,
  `klient` varchar(200) NOT NULL,
  `terminal` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `polzovatel` varchar(200) NOT NULL,
  `god` varchar(10) NOT NULL,
  `mesyac` varchar(10) NOT NULL,
  `den` varchar(10) NOT NULL,
  `region_po_dileru` varchar(200) NOT NULL,
  `region_po_nomeru` varchar(200) NOT NULL,
  `summa_nalogu` varchar(200) NOT NULL,
  `tip_voznagrajdeniya` varchar(200) NOT NULL,
  `voznagrajdenie` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_trafik`
--

DROP TABLE IF EXISTS `payment_trafik`;
CREATE TABLE IF NOT EXISTS `payment_trafik` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `region` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `diler` varchar(200) NOT NULL,
  `lic_schet` varchar(100) NOT NULL,
  `abonent` varchar(200) NOT NULL,
  `telefon` varchar(100) NOT NULL,
  `tarif_plan` varchar(200) NOT NULL,
  `data_podkl` varchar(100) NOT NULL,
  `bonus` varchar(100) NOT NULL,
  `internet_trafik` varchar(100) NOT NULL,
  `akciya` varchar(100) NOT NULL,
  `paket_v_otchot_mes` varchar(200) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_vosstanov`
--

DROP TABLE IF EXISTS `payment_vosstanov`;
CREATE TABLE IF NOT EXISTS `payment_vosstanov` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `region` varchar(200) NOT NULL,
  `oficialn_diler` varchar(200) NOT NULL,
  `nomer_telefona` varchar(100) NOT NULL,
  `l_s` varchar(100) NOT NULL,
  `data_podkl` varchar(100) NOT NULL,
  `torgovaya_tochka` varchar(200) NOT NULL,
  `klient` varchar(200) NOT NULL,
  `usluga` varchar(200) NOT NULL,
  `operator` varchar(200) NOT NULL,
  `bonus` varchar(100) NOT NULL,
  `sec_data` varchar(10) NOT NULL,
  `filename` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `peremeschenie`
--

DROP TABLE IF EXISTS `peremeschenie`;
CREATE TABLE IF NOT EXISTS `peremeschenie` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) DEFAULT NULL,
  `kateg` varchar(100) NOT NULL,
  `tovar` varchar(100) DEFAULT NULL,
  `kolichestvo` varchar(100) DEFAULT NULL,
  `peremescheno_otkuda` varchar(100) DEFAULT NULL,
  `peremescheno_kuda` varchar(100) DEFAULT NULL,
  `sec_data` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_magazina` int(10) NOT NULL,
  `naimenov` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `plane` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `prase`
--

DROP TABLE IF EXISTS `prase`;
CREATE TABLE IF NOT EXISTS `prase` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `ID_kategorii` int(100) NOT NULL,
  `tovar` varchar(100) NOT NULL,
  `cena` varchar(100) NOT NULL,
  `voznag` varchar(100) NOT NULL DEFAULT '----',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `prihodu`
--

DROP TABLE IF EXISTS `prihodu`;
CREATE TABLE IF NOT EXISTS `prihodu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) NOT NULL,
  `ID_magazina` int(10) NOT NULL,
  `ID_kategorii` int(10) NOT NULL,
  `ID_tovara` int(10) NOT NULL,
  `kol_prihoda` varchar(100) NOT NULL,
  `primech` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `sec_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `prodaja`
--

DROP TABLE IF EXISTS `prodaja`;
CREATE TABLE IF NOT EXISTS `prodaja` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) NOT NULL,
  `b` varchar(2) NOT NULL,
  `magazin` varchar(100) NOT NULL,
  `kategoria` varchar(100) NOT NULL,
  `naimenovanie` varchar(100) NOT NULL,
  `serialnum` varchar(100) NOT NULL,
  `shtrihkod` varchar(100) NOT NULL,
  `voznag_za_jelezo` varchar(100) NOT NULL,
  `stoimost` varchar(100) NOT NULL,
  `procent_prod` varchar(10) NOT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `tarifn_plan` varchar(100) DEFAULT NULL,
  `voznag_za_tp` varchar(100) DEFAULT NULL,
  `oplata_tp_podkluchenie` varchar(100) DEFAULT NULL,
  `kluch_evdo` varchar(100) DEFAULT NULL,
  `kontakt_nomer_tel` varchar(100) DEFAULT NULL,
  `FIO` varchar(200) DEFAULT NULL,
  `abonent_nomer` varchar(100) DEFAULT NULL,
  `mesto_polz` varchar(100) DEFAULT NULL,
  `skidka` varchar(100) DEFAULT NULL,
  `sebestoimost` varchar(10) DEFAULT NULL,
  `add` varchar(500) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `akciya` varchar(5) NOT NULL,
  `sposob_opl` varchar(5) NOT NULL,
  `printer_ID` varchar(10) NOT NULL,
  `sec_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `rahunok`
--

DROP TABLE IF EXISTS `rahunok`;
CREATE TABLE IF NOT EXISTS `rahunok` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `ID_operatora` int(10) NOT NULL,
  `rahunok` varchar(100) NOT NULL,
  `sec_data` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `rashodu`
--

DROP TABLE IF EXISTS `rashodu`;
CREATE TABLE IF NOT EXISTS `rashodu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `p_m` varchar(5) NOT NULL,
  `ID_magazina` int(10) NOT NULL,
  `primech` varchar(200) NOT NULL,
  `summ` varchar(100) NOT NULL,
  `sec_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `remontu`
--

DROP TABLE IF EXISTS `remontu`;
CREATE TABLE IF NOT EXISTS `remontu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `magazin` varchar(100) NOT NULL,
  `data_priema` varchar(100) DEFAULT NULL,
  `nomer_tel` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `prichina_remonta` varchar(200) DEFAULT NULL,
  `garantiya` varchar(10) DEFAULT NULL,
  `stoimost` varchar(100) DEFAULT NULL,
  `zacluchenie` varchar(100) DEFAULT NULL,
  `sec_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sebestoim`
--

DROP TABLE IF EXISTS `sebestoim`;
CREATE TABLE IF NOT EXISTS `sebestoim` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_magazina` int(10) NOT NULL,
  `ID_tovara` int(10) NOT NULL,
  `kolichestvo` varchar(100) NOT NULL,
  `sebestoimost` varchar(100) NOT NULL,
  `data` varchar(100) NOT NULL,
  `sys_data` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `serialnum`
--

DROP TABLE IF EXISTS `serialnum`;
CREATE TABLE IF NOT EXISTS `serialnum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_ketegorii` int(10) NOT NULL,
  `ID_tovara` int(10) NOT NULL,
  `ID_shtrihkoda` int(10) NOT NULL,
  `serial_number` varchar(100) NOT NULL,
  `date_time_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shoutbox`
--

DROP TABLE IF EXISTS `shoutbox`;
CREATE TABLE IF NOT EXISTS `shoutbox` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(25) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shtrihkod`
--

DROP TABLE IF EXISTS `shtrihkod`;
CREATE TABLE IF NOT EXISTS `shtrihkod` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_ketegorii` int(10) NOT NULL,
  `ID_tovara` int(10) NOT NULL,
  `shtrih` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sklad_kategorii`
--

DROP TABLE IF EXISTS `sklad_kategorii`;
CREATE TABLE IF NOT EXISTS `sklad_kategorii` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `kateg` varchar(100) NOT NULL,
  `add` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sklad_tovaru`
--

DROP TABLE IF EXISTS `sklad_tovaru`;
CREATE TABLE IF NOT EXISTS `sklad_tovaru` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_magazina` int(10) NOT NULL,
  `ID_kategorii` int(10) NOT NULL,
  `ID_tovara` int(10) NOT NULL,
  `kol_posl_prihoda` varchar(100) NOT NULL,
  `data_posl_prihoda` varchar(100) NOT NULL,
  `kolichestvo` int(5) NOT NULL,
  `add` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sysconfig`
--

DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE IF NOT EXISTS `sysconfig` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `param` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `enabled` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `sysconfig`
--

INSERT INTO `sysconfig` (`ID`, `param`, `value`, `enabled`) VALUES
(1, 'pay_message', 'Уважаемые пользователи, не забывайте, пожалуйста, выполнять оплату до каждого 1-го числа последующего месяца.</br> &nbsp;&nbsp;&nbsp;Поскольку с наступлением нового месяца восстановление доступа к базе данных может занять несколько часов!', 'yes'),
(2, 'site_redirect', 'http://sand-box.pp.ua/payment_info_for_sand-box/', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `tarifplan`
--

DROP TABLE IF EXISTS `tarifplan`;
CREATE TABLE IF NOT EXISTS `tarifplan` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_oper` int(10) NOT NULL,
  `tarifplan` varchar(100) NOT NULL,
  `stoim_podkl` varchar(100) NOT NULL,
  `voznagtp` varchar(100) NOT NULL DEFAULT '----',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `timezone`
--

DROP TABLE IF EXISTS `timezone`;
CREATE TABLE IF NOT EXISTS `timezone` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `time_zone` varchar(100) CHARACTER SET latin1 NOT NULL,
  `prim` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `timezone`
--

INSERT INTO `timezone` (`ID`, `time_zone`, `prim`) VALUES
(1, 'summer', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `AED` varchar(50) NOT NULL,
  `VOT` varchar(50) NOT NULL,
  `storepriv` varchar(50) NOT NULL,
  `allpriv` varchar(1) NOT NULL,
  `kassapriv` varchar(1) NOT NULL,
  `rollpriv` varchar(1) NOT NULL,
  `sebespriv` varchar(1) NOT NULL,
  `kontpriv` varchar(1) NOT NULL,
  `adminpriv` varchar(10) NOT NULL,
  `rootpriv` varchar(10) NOT NULL,
  `fio_usera` varchar(100) NOT NULL,
  `stavka` varchar(100) NOT NULL,
  `bonus_stavka` varchar(5) NOT NULL,
  `proc_stavka` varchar(5) NOT NULL,
  `vozvrat_voznag` varchar(5) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1002 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `login`, `password`, `AED`, `VOT`, `storepriv`, `allpriv`, `kassapriv`, `rollpriv`, `sebespriv`, `kontpriv`, `adminpriv`, `rootpriv`, `fio_usera`, `stavka`, `bonus_stavka`, `proc_stavka`, `vozvrat_voznag`) VALUES
(1001, 'admin', '234d4e6659170ec26b764dd702f195ec', '11111111111', '111111111', '1', '1', '1', '1', '1', '0', '1', '1', '', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `vozvratu`
--

DROP TABLE IF EXISTS `vozvratu`;
CREATE TABLE IF NOT EXISTS `vozvratu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `magazin` varchar(100) NOT NULL,
  `data` varchar(100) DEFAULT NULL,
  `t_a` varchar(5) DEFAULT NULL,
  `kategoria` varchar(100) NOT NULL,
  `naimenovanie` varchar(100) DEFAULT NULL,
  `esn` varchar(100) DEFAULT NULL,
  `kolichestvo` varchar(10) DEFAULT NULL,
  `data_pokupki_vozvr_ob` varchar(100) DEFAULT NULL,
  `summa_nal` varchar(100) DEFAULT NULL,
  `summa_bez_nal` varchar(100) DEFAULT NULL,
  `sebestoim` varchar(100) DEFAULT NULL,
  `prichina_vozvrata` varchar(200) DEFAULT NULL,
  `per_14_dney` varchar(5) DEFAULT NULL,
  `obmen_na` varchar(100) DEFAULT NULL,
  `daln_dvijenie_vozvr_tov` varchar(100) DEFAULT NULL,
  `primechanie` varchar(200) DEFAULT NULL,
  `flag` varchar(10) NOT NULL DEFAULT 'false',
  `sec_data` varchar(100) NOT NULL,
  `kto_pvinyal` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `zarplata`
--

DROP TABLE IF EXISTS `zarplata`;
CREATE TABLE IF NOT EXISTS `zarplata` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_prodaja` int(10) NOT NULL,
  `ID_magazina` int(10) NOT NULL,
  `ID_usera` int(10) NOT NULL,
  `data` varchar(100) DEFAULT NULL,
  `vremya` varchar(100) NOT NULL,
  `polniy_den` varchar(100) DEFAULT NULL,
  `polov_dnya` varchar(100) DEFAULT NULL,
  `voznag_za_tp` varchar(100) DEFAULT NULL,
  `prodaja` varchar(100) DEFAULT NULL,
  `procent` varchar(10) DEFAULT NULL,
  `k_oplate` varchar(100) DEFAULT NULL,
  `vudano` varchar(100) DEFAULT NULL,
  `shtraf` varchar(100) DEFAULT NULL,
  `bonus` varchar(100) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `zarplata`
--

INSERT INTO `zarplata` (`ID`, `ID_prodaja`, `ID_magazina`, `ID_usera`, `data`, `vremya`, `polniy_den`, `polov_dnya`, `voznag_za_tp`, `prodaja`, `procent`, `k_oplate`, `vudano`, `shtraf`, `bonus`, `user`) VALUES
(1, 0, 1, 1001, '----', '----', '----', '----', '----', '----', '----', '----', '----', '----', '----', '----'),
(2, 0, 1, 1001, '01.01.2012', '00:00:00', '0', '----', '----', '----', '----', '0', '----', '----', '----', '----');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
