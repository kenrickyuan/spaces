import "bootstrap";
import $ from 'jquery';
import 'select2';
import iniDatePicker from "../plugins/datepicker"

iniDatePicker();

const initSelect2 = () => {
  $('.select2').select2({ width: '100%' }); // (~ document.querySelectorAll)
};

initSelect2();
