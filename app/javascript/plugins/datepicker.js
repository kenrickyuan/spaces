import datetimepicker from "jquery-datetimepicker"

const iniDatePicker = () => {
  $('.picker').datetimepicker({
    timepicker: false,
    datepicker: true,
    format: 'Y-m-d',
    value: '2019-11-12',
    weeks: true
  })
}
export default iniDatePicker
