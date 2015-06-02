-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jun 02, 2015 at 08:48 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `key1shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `allwords`
--

CREATE TABLE `allwords` (
  `doc_id` int(11) NOT NULL,
  `word` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `keyword` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `allwords`
--

INSERT INTO `allwords` (`doc_id`, `word`, `count`, `keyword`) VALUES
(1, 'after', 1, 0),
(1, 'along', 1, 0),
(1, 'also', 1, 0),
(1, 'ancient', 1, 0),
(1, 'andhra', 3, 0),
(1, 'areas', 1, 0),
(1, 'bean', 6, 1),
(1, 'belong', 1, 0),
(1, 'black', 10, 1),
(1, 'coastal', 1, 0),
(1, 'confused', 1, 0),
(1, 'considered', 1, 0),
(1, 'culinaris', 1, 0),
(1, 'cultivation', 1, 0),
(1, 'dal', 2, 0),
(1, 'district', 1, 0),
(1, 'famous', 1, 0),
(1, 'first', 1, 0),
(1, 'gram', 5, 1),
(1, 'grown', 1, 0),
(1, 'guntur', 1, 0),
(1, 'highly', 1, 0),
(1, 'immigrants', 1, 0),
(1, 'india', 2, 0),
(1, 'indian', 2, 0),
(1, 'introduced', 1, 0),
(1, 'known', 1, 0),
(1, 'lens', 1, 0),
(1, 'lentil', 6, 1),
(1, 'mainly', 1, 0),
(1, 'matpe', 1, 0),
(1, 'mung', 2, 0),
(1, 'mungo', 2, 0),
(1, 'one', 2, 0),
(1, 'originated', 1, 0),
(1, 'other', 1, 0),
(1, 'paddy', 1, 0),
(1, 'pakistan', 1, 0),
(1, 'phaseolus', 1, 0),
(1, 'placed', 1, 0),
(1, 'pradesh', 2, 0),
(1, 'prized', 1, 0),
(1, 'product', 2, 0),
(1, 'production', 1, 0),
(1, 'pulses', 1, 0),
(1, 'ranks', 1, 0),
(1, 'region', 1, 0),
(1, 'removed', 1, 0),
(1, 'same', 2, 0),
(1, 'since', 1, 0),
(1, 'skin', 1, 0),
(1, 'smaller', 1, 0),
(1, 'sold', 2, 0),
(1, 'species', 1, 0),
(1, 'subcontinent', 1, 0),
(1, 'time', 1, 0),
(1, 'times', 1, 0),
(1, 'transferred', 1, 0),
(1, 'tropical', 1, 0),
(1, 'true', 1, 0),
(1, 'urad', 3, 1),
(1, 'usually', 1, 0),
(1, 'vigna', 2, 0),
(1, 'where', 1, 0),
(1, 'white', 2, 0),
(1, 'whole', 1, 0),
(2, 'afri', 1, 0),
(2, 'after', 1, 0),
(2, 'agricultural', 1, 0),
(2, 'asia', 1, 0),
(2, 'asian', 1, 0),
(2, 'cereal', 1, 0),
(2, 'commodity', 1, 1),
(2, 'consumed', 1, 0),
(2, 'especially', 1, 0),
(2, 'food', 1, 0),
(2, 'glaberrima', 1, 1),
(2, 'grain', 1, 0),
(2, 'grass', 1, 0),
(2, 'highest', 1, 0),
(2, 'human', 1, 0),
(2, 'large', 1, 0),
(2, 'maize', 1, 0),
(2, 'oryza', 2, 1),
(2, 'part', 1, 0),
(2, 'population', 1, 0),
(2, 'production', 1, 0),
(2, 'rice', 3, 1),
(2, 'sativa', 1, 0),
(2, 'seed', 1, 0),
(2, 'species', 1, 0),
(2, 'staple', 1, 0),
(2, 'sugarcane', 1, 1),
(2, 'third', 1, 0),
(2, 'widely', 1, 0),
(2, 'world', 1, 0),
(2, 'worldwide', 1, 0),
(3, 'afri', 1, 0),
(3, 'after', 1, 0),
(3, 'agricultural', 1, 0),
(3, 'asia', 1, 0),
(3, 'asian', 1, 0),
(3, 'cereal', 1, 0),
(3, 'commodity', 1, 1),
(3, 'consumed', 1, 0),
(3, 'especially', 1, 0),
(3, 'food', 1, 0),
(3, 'glaberrima', 1, 1),
(3, 'grain', 1, 0),
(3, 'grass', 1, 0),
(3, 'highest', 1, 0),
(3, 'human', 1, 0),
(3, 'large', 1, 0),
(3, 'maize', 1, 0),
(3, 'oryza', 2, 1),
(3, 'part', 1, 0),
(3, 'population', 1, 0),
(3, 'production', 1, 0),
(3, 'rice', 3, 1),
(3, 'sativa', 1, 0),
(3, 'seed', 1, 0),
(3, 'species', 1, 0),
(3, 'staple', 1, 0),
(3, 'sugarcane', 1, 1),
(3, 'third', 1, 0),
(3, 'widely', 1, 0),
(3, 'world', 1, 0),
(3, 'worldwide', 1, 0),
(4, 'after', 2, 0),
(4, 'cereal', 3, 1),
(4, 'close', 1, 0),
(4, 'cultivated', 1, 0),
(4, 'east', 1, 0),
(4, 'grain', 1, 0),
(4, 'levant', 1, 0),
(4, 'maize', 2, 0),
(4, 'making', 1, 0),
(4, 'million', 6, 1),
(4, 'near', 1, 0),
(4, 'now', 1, 0),
(4, 'originally', 1, 0),
(4, 'produced', 2, 1),
(4, 'production', 2, 0),
(4, 'region', 1, 0),
(4, 'rice', 2, 0),
(4, 'second', 1, 0),
(4, 'spp', 1, 0),
(4, 'third', 2, 0),
(4, 'tons', 6, 1),
(4, 'triticum', 1, 0),
(4, 'wheat', 3, 1),
(4, 'world', 2, 0),
(4, 'worldwide', 1, 0),
(4, 'year', 1, 0),
(5, 'also', 1, 0),
(5, 'alternatively', 1, 0),
(5, 'asia', 1, 0),
(5, 'bean', 3, 1),
(5, 'both', 1, 1),
(5, 'china', 1, 0),
(5, 'cultivated', 2, 1),
(5, 'dishes', 1, 0),
(5, 'dry', 1, 0),
(5, 'europe', 1, 0),
(5, 'family', 1, 0),
(5, 'gram', 1, 0),
(5, 'green', 1, 0),
(5, 'hot', 1, 0),
(5, 'india', 1, 0),
(5, 'indian', 1, 0),
(5, 'ingredient', 1, 0),
(5, 'known', 1, 0),
(5, 'legume', 1, 0),
(5, 'lentil', 1, 0),
(5, 'mainly', 1, 0),
(5, 'moong', 1, 0),
(5, 'mung', 2, 1),
(5, 'mungo', 1, 0),
(5, 'native', 1, 0),
(5, 'plant', 1, 0),
(5, 'radiata', 1, 0),
(5, 'regions', 1, 0),
(5, 'savory', 1, 0),
(5, 'southeast', 1, 0),
(5, 'southern', 2, 1),
(5, 'species', 1, 0),
(5, 'states', 1, 0),
(5, 'subcontinent', 1, 0),
(5, 'sweet', 1, 0),
(5, 'today', 1, 0),
(5, 'united', 1, 0),
(5, 'used', 1, 0),
(5, 'vigna', 1, 0),
(6, 'afghanistan', 2, 0),
(6, 'also', 1, 0),
(6, 'asia', 2, 0),
(6, 'badghis', 1, 0),
(6, 'california', 1, 0),
(6, 'cashew', 1, 0),
(6, 'central', 2, 0),
(6, 'china', 1, 0),
(6, 'confused', 1, 0),
(6, 'consumed', 1, 0),
(6, 'cyprus', 1, 0),
(6, 'distinguished', 1, 0),
(6, 'distributions', 1, 0),
(6, 'east', 1, 0),
(6, 'eastern', 1, 0),
(6, 'egypt', 1, 0),
(6, 'especially', 1, 0),
(6, 'family', 1, 0),
(6, 'food', 1, 0),
(6, 'found', 1, 0),
(6, 'genus', 1, 0),
(6, 'geographic', 1, 0),
(6, 'greece', 1, 0),
(6, 'have', 1, 0),
(6, 'india', 1, 0),
(6, 'indigenous', 1, 0),
(6, 'iran', 1, 0),
(6, 'israel', 1, 0),
(6, 'italy', 1, 0),
(6, 'known', 1, 0),
(6, 'kyrgyzstan', 2, 1),
(6, 'lebanon', 1, 0),
(6, 'mediterranean', 1, 0),
(6, 'member', 1, 0),
(6, 'middle', 1, 0),
(6, 'often', 1, 0),
(6, 'originally', 1, 0),
(6, 'other', 1, 0),
(6, 'persian', 1, 0),
(6, 'pistachio', 3, 1),
(6, 'pistacia', 3, 1),
(6, 'produces', 1, 0),
(6, 'provinces', 1, 0),
(6, 'regions', 1, 0),
(6, 'samangan', 1, 0),
(6, 'seeds', 2, 0),
(6, 'shell', 1, 0),
(6, 'sicily', 1, 0),
(6, 'sm', 1, 0),
(6, 'smaller', 1, 0),
(6, 'soft', 1, 0),
(6, 'species', 2, 0),
(6, 'specifically', 1, 0),
(6, 'states', 1, 0),
(6, 'syria', 2, 0),
(6, 'tajikistan', 2, 0),
(6, 'tree', 2, 0),
(6, 'trees', 1, 0),
(6, 'tunisia', 1, 0),
(6, 'turkey', 2, 1),
(6, 'turkmenistan', 2, 0);
INSERT INTO `allwords` (`doc_id`, `word`, `count`, `keyword`) VALUES
(6, 'united', 1, 0),
(6, 'uzbekistan', 2, 0),
(6, 'vera', 3, 1),
(6, 'widely', 1, 0),
(6, 'wild', 1, 0),
(6, 'xinjiang', 2, 0),
(7, 'acids', 1, 0),
(7, 'allergens', 2, 0),
(7, 'allergy', 2, 0),
(7, 'almond', 3, 1),
(7, 'almonds', 3, 1),
(7, 'also', 2, 0),
(7, 'amygdalus', 3, 1),
(7, 'anaphylaxis', 1, 0),
(7, 'angioedema', 1, 0),
(7, 'asia', 1, 0),
(7, 'associated', 1, 0),
(7, 'associates', 1, 0),
(7, 'beta', 1, 0),
(7, 'blood', 1, 0),
(7, 'butyrate', 1, 0),
(7, 'calcium', 1, 0),
(7, 'campestanol', 1, 0),
(7, 'campesterol', 1, 0),
(7, 'cause', 1, 0),
(7, 'cells', 1, 0),
(7, 'chain', 1, 0),
(7, 'cholesterol', 2, 0),
(7, 'common', 1, 0),
(7, 'communis', 1, 0),
(7, 'consumption', 1, 0),
(7, 'contact', 1, 0),
(7, 'contain', 1, 0),
(7, 'containing', 1, 0),
(7, 'copper', 1, 0),
(7, 'cross', 1, 0),
(7, 'dense', 1, 0),
(7, 'density', 2, 0),
(7, 'dietary', 1, 0),
(7, 'digestion', 1, 0),
(7, 'dulcis', 2, 0),
(7, 'during', 1, 0),
(7, 'east', 1, 0),
(7, 'elevated', 1, 0),
(7, 'essential', 1, 0),
(7, 'fats', 3, 0),
(7, 'fatty', 1, 0),
(7, 'fermented', 1, 0),
(7, 'fiber', 1, 0),
(7, 'flour', 1, 0),
(7, 'food', 1, 0),
(7, 'gastrointestinal', 1, 0),
(7, 'have', 1, 0),
(7, 'high', 1, 0),
(7, 'humans', 1, 0),
(7, 'including', 1, 0),
(7, 'intestine', 1, 0),
(7, 'intolerance', 1, 0),
(7, 'large', 1, 0),
(7, 'ldl', 1, 0),
(7, 'levels', 1, 0),
(7, 'lining', 1, 0),
(7, 'lipid', 1, 0),
(7, 'lipoproteins', 2, 0),
(7, 'local', 1, 0),
(7, 'low', 1, 0),
(7, 'lower', 2, 0),
(7, 'lowering', 1, 0),
(7, 'magnesium', 1, 0),
(7, 'manganese', 1, 0),
(7, 'may', 3, 1),
(7, 'middle', 1, 0),
(7, 'minerals', 1, 0),
(7, 'monounsaturated', 1, 0),
(7, 'native', 1, 0),
(7, 'notably', 1, 0),
(7, 'nut', 1, 0),
(7, 'nutrient', 1, 0),
(7, 'nutritionally', 1, 0),
(7, 'nuts', 1, 0),
(7, 'oral', 1, 0),
(7, 'peach', 1, 0),
(7, 'per', 1, 0),
(7, 'phytosterols', 1, 0),
(7, 'polyunsaturated', 1, 0),
(7, 'potassium', 1, 0),
(7, 'potentially', 1, 0),
(7, 'preliminary', 1, 0),
(7, 'process', 1, 0),
(7, 'properties', 1, 0),
(7, 'proteins', 1, 0),
(7, 'prunus', 2, 0),
(7, 'range', 1, 0),
(7, 'reactivity', 1, 0),
(7, 'research', 1, 0),
(7, 'respiratory', 1, 0),
(7, 'rich', 2, 0),
(7, 'see', 1, 0),
(7, 'seeds', 1, 0),
(7, 'short', 1, 0),
(7, 'signs', 2, 0),
(7, 'sitostanol', 1, 0),
(7, 'sitosterol', 1, 0),
(7, 'source', 1, 0),
(7, 'south', 1, 0),
(7, 'species', 1, 0),
(7, 'stigmasterol', 1, 0),
(7, 'substrate', 1, 0),
(7, 'such', 2, 0),
(7, 'symptoms', 4, 1),
(7, 'syn', 1, 0),
(7, 'syndrome', 1, 0),
(7, 'systemic', 1, 0),
(7, 'table', 1, 0),
(7, 'they', 1, 0),
(7, 'transfer', 1, 0),
(7, 'tree', 2, 0),
(7, 'typical', 1, 0),
(7, 'urticaria', 2, 0),
(7, 'vitamin', 1, 0),
(7, 'vitamins', 1, 0),
(7, 'well', 1, 0),
(8, 'add', 1, 0),
(8, 'additions', 1, 0),
(8, 'any', 1, 0),
(8, 'before', 1, 1),
(8, 'boiled', 1, 0),
(8, 'cake', 1, 1),
(8, 'chilly', 1, 0),
(8, 'contains', 1, 0),
(8, 'cooked', 1, 0),
(8, 'directly', 1, 0),
(8, 'eat', 1, 0),
(8, 'eaten', 1, 0),
(8, 'eggs', 1, 0),
(8, 'enhance', 1, 0),
(8, 'enhancer', 1, 0),
(8, 'flavoured', 1, 0),
(8, 'make', 1, 0),
(8, 'meat', 1, 0),
(8, 'nepal', 1, 0),
(8, 'noodle', 1, 0),
(8, 'noodles', 4, 1),
(8, 'oil', 1, 0),
(8, 'packaging', 1, 0),
(8, 'packet', 1, 0),
(8, 'packets', 1, 0),
(8, 'popular', 1, 0),
(8, 'powder', 1, 0),
(8, 'pre', 1, 0),
(8, 'separate', 1, 0),
(8, 'sm', 1, 0),
(8, 'soup', 1, 0),
(8, 'taste', 2, 1),
(8, 'type', 1, 0),
(8, 'vegetable', 1, 0),
(8, 'wai', 2, 1),
(8, 'you', 1, 0),
(8, 'your', 1, 0),
(9, 'although', 1, 0),
(9, 'available', 1, 0),
(9, 'b', 1, 0),
(9, 'background', 1, 0),
(9, 'beaten', 2, 0),
(9, 'beloved', 1, 0),
(9, 'combination', 1, 0),
(9, 'consisting', 1, 0),
(9, 'consists', 1, 0),
(9, 'constituent', 1, 0),
(9, 'core', 1, 0),
(9, 'country', 2, 0),
(9, 'crispy', 1, 0),
(9, 'delicacy', 1, 0),
(9, 'different', 2, 0),
(9, 'dish', 2, 0),
(9, 'dry', 1, 0),
(9, 'each', 1, 0),
(9, 'easily', 1, 0),
(9, 'easy', 1, 0),
(9, 'eating', 1, 0),
(9, 'enjoyed', 2, 1),
(9, 'familiar', 1, 0),
(9, 'family', 1, 0),
(9, 'find', 1, 0),
(9, 'fixed', 1, 0),
(9, 'flakes', 1, 0),
(9, 'flexible', 1, 0),
(9, 'food', 1, 0),
(9, 'fresh', 1, 0),
(9, 'fru', 1, 0),
(9, 'frying', 1, 0),
(9, 'furandana', 4, 1),
(9, 'furundana', 1, 0),
(9, 'grocery', 1, 0),
(9, 'harmony', 1, 0),
(9, 'having', 1, 0),
(9, 'improvises', 1, 0),
(9, 'ingredients', 2, 0),
(9, 'keeps', 1, 0),
(9, 'later', 1, 0),
(9, 'lentils', 1, 0),
(9, 'little', 1, 0),
(9, 'live', 2, 0),
(9, 'living', 1, 0),
(9, 'local', 1, 0),
(9, 'lot', 1, 0),
(9, 'lunch', 1, 0),
(9, 'made', 1, 0),
(9, 'make', 1, 0),
(9, 'mixed', 1, 0),
(9, 'mixing', 1, 0),
(9, 'months', 1, 0),
(9, 'nepal', 1, 0),
(9, 'nepali', 1, 0),
(9, 'never', 1, 0),
(9, 'nuts', 2, 0),
(9, 'other', 2, 0),
(9, 'over', 1, 0),
(9, 'peas', 1, 0),
(9, 'people', 1, 0),
(9, 'popular', 1, 0),
(9, 'potato', 1, 0),
(9, 'prepared', 2, 0),
(9, 'products', 1, 0),
(9, 'proportions', 1, 0),
(9, 'recipe', 1, 0),
(9, 'relatively', 1, 0),
(9, 'representing', 1, 0),
(9, 'rice', 4, 1),
(9, 'salty', 2, 0),
(9, 'sects', 1, 0),
(9, 'seeds', 1, 0),
(9, 'six', 1, 0),
(9, 'skill', 1, 0),
(9, 'snack', 4, 1),
(9, 'somewhat', 1, 0),
(9, 'sticks', 1, 0),
(9, 'stock', 1, 0),
(9, 'stocked', 1, 0),
(9, 'stored', 1, 0),
(9, 'stories', 1, 0),
(9, 'taken', 2, 0),
(9, 'taste', 1, 0),
(9, 'tea', 1, 0),
(9, 'then', 1, 0),
(9, 'there', 1, 0),
(9, 'tit', 1, 0),
(9, 'titb', 1, 0),
(9, 'traditional', 3, 1),
(9, 'unique', 1, 0),
(9, 'way', 1, 0),
(9, 'where', 1, 0),
(9, 'wonder', 1, 0);
INSERT INTO `allwords` (`doc_id`, `word`, `count`, `keyword`) VALUES
(9, 'work', 1, 0),
(10, 'according', 1, 0),
(10, 'also', 2, 1),
(10, 'assortment', 1, 0),
(10, 'available', 3, 1),
(10, 'carbohydrates', 1, 0),
(10, 'carotenoids', 1, 1),
(10, 'color', 1, 0),
(10, 'contains', 1, 0),
(10, 'cook', 1, 0),
(10, 'deliver', 1, 0),
(10, 'different', 1, 0),
(10, 'easier', 1, 0),
(10, 'himalayan', 1, 0),
(10, 'large', 1, 0),
(10, 'medium', 1, 0),
(10, 'minerals', 1, 0),
(10, 'natural', 1, 0),
(10, 'needs', 1, 0),
(10, 'order', 1, 0),
(10, 'phenols', 1, 0),
(10, 'phytochemicals', 1, 0),
(10, 'potato', 3, 1),
(10, 'process', 1, 0),
(10, 'purchase', 1, 0),
(10, 'red', 1, 0),
(10, 'rich', 1, 0),
(10, 'similarly', 1, 0),
(10, 'size', 3, 1),
(10, 'sized', 1, 0),
(10, 'sm', 1, 0),
(10, 'such', 1, 0),
(10, 'tasty', 1, 0),
(10, 'variety', 1, 0),
(10, 'vitamins', 1, 0),
(10, 'well', 1, 0),
(10, 'white', 1, 0),
(10, 'your', 1, 0),
(11, 'available', 1, 0),
(11, 'blood', 1, 0),
(11, 'boiled', 1, 0),
(11, 'carbohydrates', 1, 0),
(11, 'dietary', 1, 0),
(11, 'during', 1, 0),
(11, 'eaten', 1, 0),
(11, 'fasting', 1, 1),
(11, 'fat', 1, 1),
(11, 'fiber', 1, 0),
(11, 'generally', 1, 1),
(11, 'good', 1, 0),
(11, 'low', 1, 0),
(11, 'minerals', 1, 0),
(11, 'nepal', 1, 0),
(11, 'other', 1, 0),
(11, 'patients', 1, 0),
(11, 'potato', 1, 0),
(11, 'pressure', 1, 1),
(11, 'red', 1, 0),
(11, 'rich', 2, 1),
(11, 'source', 1, 0),
(11, 'sweet', 1, 0),
(11, 'tasty', 1, 0),
(11, 'variety', 1, 0),
(11, 'vitamins', 1, 0),
(11, 'white', 1, 0),
(12, 'papadi', 1, 1),
(12, 'soan', 1, 1),
(12, 'sweet', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Beans and pulses'),
(2, 'Rice and other grains'),
(3, 'Dry Fruits'),
(4, 'Readymade foods'),
(5, 'Other food items');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf16_bin NOT NULL,
  `status` varchar(25) COLLATE utf16_bin NOT NULL DEFAULT 'pending',
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `address` varchar(255) COLLATE utf16_bin NOT NULL,
  `address2` varchar(255) COLLATE utf16_bin NOT NULL,
  `city` varchar(100) COLLATE utf16_bin NOT NULL,
  `state` varchar(100) COLLATE utf16_bin NOT NULL,
  `phone` varchar(30) COLLATE utf16_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `transaction_id`, `status`, `qty`, `price`, `address`, `address2`, `city`, `state`, `phone`, `timestamp`) VALUES
(1, 1, 1, '0', 'pending', 1, 130.00, 'Dallu', 'Swyambhu', 'Kathmandu', 'Bagmati', '9841234567', '0000-00-00 00:00:00'),
(2, 3, 2, '1', 'canceled', 10, 1100.00, 'Jaml', 'Rastriya Naachghar Aagadi', 'Kathmandu', 'Bagmati', '9849876543', '0000-00-00 00:00:00'),
(3, 6, 4, '0', 'settled', 1, 951.00, 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', 'Nuwakot, Bidur', 'Nepal', '9851098765', '2015-01-25 05:10:33'),
(4, 2, 4, '0', 'delivered', 2, 250.00, 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', 'Nuwakot, Bidur', 'Nepal', '9851098765', '2015-01-25 08:16:12'),
(5, 2, 4, '0', 'settled', 2, 250.00, 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', 'Nuwakot, Bidur', 'Nepal', '9851098765', '2015-01-25 08:17:21'),
(6, 10, 1, '0', 'settled', 1, 150.00, 'Kanad Place, Shanker Road 344', 'Opposite Ravishanker Mandir', 'New Delhi', 'India', '8237373623', '2015-01-26 10:42:18'),
(7, 10, 1, '0', 'pending', 1, 150.00, 'Kanad Place, Shanker Road 344', 'Opposite Ravishanker Mandir', 'New Delhi', 'India', '8237373623', '2015-01-26 13:59:00'),
(8, 10, 1, '0', 'pending', 99, 14850.00, 'Kanad Place, Shanker Road 344', 'Opposite Ravishanker Mandir', 'New Delhi', 'India', '8237373623', '2015-01-26 14:22:14'),
(12, 4, 4, '0', 'pending', 10, 450.00, 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', 'Nuwakot, Bidur', 'Nepal', '9851098765', '2015-01-27 02:07:03'),
(13, 1, 4, '0', 'pending', 4, 520.00, 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', 'Nuwakot, Bidur', 'Nepal', '9851098765', '2015-01-31 05:07:05'),
(14, 4, 2, '0', 'pending', 10, 450.00, 'Bagdurbar road 220/50', 'Baghdurbar, Sundhara', 'Kathmandu', 'Nepal', '9876543210', '2015-01-31 05:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
`id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf16_bin NOT NULL,
  `description` text COLLATE utf16_bin NOT NULL,
  `nutritional_value` text COLLATE utf16_bin NOT NULL,
  `image` varchar(100) COLLATE utf16_bin NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(20) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `nutritional_value`, `image`, `price`, `unit`) VALUES
