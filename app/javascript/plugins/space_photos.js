let n = 1

const addNewButton = () => {
  console.log(n)
  const html = '<div class="field">' +
    '<div class="form-group file optional space_space_attachments_photo">' +
      '<label class="file optional" for="space_space_attachments_attributes_' + n + '_photo">Photo</label>' +
      '<input class="form-control-file file optional" type="file" name="space[space_attachments_attributes][' + n + '][photo]" id="space_space_attachments_attributes_' + n + '_photo">' +
    '</div>' +
  '</div>';
  n += 1
  const formElement = document.getElementById('new_space');

  formElement.insertAdjacentHTML('beforeend', html);
}

const initMultiplePhotos = () => {


  const addPhotoBtn = document.querySelector('.add-photo-btn');

  addPhotoBtn.addEventListener('click', addNewButton);
}

export default initMultiplePhotos;
