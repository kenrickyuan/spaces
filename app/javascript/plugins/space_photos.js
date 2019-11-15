let n = 1

const addNewButton = () => {
  console.log(n)
  const html = '<div class="field">' +
    '<div class="form-group file optional space_space_attachments_photo">' +
      '<input class="form-control-file file optional" type="file" name="space[space_attachments_attributes][' + n + '][photo]" id="space_space_attachments_attributes_' + n + '_photo">' +
    '</div>' +
  '</div>';
  n += 1
  const formElement = document.querySelector(".space_space_attachments_photo");

  formElement.insertAdjacentHTML('beforeend', html);
}

const initMultiplePhotos = () => {


  const addPhotoBtn = document.querySelector('.add-photo-btn');

  addPhotoBtn.addEventListener('click', addNewButton);
}

export default initMultiplePhotos;
