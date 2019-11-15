import "bootstrap";
import $ from 'jquery';
import 'select2';
import iniDatePicker from "../plugins/datepicker"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

iniDatePicker();

const initSelect2 = () => {
  $('.select2').select2({ width: '100%' }); // (~ document.querySelectorAll)
};

initSelect2();


initMapbox();

