'use strict';

var L = require('leaflet');
var api = require('./api');

L.Icon.Default.imagePath = 'css/images/';

var initCenter = L.latLng(3.0404532000000004, 101.5531605);
var initZoom = 13;

var attribution = "";

var tileLayer = L.tileLayer(api.tileLayer, "");

// Define a valid bounding box here in order to restrict map view and
// place definition.
var maxBounds = undefined;

// Optional minZoom value.
var minZoom = undefined;

var map = L.map('map', {layers: [tileLayer], attributionControl: false })
    .setView(initCenter, initZoom)
    .setMaxBounds(maxBounds)
    .setMinZoom(minZoom);

// Palette partly borrowed from https://clrs.cc/
var routeColors = [
  // '#0074D9',   // blue
  '#FF851B',   // orange
  //'#B10DC9',   // purple
  '#2ECC40',   // green
  '#FFDC00',   // yellow
  '#F012BE',   // fuchsia
  '#01FF70',   // lime
  '#999999',   // gray
  '#001f3f',   // navy
  '#FF4136',   // red
  '#85144b',   // maroon
  '#3D9970',   // olive
  '#39CCCC',   // teal
  
  '#E1DCD9', // mushroom
  '#8F8681', // elephant
  '#A67f78', // THATCH
  '#32435F', // GUNMETAL

  '#FFD954', // Mustard
  '#E4B660', //dijon
  '#F2AB39', // honey
  '#Chestnut', // chestnut

  '#D1EDF1', //SWARS DOWN
  '#7BC5AE', // LARCHMERE
  '#028C6A', //OBSERVATORY 
  '#003E19', // Kaitoke

  '#D1DDDB', //Pistachio
  '#85B8CB', // turquoise
  '#1D6A96', //cerulean 
  '#283B42', // spruce

  '#D5D2C1', //Linen
  '#BD8E62', // twiine
  '#A46843', //fawn 
  '#370D00', // hickory

  '#9BCFB8', //Cool mint
  '#7FB174', // succulent
  '#689C97', //juniper 
  '#072A24', // brunswick

  '#FFC2C3', //Cool mint
  '#FE7773', // succulent
  '#81E25', //juniper 
  '#0E0301', // brunswick

  '#ECE4E2', //Cool mint
  '#FCD3D1', // succulent
  '#FCDFF3', //juniper 
  '#FE929F', // brunswick

  '#D3B7D8', //Cool mint
  '#A13E97', // succulent
  '#632A7E', //juniper 
  '#280E3B', // brunswick

  '#B78338', //Cool mint
  '#915C4CC', // succulent
  '#40686A', //juniper 
  '#2F1812', // brunswick
  
  '#E3A6A1', //Cool mint
  '#BC5F6AC', // succulent
  '#19B3B1', //juniper 
  '#034B61', // brunswick
  
  '#BDBDBF', //Cool mint
  '#5580A0', // succulent
  '#CC8A4D', //juniper 
  '#32435F', // brunswick

  '#B2A59F', //Cool mint
  '#023459', // succulent
  '#1E646E', //juniper 
  '#002C2F', // brunswick
  
  '#B98D72', //Cool mint
  '#AE4951', // succulent
  '#57233A', //juniper 
  '#161B1F', // brunswick
  
  '#FAD68D', //Cool mint
  '#A88661', // succulent
  '#504E63', //juniper 
  '#00142F', // brunswick

  '#B98D72', //Cool mint
  '#AE4951', // succulent
  '#57233A', //juniper 
  '#161B1F', // brunswick
  
  '#CCD3D9', //Cool mint
  '#FFD5D9', // succulent
  '#7E212C', //juniper 
  '#321E17', // brunswick

  '#E4DACF', //Cool mint
  '#E5BB4B', // succulent
  '#498EAF', //juniper 
  '#631F16', // brunswick
  
  '#E2DD66', //Cool mint
  '#9A1B27', // succulent
  '#747BA9', //juniper 
  '#3B3857', // brunswick

  '#0359AE', //Cool mint
  '#14B09B', // succulent
  '#EBE5D9', //juniper 
  '#CC8A56', // brunswick
  
  '#A6C2CE', //Cool mint
  '#9C8F96', // succulent
  '#EBC57C', //juniper 
  '#6B799E', // brunswick
];

module.exports = {
  map: map,
  maxBounds: maxBounds,
  initCenter: initCenter,
  initZoom: initZoom,
  tileLayer: tileLayer,
  opacity: 0.6,
  labelOpacity: 0.9,
  weight: 12,
  routeColors: routeColors,
  startColor: '#48b605',
  endColor: '#e9130a',
  jobColor: '#3388ff',
  jobRadius: 6,
  unassignedColor: '#111111',
  unassignedRadius: 15
};
