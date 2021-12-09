function approveAccount(btn){

    // get row containing button
    var tableRow = btn.parentNode.parentNode

    // get username and email
    var role = tableRow.cells[0].innerHTML
    var name = tableRow.cells[1].innerHTML
    var email = tableRow.cells[2].innerHTML

    var postData = {}
    postData["email"] = email
    postData["role"] = role

    $.post("approve_new_account", postData, function(data, status){});

}