(1, 1, 'Black Lentil (कालो दाल)', 'कालो दाल, माष, उदड, Vigna mungo, known as Urad Dal, black gram, black lentil, mungo bean (not to be confused with the much smaller true black lentil (Lens culinaris)), white lentil, black matpe bean, is a bean grown in the Indian subcontinent. It, along with the mung bean, was placed in Phaseolus, but has since been transferred to Vigna. At one time it was considered to belong to the same species as the mung bean. The product sold as "black lentil" is usually the whole urad bean or urad dal. The product sold as "white lentil" is the same lentil with the black skin removed.\n\nBlack gram originated in India, where it has been in cultivation from ancient times and is one of the most highly prized pulses of India and Pakistan. The coastal Andhra region in Andhra Pradesh is famous for black gram after paddy. The Guntur District ranks first in Andhra Pradesh for the production of black gram. Black gram has also been introduced to other tropical areas mainly by Indian immigrants.', '<strong>Amount Per 1 cup (207 g)</strong><br />\nCalories: 706<br />\nTotal Fat: 3.4 g	(5%)<br />\nSaturated fat: 0.2 g (1%)<br />\nPolyunsaturated fat: 2.2 g<br />	\nMonounsaturated fat: 0.2 g	<br />\nCholesterol: 0 mg (0%)<br />\nSodium: 79 mg	(3%)<br />\nPotassium: 2,035 mg	(58%)<br />\nTotal Carbohydrate: 122 g	(40%)<br />\nDietary fiber: 38 g (152%)<br />\nProtein: 52 g (104%)<br />\nVitamin A: 0%	<br />\nVitamin C: 0%<br />\n<strong>Trace minerals</strong><br />\nCalcium: 28%<br />\nIron: 87%<br />\nVitamin D: 0%<br />\nVitamin B-6: 30%\nVitamin B-12: 0%<br />\nMagnesium: 138%<br />', 'green-pulse-moong.jpg', 130.00, 'Kg'),
(2, 2, 'Basmati rice (वासमती चामल)', 'Rice is the seed of the grass species Oryza sativa (Asian rice) or Oryza glaberrima (African rice). As a cereal grain, it is the most widely consumed staple food for a large part of the world''s human population, especially in Asia. It is the agricultural commodity with the third-highest worldwide production, after sugarcane and maize.', '<strong>Nutritional value per 100 g</strong><br />\nEnergy: 1,527 kJ (365 kcal)<br />\nCarbohydrates: 80 g<br />\nSugars: 0.12 g<br />\nDietary fiber: 1.3 g<br />\nFat: 0.66 g<br />\nProtein: 7.13 g<br />\n<strong>Vitamins</strong><br />\nThiamine (B1): (6%) 0.0701 mg<br />\nRiboflavin (B2): (1%) 0.0149 mg<br />\nNiacin (B3): (11%) 1.62 mg<br />\nPantothenic acid (B5): (20%) 1.014 mg<br />\nVitamin B6: (13%) 0.164 mg<br />\n<strong>Trace metals</strong><br />\nCalcium: (3%) 28 mg<br />\nIron: (6%) 0.80 mg<br />\nMagnesium: (7%) 25 mg<br />\nManganese: (52%) 1.088 mg<br />\nPhosphorus: (16%) 115 mg<br />\nPotassium: (2%) 115 mg<br />\nZinc:  (11%) 1.09 mg<br />\n<strong>Other constituents</strong>\nWater: 11.61 g', 'basmati-rice-in-jute-bag.jpg', 125.00, 'Kg'),
(3, 2, 'Pokhrali Rice (पोखरेली चामल)', 'Rice is the seed of the grass species Oryza sativa (Asian rice) or Oryza glaberrima (African rice). As a cereal grain, it is the most widely consumed staple food for a large part of the world''s human population, especially in Asia. It is the agricultural commodity with the third-highest worldwide production, after sugarcane and maize.\r\n', '<strong>Nutritional value per 100 g</strong><br />\r\nEnergy: 1,527 kJ (365 kcal)<br />\r\nCarbohydrates: 80 g<br />\r\nSugars: 0.12 g<br />\r\nDietary fiber: 1.3 g<br />\r\nFat: 0.66 g<br />\r\nProtein: 7.13 g<br />\r\n<strong>Vitamins</strong><br />\r\nThiamine (B1): (6%) 0.0701 mg<br />\r\nRiboflavin (B2): (1%) 0.0149 mg<br />\r\nNiacin (B3): (11%) 1.62 mg<br />\r\nPantothenic acid (B5): (20%) 1.014 mg<br />\r\nVitamin B6: (13%) 0.164 mg<br />\r\n<strong>Trace metals</strong><br />\r\nCalcium: (3%) 28 mg<br />\r\nIron: (6%) 0.80 mg<br />\r\nMagnesium: (7%) 25 mg<br />\r\nManganese: (52%) 1.088 mg<br />\r\nPhosphorus: (16%) 115 mg<br />\r\nPotassium: (2%) 115 mg<br />\r\nZinc:  (11%) 1.09 mg<br />\r\n<strong>Other constituents</strong>\r\nWater: 11.61 g', 'rice-in-nanglo.jpg', 110.00, 'Kg');
INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `nutritional_value`, `image`, `price`, `unit`) VALUES
(4, 2, 'Wheat Flour (गहुँको पीठो)', 'Wheat (Triticum spp.) is a cereal grain, originally from the Levant region of the Near East but now cultivated worldwide. In 2010, world production of wheat was 651 million tons, making it the third most-produced cereal after maize (844 million tons) and rice (672 million tons). Wheat was the second most-produced cereal in 2009; world production in that year was 682 million tons, after maize (817 million tons), and with rice as a close third (679 million tons).', 'Nutritional value per 100 g\r\n<strong>Energy: 1,368 kJ (327 kcal)</strong><br />\r\nCarbohydrates: 71.18 g<br />\r\nSugars: 0.41<br />\r\nDietary fiber: 12.2 g<br />\r\nFat: 1.54 g<br />\r\nProtein: 12.61 g<br />\r\n<strong>Vitamins</strong><br />\r\nThiamine (B1): (33%) 0.383 mg<br />\r\nRiboflavin (B2): (10%) 0.115 mg<br />\r\nNiacin (B3): (36%) 5.464 mg<br />\r\nPantothenic acid (B5): (19%) 0.954 mg<br />\r\nVitamin B6: (23%) 0.3 mg<br />\r\nFolate (B9): (10%) 38 μg<br />\r\nVitamin E: (7%) 1.01 mg<br />\r\nVitamin K: (2%) 1.9 μg<br />\r\n<strong>Trace metals</strong><br />\r\nCalcium: (3%) 29 mg<br />\r\nIron: (25%) 3.19 mg<br />\r\nMagnesium: (35%) 126 mg<br />\r\nManganese: (190%) 3.985 mg<br />\r\nPhosphorus: (41%) 288 mg<br />\r\nPotassium: (8%) 363 mg<br />\r\nSodium: (0%) 2 mg<br />\r\nZinc: (28%) 2.65 mg<br />', 'wheat-flour-and-plant.jpg', 45.00, 'Kg'),
(5, 1, 'Moong Daal (मुंग दाल)', 'The mung bean (Vigna radiata), alternatively known as the moong bean, green gram, Lentil, but not Mungo, is a plant species in the legume family. Native to the Indian subcontinent, the mung bean is mainly cultivated today in India, China, and Southeast Asia. It is also cultivated in hot, dry regions in Southern Europe and the Southern United States. It is used as an ingredient in both savory and sweet dishes.', '<strong>Nutritional value per 100 g</strong><br />\r\nEnergy: 1,452 kJ (347 kcal)<br />\r\nCarbohydrates: 62.62 g<br />\r\nSugars: 6.6 g<br />\r\nDietary fiber: 16.3 g<br />\r\nFat: 1.15 g<br />\r\nProtein: 23.86 g<br />\r\n<strong>Vitamins</strong><br />\r\nThiamine (B1): (54%) 0.621 mg<br />\r\nRiboflavin (B2): (19%) 0.233 mg<br />\r\nNiacin (B3): (15%) 2.251 mg<br />\r\nPantothenic acid (B5): (38%) 1.91 mg<br /><br />\r\nVitamin B6: (29%) 0.382 mg<br />\r\nFolate (B9): (156%) 625 μg<br />\r\nVitamin C: (6%) 4.8 mg<br />\r\nVitamin E: (3%) 0.51 mg<br />\r\nVitamin K: (9%) 9 μg<br />\r\n<strong>Trace metals</strong><br />\r\nCalcium: (13%) 132 mg<br />\r\nIron: (52%) 6.74 mg<br />\r\nMagnesium: (53%) 189 mg<br />\r\nManganese: (49%) 1.035 mg<br />\r\nPhosphorus: (52%) 367 mg<br />\r\nPotassium: (27%) 1246 mg<br />\r\nZinc: (28%) 2.68 mg', 'green-pulse-moong-dehusked.jpg', 135.00, 'Kg'),
(6, 3, 'Crunchy Pistacheo', 'The pistachio (/pɪˈstæʃiˌoʊ/, -/stɑːʃiˌoʊ/, Persian: پسته‎; Pistacia vera) a member of the cashew family, is a small tree originally from Central Asia and the Middle East.[1][2] Pistachio trees can be found in regions of Iran, Syria, Lebanon, Turkey, Greece, Xinjiang (China), Tunisia, Kyrgyzstan, Tajikistan, Turkmenistan, India, Egypt, Italy (Sicily), Uzbekistan, Afghanistan (especially in the provinces of Samangan and Badghis), and the United States, specifically in California. It is indigenous to the eastern Mediterranean (Cyprus and Turkey to Israel and Syria), Central Asia (Turkmenistan, Uzbekistan, Afghanistan, Tajikistan, and Kyrgyzstan) and Xinjiang.[3] The tree produces seeds that are widely consumed as food.\n\nPistacia vera often is confused with other species in the genus Pistacia that are also known as pistachio. These species can be distinguished from P. vera by their geographic distributions (in the wild), and their seeds which are much smaller and have a shell that is soft.', '<strong>Amount Per 1 cup (207 g)</strong><br />\nCalories 706<br />\n% Daily Value*<br />\nTotal Fat: 3.4 g	5%<br />\nSaturated fat: 0.2 g 1%<br />\nPolyunsaturated fat: 2.2 g	<br />\nMonounsaturated fat: 0.2 g	<br />\nCholesterol:  0 mg	0%<br />\nSodium:  79 mg	3%<br />\nPotassium: 2,035 mg	58%<br />\nTotal Carbohydrate: 122 g 40%<br />\nDietary fiber 38 g: 152%<br />\nProtein 52 g: 104%<br />\nVitamin A: 0%	<br />\nVitamin C: 0%<br />\nCalcium: 28%	<br />\nIron: 87%<br />\nVitamin D: 0%<br />\nVitamin B-6: 30%<br />\nVitamin B-12: 0%<br />\nMagnesium: 138%<br />', 'Pistachio-with-and-without-shell.jpg', 950.00, 'Kg');
INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `nutritional_value`, `image`, `price`, `unit`) VALUES
(7, 3, 'Crunchy fresh Almond (हाडे बदाम)', 'The almond (/ɑːmənd/) हाडे बदाम (Prunus dulcis, syn. Prunus amygdalus, Amygdalus communis, Amygdalus dulcis) is a species of tree native to the Middle East and South Asia. \n<br /><br />\nThe almond is a nutritionally dense food and is a rich source of vitamin E, containing 26 mg per 100 g. They are also rich in dietary fiber, B vitamins, essential minerals such as magnesium, copper, manganese, calcium, and potassium as well as monounsaturated fats and polyunsaturated fats (see nutrient table), fats which potentially may lower LDL cholesterol.[43] Typical of nuts and seeds, almonds also contain phytosterols such as Beta-sitosterol, stigmasterol, campesterol, sitostanol, and campestanol, which have been associated with cholesterol-lowering properties.[43]\n<br /><br />\nPreliminary research associates consumption of almonds with elevated blood levels of high density lipoproteins and lower low density lipoproteins.[43]\n\nAlmonds may cause allergy or intolerance. Cross-reactivity is common with peach allergens (lipid transfer proteins) and tree nut allergens. Symptoms range from local signs and symptoms (e.g., oral allergy syndrome, contact urticaria) to systemic signs and symptoms including anaphylaxis (e.g., urticaria, angioedema, gastrointestinal and respiratory symptoms).[44]\n<br /><br />\nDuring the digestion process in humans, almond flour may be fermented into short-chain fatty acids, most notably butyrate which is a substrate for cells lining the large intestine', '<strong>Nutritional value per 100 g</strong><br />\nEnergy: 2,408 kJ (576 kcal)<br />\nCarbohydrates: 21.69 g<br />\nStarch: 0.74 g<br />\nSugars: 3.89 g<br />\nDietary fiber: 12.2 g<br />\n<strong>Fat: 49.42 g</strong><br />\nSaturated: 3.731 g<br />\nMonounsaturated: 30.889 g<br />\nPolyunsaturated: 12.070 g<br />\n<strong>Protein: 21.22 g</strong><br />\nTryptophan: 0.214 g<br />\nThreonine: 0.598 g<br />\nIsoleucine: 0.702 g<br />\nLeucine: 1.488 g<br />\nLysine: 0.580 g<br />\nMethionine: 0.151 g<br />\nCystine: 0.189 g<br />\nPhenylalanine: 1.120 g<br />\nTyrosine: 0.452 g<br />\nValine: 0.817 g<br />\nArginine: 2.446 g<br />\nHistidine: 0.557 g<br />\nAlanine: 1.027 g<br />\nAspartic acid: 2.911 g<br />\nGlutamic acid: 6.810 g<br />\nGlycine: 1.469 g<br />\nProline: 1.032 g<br />\nSerine: 0.948 g<br />\n<strong>Vitamins</strong><br />\nVitamin A beta-carotene: 1 μg<br />\nVitamin A lutein zeaxanthin: (0%) 1 μg<br />\nVitamin A: 1 IU<br />\nThiamine (B1): (18%) 0.211 mg<br />\nRiboflavin (B2): (85%) 1.014 mg<br />\nNiacin (B3): (23%) 3.385 mg<br />\nPantothenic acid (B5): (9%) 0.469 mg<br />\nVitamin B6: (11%) 0.143 mg<br />\nFolate (B9): (13%) 50 μg<br />\nCholine: (11%) 52.1 mg<br />\nVitamin E:  (175%) 26.2 mg<br />\nVitamin K: (0%) 0.0 μg<br />\n<strong>Trace metals</strong><br />\nCalcium: (26%) 264 mg<br />\nIron: (29%) 3.72 mg<br />\nMagnesium: (75%) 268 mg<br />\nManganese: (109%) 2.285 mg<br />\nPhosphorus: (69%) 484 mg<br />\nPotassium: (15%) 705 mg<br />\nSodium: (0%)1 mg<br />\nZinc: (32%) 3.08 mg<br />\n<strong>Other constituents</strong><br />\nWater: 4.70 g', 'almond1.jpg', 850.00, 'Kg'),
(8, 4, 'Wai Wai Noodles (वाइ वाइ चाउचाउ)', 'Wai Wai Noodles is popular noodles in Nepal. It is pre-cooked and flavoured before packaging and can be eaten directly from packet or it can be boiled to make noodle soup. You can add any type of vegetable, meat or eggs to it. It contains noodles cake and separate small packets of taste enhancer, oil and chilly powder. You can enhance your taste with these additions or eat only the noodles. It is up to you', '<strong>Per packet of Noodles</strong><br />\r\nCalories: 	270<br />\r\nSodium: 	930 mg<br />\r\n<strong>Total Fat: 	9 g</strong><br />\r\nSaturated 	6 g<br />\r\nMonounsaturated: 	0 g<br />\r\nTrans: 	3 g<br />\r\nPolyunsaturated: 	0 g<br />\r\nCholesterol 	0 mg<br />\r\nPotassium: 	0 mg<br />\r\nTotal Carbs: 	41 g<br />\r\nDietary Fiber: 	2 g<br />\r\nSugars: 	2 g<br />\r\nProtein: 	7 g<br />\r\nVitamin A: 	4%<br />\r\nCalcium: 	2%<br />\r\nVitamin C: 	6%<br />\r\nIron: 	4%\r\n\r\n\r\n', 'wai-wai-veg-masala-noodles.jpg', 15.00, 'Packet');
INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `nutritional_value`, `image`, `price`, `unit`) VALUES
(9, 4, 'Furundana (फुरुन्दाना)', 'Furundana (फुरुन्दाना)(घिउमा फुराएको दाना) is the traditional rice crispy mixed with other nuts and salty tit-bits. It is prepared by frying the beaten rice, then mixing it with other salty titbits. It can be taken as snack.\n\nFurandana is a popular delicacy enjoyed over all of Nepal. This beloved food is a wonder snack having beaten rice as its core constituent. The dish is taken as lunch or an in-between-snack with tea.\n\nA country of traditional living and of traditional eating, furandana is a combination of different local products which keeps the taste unique and fresh, somewhat representing the country we live in where people of different sects and background find a way to live in harmony.\n\nThere can be no Nepali who is not familiar with furandana. We are stocked with this snack consisting of nuts, seeds, lentils, peas, rice flakes, potato sticks and dry fruits. It is a flexible dish and is never made with fixed proportions. Each family improvises on the recipe. Although it consists of a lot of ingredients, it is relatively easy to make, with little skill and work. The ingredients are easily available at grocery stories and a stock of the furandana can be prepared and stored up to six months to be enjoyed later.', 'This food id high in calories, fat and carbohydrates. It contains vitamins from other added nuts and raisins.', 'furandana-snack.jpg', 80.00, 'Packet'),
(10, 5, 'Potato (आलु)', 'The potato is very rich for carbohydrates.It also contains vitamins and minerals, as well as an assortment of phytochemicals, such as carotenoids and natural phenols. It is available in different variety.\r\n\r\nWe deliver you similarly sized potato so it is easier for you to cook and process. It is available in Red and White color. You can also purchase Tasty Himalayan potato. It is available in small size, medium size and large size. You can order according to your needs.', '<strong>Nutritional value per 100 g</strong><br />\r\nEnergy: 	321 kJ (77 kcal)<br />\r\nCarbohydrates:	17.47 g<br />\r\nStarch: 	15.44 g<br />\r\nDietary fiber: 	2.2 g<br />\r\nFat:	0.1 g<br />\r\nProtein:	2 g<br />\r\n<strong>Vitamins</strong><br />\r\nThiamine (B1): 	(7%) 0.08 mg<br />\r\nRiboflavin (B2): 	(3%) 0.03 mg<br />\r\nNiacin (B3): 	(7%) 1.05 mg<br />\r\nPantothenic acid (B5):	(6%) 0.296 mg<br />\r\nVitamin B6: 	(23%) 0.295 mg<br />\r\nFolate (B9): 	(4%) 16 μg<br />\r\nVitamin C: 	(24%) 19.7 mg<br />\r\nVitamin E: 	(0%) 0.01 mg<br />\r\nVitamin K: 	(2%) 1.9 μg<br />\r\n<strong>Trace metals</strong><br />\r\nCalcium: 	(1%) 12 mg<br />\r\nIron: 	(6%) 0.78 mg<br />\r\nMagnesium: 	(6%) 23 mg<br />\r\nManganese: 	(7%) 0.153 mg<br />\r\nPhosphorus: 	(8%) 57 mg<br />\r\nPotassium: 	(9%) 421 mg<br />\r\nSodium: 	(0%) 6 mg<br />\r\nZinc: 	(3%) 0.29 mg<br />', 'medium-long-white-potato.jpg', 150.00, 'Dhak (5 Kg)'),
(11, 5, 'Sweet Potato (शखर खण्ड)', 'Sweet potato is generally boiled and eaten during fasting in Nepal. It is tasty, rich source of carbohydrates and other vitamins and minerals. It is very rich in dietary fiber, low in fat, so good for patients of blood pressure. It is available in Red and white variety.\r\n', '<strong>Nutritional value per 100 g (3.5 oz)</strong><br />\r\nEnergy: 	359 kJ (86 kcal)<br />\r\nCarbohydrates:	20.1 g<br />\r\nStarch: 	12.7 g<br />\r\nSugars: 	4.2 g<br />\r\nDietary: fiber 	3 g<br />\r\nFat:	0.1 g<br />\r\nProtein:	 1.6 g<br />\r\n<strong>Vitamins</strong><br />\r\nVitamin A equiv.:	(89%)709 μg<br />\r\nbeta-carotene:	(79%) 8509 μg<br />\r\nThiamine (B1): 	(7%) 0.078 mg<br />\r\nRiboflavin (B2): 	(5%) 0.061 mg<br />\r\nNiacin (B3): 	(4%) 0.557 mg<br />\r\nPantothenic acid (B5):	(16%) 0.8 mg<br />\r\nVitamin B6: 	(16%) 0.209 mg<br />\r\nFolate (B9): 	(3%) 11 μg<br />\r\nVitamin C: 	(3%) 2.4 mg<br />\r\nVitamin E: 	(2%) 0.26 mg<br />\r\n<strong>Trace metals</strong><br />\r\nCalcium: 	(3%) 30 mg<br />\r\nIron: 	(5%) 0.61 mg<br />\r\nMagnesium: 	(7%) 25 mg<br />\r\nManganese: 	(12%) 0.258 mg<br />\r\nPhosphorus: 	(7%) 47 mg<br />\r\nPotassium: 	(7%)337 mg<br />\r\nSodium: 	(4%) 55 mg<br />\r\nZinc: 	(3%)0.3 mg<br />', 'red-small-sweet-potato.jpg', 80.00, 'Kg'),
(12, 4, 'Soan Papadi', 'Soan Papadi is very sweet', 'Soad Papadi is very high in carbohydrate and fat', 'sweet-soan-papdi-01.jpg', 875.00, 'Packet');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL,
  `previllege` varchar(15) COLLATE utf16_bin NOT NULL DEFAULT 'buyer',
  `first_name` varchar(100) COLLATE utf16_bin NOT NULL,
  `last_name` varchar(100) COLLATE utf16_bin NOT NULL,
  `email` varchar(100) COLLATE utf16_bin NOT NULL,
  `username` varchar(100) COLLATE utf16_bin NOT NULL,
  `password` varchar(100) COLLATE utf16_bin NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(200) COLLATE utf16_bin NOT NULL,
  `address2` varchar(200) COLLATE utf16_bin NOT NULL,
  `phone` varchar(25) COLLATE utf16_bin NOT NULL,
  `city` varchar(100) COLLATE utf16_bin NOT NULL,
  `state` varchar(100) COLLATE utf16_bin NOT NULL,
  `last_logon_ip` varchar(20) COLLATE utf16_bin NOT NULL,
  `geolocation` varchar(100) COLLATE utf16_bin NOT NULL,
  `last_active` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `previllege`, `first_name`, `last_name`, `email`, `username`, `password`, `join_date`, `address`, `address2`, `phone`, `city`, `state`, `last_logon_ip`, `geolocation`, `last_active`) VALUES
