document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('div.actions').querySelector('input')

  if (control) {control.addEventListener('click', comparePassword)}
})

function comparePassword() {
  var form = document.querySelector('form')
  var password1 = document.querySelector('input#user_password').value
  var password2 = document.querySelector('input#user_password_confirmation').value

  if (password1 == "") {
    return;
  }

  if (password1 != password2) {
    document.querySelector('svg#failure').classList.remove('hide')
  } else {
    document.querySelector('svg#success').classList.remove('hide')
  }
}
