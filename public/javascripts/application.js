// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function acceptFriendship(id) {
    $.ajax({
        url: '/friends/accept_friendship?id=' + id,
        method: 'GET'
    })
    .success(function (data){
        if (data.errors) {
        
        } else {
        
        }
    });
}

function cancelFriendship(id) {
    $.ajax({
        url: '/friends/cancel_friendship?id=' + id,
        method: 'GET'
    })
    .success(function (data){
        if (data.errors) {
        
        } else {
        
        }
    });
}

function removeFriendship(id) {
    $.ajax({
        url: '/friends/remove_friendship?id=' + id,
        method: 'GET'
    })
    .success(function (data){
        if (data.errors) {
        
        } else {
        
        }
    });
}
