import datetimepicker from "jquery-datetimepicker"

const iniDatePicker = () => {
  $('.picker').datetimepicker({
    timepicker: true,
    datepicker: true,
    format: 'Y-m-d H:i',
    value: '2019-11-12 09:45',
    hours12: false,
    step: 30,
    yearStart: 2019,
    yearEnd: 2021
  })
}
export default iniDatePicker
