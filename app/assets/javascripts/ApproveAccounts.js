function approveAccount(btn){

    // get row containing button
    var tableRow = btn.parentNode.parentNode

    // get username and email
    var name = tableRow.cells[0].innerHTML
    var email = tableRow.cells[1].innerHTML

    var postData = {}
    postData["email"] = email

    $.post("approve_new_account", postData, function(data, status){});

}