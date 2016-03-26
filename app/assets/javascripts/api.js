function sendInfoToApi(event,action,data) {
  event.preventDefault()
  var data = {
  // Build a new character from the values in the form
    action: action ,
    data: data ,
  };
  var request = $.post('/api/main', data)
  request.fail(showError);
  request.done();

  $formAlerts.empty()

  function showError (error) {
    console.error('Error processing request.', '\n' + error.responseText);
  }

}



//  $('[data-hook~=tourney-add]').on('click', sendInfoToApi(action,data)) //