(1, 'admin', 'Prabhu', 'Bhakta', 'dpr@yahoo.com', 'dprabin', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-20 09:38:34', 'Kannad Place, Shanker Road 344', 'Opposite Main Rail Station, Rohini', '9876543210', 'New Delhi', 'India', '::1', 'country=+-+, state=not+found, town=not+found', '2015-05-14 10:42:18'),
(2, 'buyer', 'Amrit', 'Man', 'amr@gmail.com', 'amritms', 'e10adc3949ba59abbe56e057f20f883e', '2015-01-20 09:38:34', 'Bagdurbar road 220/50', 'Baghdurbar, Sundhara', '9876543210', 'Kathmandu', 'Nepal', '::1', 'country=+-+, state=not+found, town=not+found', '2015-01-31 10:55:10'),
(3, 'buyer', 'Chuda Raj', 'Uprety', 'cru@paan.org', 'cruprety', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-23 10:51:10', 'Railway Colony, Colony Road 56', 'Railway Satation', '8664537272', 'Hydrabad', 'India', '', '', '2015-01-25 10:03:43'),
(4, 'buyer', 'Ram Kaji', 'Adhikari', 'ramkaji@gmail.com', 'ramkaji', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-24 06:04:35', 'Kanle Dee, Dhikure road, House No 250/60', '200 Meters North of Shree Bhawani Prathamik School', '9851098765', 'Nuwakot, Bidur', 'Nepal', '::1', 'country=+-+, state=not+found, town=not+found', '2015-01-31 10:53:07'),
(5, 'admin', 'Administrator', 'Cheap and Best', 'admin@srfp.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2015-01-28 06:21:17', 'Santa Karam 33 St.', 'Little American District', '0018654434567', 'Minnisota', 'United States', '::1', 'country=+-+, state=not+found, town=not+found', '2015-01-28 17:26:21'),
(6, 'buyer', 'Ram', 'Chaudhari', 'rchaudhari@gmail.com', 'rchaudhari', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-28 09:36:07', 'Mahendra Road, House Number 344/15', 'Near Mahendra Shalik', '9876543210', 'Kailali', 'Nepal', '::1', 'country=+-+, state=not+found, town=not+found', '2015-01-28 10:36:07'),
(7, 'buyer', 'Barrack', 'Obama', 'barrack@obama.com', 'bobama', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-28 10:02:53', 'White house', 'Near Blue House', '1234567890', 'Washington', 'United States', '::1', 'country=+-+, state=not+found, town=not+found', '2015-01-28 11:02:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allwords`
--
ALTER TABLE `allwords`
 ADD PRIMARY KEY (`doc_id`,`word`), ADD UNIQUE KEY `doc_id` (`doc_id`,`word`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
